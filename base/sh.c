// Shell.

#include "types.h"
#include "user.h"
#include "fcntl.h"

// Parsed command representation
#define EXEC  1
#define REDIR 2
#define PIPE  3
#define LIST  4
#define BACK  5

#define MAXHIST 10          // hist stores max 10 commands

#define MAXARGS 10 

struct cmd {
  int type;
};

struct execcmd {
  int type;
  char *argv[MAXARGS];
  char *eargv[MAXARGS];
};

struct redircmd {
  int type;	
  struct cmd *cmd;	//takes the command that is passed as an argument
  char *file;		//stores the file passed
  char *efile;		
  int mode;		//in fcntl.h file
  int fd;		//file descriptor: 0 for stdin, 1 for stdout
};

struct pipecmd {
  int type;
  struct cmd *left;
  struct cmd *right;
};

struct listcmd {
  int type;
  struct cmd *left;
  struct cmd *right;
};

struct backcmd {
  int type;
  struct cmd *cmd;
};

int fork1(void);  // Fork but panics on failure.
void panic(char*);
struct cmd *parsecmd(char*);
char* hist(char *param, int status, char *history[]);

// Execute cmd.  Never returns.
void
runcmd(struct cmd *cmd)
{
  int p[2];
  struct backcmd *bcmd;
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;
  
  if(cmd == 0)
    exit();

  switch(cmd->type){
  default:
    panic("runcmd");

  case EXEC:
    ecmd = (struct execcmd*)cmd;
    if(ecmd->argv[0] == 0)
      exit();
    exec(ecmd->argv[0], ecmd->argv);
    printf(2, "exec %s failed\n", ecmd->argv[0]);
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;	//cast cmd to redircmd for the redir case
    
    char *rfile = rcmd->file;  		//create a local variable rfile to store the rcmd file
    int rmode = rcmd->mode;		//store the read-write mode into a local var (fcntl.h)
    					    //O_CREATE - creates file if doesn't exist 
    					    //O_RDONLY - read only
    					    //O_WRONLY - write only
    					    //O_RDWR - read and write
    int rfd = open(rfile, rmode);	//open the output file using rfile and rmode as arguments
    
    close(rcmd->fd);			//close the file descriptor rcmd->fd
    dup(rfd);				//dup file descriptor - makes copy of rfd (dup2 not defined)
    close(rfd);				//close rfd now that it's been duplicated
    
    runcmd(rcmd->cmd);			//run command using the redirected file descriptor
    
    break;

  case LIST: //HEY GUYS IM 90% THIS WORKS, IF THIS IS WRONG< MAYBE SWAP THE wait() with runcmd 115-116, but this is the easy part
    lcmd = (struct listcmd*) cmd;

    int pid1 = fork1();

    if (pid1 ==0){
      //child
      runcmd(lcmd->left);
    }
    else{
      wait();
      runcmd(lcmd->right);
    }
   
    break;

  case PIPE:
    pcmd = (struct pipecmd*)cmd;

    pipe(p);

    if(fork1() == 0) {
      close(1);
      dup(p[1]);
      close(p[0]);
      close(p[1]);
      runcmd(pcmd->left);
    }

    if(fork1() == 0) {
      close(0);
      dup(p[0]);
      close(p[0]);
      close(p[1]);
      runcmd(pcmd->right);
    }

    close(p[0]);
    close(p[1]);

    wait();
    wait();
    break;

  case BACK: //oh boy so i dont really know if this is going to work at all...

    bcmd = (struct backcmd*) cmd;

    int pid2 = fork1();

    if (pid2 == 0){
      //child means BACKGROUND PROCESS i know this much! this is the __proccess__ before the &
      runcmd(bcmd->cmd); //pretty sure this is right

    }
      //parent means figure out how to use my very own waitpid(no args) once and clean up 
      //int neverUsedAgain = waitpid(); //dont need to store, just for gathering, actual stuff happens in kernel space
      
      //i dont think the parent should do anything else??? im gonna keep looping the waitpid() above in the main() function here
    
    break;

  }
  exit();
}

int
getcmd(char *buf, int nbuf)
{
  printf(2, "$ ");
  memset(buf, 0, nbuf);
  gets(buf, nbuf);
  if(buf[0] == 0) // EOF
    return -1;
  return 0;
}

int
main(void)
{
  static char buf[100];
  int fd;
  char *history[MAXHIST];

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
    if(fd >= 3){
      close(fd);
      break;
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){

    //BACKGROUNDING PROCESS.... currently, shell is parent, runcmd("_command_ &") is child, background process is grandchild... see if any zombies of runcmd("command" &) exist? maybe 
    int neverUsed = waitpid(); //this will just keep checking to see if the child of something

    //see guys this is my real problem here because i dont understand how to check the status of a grandchild of a process we don't even know about.
    //Since i'm calling this from main(), we have no idea about the child in question, much less the grandchild zombie process...
    //if you have any ideas, i would be happy to hear them!

    // parse for hist
    if(buf[0] == 'h' && buf[1] == 'i' && buf[2] == 's' && buf[3] == 't' && buf[4] == ' '){
      if(buf[5] == 'p' && buf[6] == 'r' && buf[7] == 'i' && buf[8] == 'n' && buf[9] == 't'){
        hist(buf, 1, &history);                        // print history (prints thru the function)
      } 
      else if((atoi(buf+5) < 11) && (atoi(buf+5) > 0)){
        strcpy(buf, hist(buf+5, 0, &history));         // run cmd w/ param @ buf+5 (should just be an int)

        if(fork1() == 0)                               // run the command here since otherwise it'd get skipped b/c of 'continue' & 
          runcmd(parsecmd(buf));                       // this prevents the command from getting re added into history
        wait();
      } 
      else{
        printf(2, "cannot hist %s\n", buf+5);
      }
      continue;
    } 

    // adding command to history
    if(history[0] == '\0'){
      history[0] = malloc(strlen(buf)+1);              // have to malloc so strcpy doesnt dereference a null ( the +1 is to account for the null terminator)
      strcpy(history[0], buf);
    } 
    else{
      for(int i = MAXHIST; i > 0; i--){                // shift command list down
        history[i] = history[(i-1)]; 
      }
      history[0] = malloc(strlen(buf)+1);
      strcpy(history[0], buf);
    }
    
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      // Chdir must be called by the parent, not the child.
      buf[strlen(buf)-1] = 0;  // chop \n
      if(chdir(buf+3) < 0)
        printf(2, "cannot cd %s\n", buf+3);
      continue;
    }

    if(fork1() == 0)
      runcmd(parsecmd(buf));
    wait();
  }

  for(int i = 0; i < MAXHIST; i++){                    // freeing memory to get rid of leaks
    if(history[i] != '\0'){
        free(history[i]);
    }
  }

  exit();
}

// Determine what hist should do
// status == 1 --> print last 10 commands
// status == 0 --> run command 
char* hist(char *param, int status, char *history[]){
  if(status == 1){
    for(int i = 0; i < MAXHIST; i++){
      if(history[i] != '\0'){                          // since history[] inializes everything to NULL @ beginning (we don't want to see the empty history slots)
        printf(2, "Previous command %d: %s", i+1, history[i]);
      }
    }
    return "worked\n";                                 // not important return
  } 
  else if(status == 0){
    return history[atoi(param)-1];                     // returns command at (param - 1) in history
  } 
  else{
    return "nothing\n";                                // not important return
  }
}

void
panic(char *s)
{
  printf(2, "%s\n", s);
  exit();
}

int
fork1(void)
{
  int pid;

  pid = fork();
  if(pid == -1)
    panic("fork");
  return pid;
}

//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = EXEC;
  return (struct cmd*)cmd;
}

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = REDIR;
  cmd->cmd = subcmd;
  cmd->file = file;
  cmd->efile = efile;
  cmd->mode = mode;
  cmd->fd = fd;
  return (struct cmd*)cmd;
}

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = PIPE;
  cmd->left = left;
  cmd->right = right;
  return (struct cmd*)cmd;
}

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = LIST;
  cmd->left = left;
  cmd->right = right;
  return (struct cmd*)cmd;
}

struct cmd*
backcmd(struct cmd *subcmd)
{
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = BACK;
  cmd->cmd = subcmd;
  return (struct cmd*)cmd;
}
//PAGEBREAK!
// Parsing

char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
  char *s;
  int ret;

  s = *ps;
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
  case 0:
    break;
  case '|':
  case '(':
  case ')':
  case ';':
  case '&':
  case '<':
    s++;
    break;
  case '>':
    s++;
    if(*s == '>'){
      ret = '+';
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
    *eq = s;

  while(s < es && strchr(whitespace, *s))
    s++;
  *ps = s;
  return ret;
}

int
peek(char **ps, char *es, char *toks)
{
  char *s;

  s = *ps;
  while(s < es && strchr(whitespace, *s))
    s++;
  *ps = s;
  return *s && strchr(toks, *s);
}

struct cmd *parseline(char**, char*);
struct cmd *parsepipe(char**, char*);
struct cmd *parseexec(char**, char*);
struct cmd *nulterminate(struct cmd*);

struct cmd*
parsecmd(char *s)
{
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);
  cmd = parseline(&s, es);
  peek(&s, es, "");
  if(s != es){
    printf(2, "leftovers: %s\n", s);
    panic("syntax");
  }
  nulterminate(cmd);
  return cmd;
}

struct cmd*
parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
  while(peek(ps, es, "&")){
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
    gettoken(ps, es, 0, 0);
    cmd = listcmd(cmd, parseline(ps, es));
  }
  return cmd;
}

struct cmd*
parsepipe(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parseexec(ps, es);
  if(peek(ps, es, "|")){
    gettoken(ps, es, 0, 0);
    cmd = pipecmd(cmd, parsepipe(ps, es));
  }
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    tok = gettoken(ps, es, 0, 0);
    if(gettoken(ps, es, &q, &eq) != 'a')
      panic("missing file for redirection");
    switch(tok){
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    }
  }
  return cmd;
}

struct cmd*
parseblock(char **ps, char *es)
{
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    panic("parseblock");
  gettoken(ps, es, 0, 0);
  cmd = parseline(ps, es);
  if(!peek(ps, es, ")"))
    panic("syntax - missing )");
  gettoken(ps, es, 0, 0);
  cmd = parseredirs(cmd, ps, es);
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
    return parseblock(ps, es);

  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    if(tok != 'a')
      panic("syntax");
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
  int i;
  struct backcmd *bcmd;
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    return 0;

  switch(cmd->type){
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
      *ecmd->eargv[i] = 0;
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    nulterminate(rcmd->cmd);
    *rcmd->efile = 0;
    break;

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    nulterminate(pcmd->left);
    nulterminate(pcmd->right);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    nulterminate(lcmd->left);
    nulterminate(lcmd->right);
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  } 
  return cmd;
}
