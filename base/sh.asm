
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  return 0;
}

int
main(void)
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	push   -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	51                   	push   %ecx
       e:	83 ec 04             	sub    $0x4,%esp
  static char buf[100];
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
      11:	eb 0e                	jmp    21 <main+0x21>
      13:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      17:	90                   	nop
    if(fd >= 3){
      18:	83 f8 02             	cmp    $0x2,%eax
      1b:	0f 8f 96 00 00 00    	jg     b7 <main+0xb7>
  while((fd = open("console", O_RDWR)) >= 0){
      21:	83 ec 08             	sub    $0x8,%esp
      24:	6a 02                	push   $0x2
      26:	68 90 12 00 00       	push   $0x1290
      2b:	e8 63 0d 00 00       	call   d93 <open>
      30:	83 c4 10             	add    $0x10,%esp
      33:	85 c0                	test   %eax,%eax
      35:	79 e1                	jns    18 <main+0x18>
      37:	eb 2e                	jmp    67 <main+0x67>
      39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      40:	80 3d 22 19 00 00 20 	cmpb   $0x20,0x1922
      47:	0f 84 8d 00 00 00    	je     da <main+0xda>
      4d:	8d 76 00             	lea    0x0(%esi),%esi
int
fork1(void)
{
  int pid;

  pid = fork();
      50:	e8 f6 0c 00 00       	call   d4b <fork>
  if(pid == -1)
      55:	83 f8 ff             	cmp    $0xffffffff,%eax
      58:	0f 84 c1 00 00 00    	je     11f <main+0x11f>
    if(fork1() == 0)
      5e:	85 c0                	test   %eax,%eax
      60:	74 63                	je     c5 <main+0xc5>
    wait();
      62:	e8 f4 0c 00 00       	call   d5b <wait>
  printf(2, "$ ");
      67:	83 ec 08             	sub    $0x8,%esp
      6a:	68 d8 11 00 00       	push   $0x11d8
      6f:	6a 02                	push   $0x2
      71:	e8 3a 0e 00 00       	call   eb0 <printf>
  memset(buf, 0, nbuf);
      76:	83 c4 0c             	add    $0xc,%esp
      79:	6a 64                	push   $0x64
      7b:	6a 00                	push   $0x0
      7d:	68 20 19 00 00       	push   $0x1920
      82:	e8 49 0b 00 00       	call   bd0 <memset>
  gets(buf, nbuf);
      87:	58                   	pop    %eax
      88:	5a                   	pop    %edx
      89:	6a 64                	push   $0x64
      8b:	68 20 19 00 00       	push   $0x1920
      90:	e8 9b 0b 00 00       	call   c30 <gets>
  if(buf[0] == 0) // EOF
      95:	0f b6 05 20 19 00 00 	movzbl 0x1920,%eax
      9c:	83 c4 10             	add    $0x10,%esp
      9f:	84 c0                	test   %al,%al
      a1:	74 0f                	je     b2 <main+0xb2>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      a3:	3c 63                	cmp    $0x63,%al
      a5:	75 a9                	jne    50 <main+0x50>
      a7:	80 3d 21 19 00 00 64 	cmpb   $0x64,0x1921
      ae:	75 a0                	jne    50 <main+0x50>
      b0:	eb 8e                	jmp    40 <main+0x40>
  exit();
      b2:	e8 9c 0c 00 00       	call   d53 <exit>
      close(fd);
      b7:	83 ec 0c             	sub    $0xc,%esp
      ba:	50                   	push   %eax
      bb:	e8 bb 0c 00 00       	call   d7b <close>
      break;
      c0:	83 c4 10             	add    $0x10,%esp
      c3:	eb a2                	jmp    67 <main+0x67>
      runcmd(parsecmd(buf));
      c5:	83 ec 0c             	sub    $0xc,%esp
      c8:	68 20 19 00 00       	push   $0x1920
      cd:	e8 ce 09 00 00       	call   aa0 <parsecmd>
      d2:	89 04 24             	mov    %eax,(%esp)
      d5:	e8 b6 00 00 00       	call   190 <runcmd>
      buf[strlen(buf)-1] = 0;  // chop \n
      da:	83 ec 0c             	sub    $0xc,%esp
      dd:	68 20 19 00 00       	push   $0x1920
      e2:	e8 b9 0a 00 00       	call   ba0 <strlen>
      if(chdir(buf+3) < 0)
      e7:	c7 04 24 23 19 00 00 	movl   $0x1923,(%esp)
      buf[strlen(buf)-1] = 0;  // chop \n
      ee:	c6 80 1f 19 00 00 00 	movb   $0x0,0x191f(%eax)
      if(chdir(buf+3) < 0)
      f5:	e8 c9 0c 00 00       	call   dc3 <chdir>
      fa:	83 c4 10             	add    $0x10,%esp
      fd:	85 c0                	test   %eax,%eax
      ff:	0f 89 62 ff ff ff    	jns    67 <main+0x67>
        printf(2, "cannot cd %s\n", buf+3);
     105:	51                   	push   %ecx
     106:	68 23 19 00 00       	push   $0x1923
     10b:	68 98 12 00 00       	push   $0x1298
     110:	6a 02                	push   $0x2
     112:	e8 99 0d 00 00       	call   eb0 <printf>
     117:	83 c4 10             	add    $0x10,%esp
     11a:	e9 48 ff ff ff       	jmp    67 <main+0x67>
    panic("fork");
     11f:	83 ec 0c             	sub    $0xc,%esp
     122:	68 1e 12 00 00       	push   $0x121e
     127:	e8 44 00 00 00       	call   170 <panic>
     12c:	66 90                	xchg   %ax,%ax
     12e:	66 90                	xchg   %ax,%ax

00000130 <getcmd>:
{
     130:	55                   	push   %ebp
     131:	89 e5                	mov    %esp,%ebp
     133:	56                   	push   %esi
     134:	53                   	push   %ebx
     135:	8b 5d 08             	mov    0x8(%ebp),%ebx
     138:	8b 75 0c             	mov    0xc(%ebp),%esi
  printf(2, "$ ");
     13b:	83 ec 08             	sub    $0x8,%esp
     13e:	68 d8 11 00 00       	push   $0x11d8
     143:	6a 02                	push   $0x2
     145:	e8 66 0d 00 00       	call   eb0 <printf>
  memset(buf, 0, nbuf);
     14a:	83 c4 0c             	add    $0xc,%esp
     14d:	56                   	push   %esi
     14e:	6a 00                	push   $0x0
     150:	53                   	push   %ebx
     151:	e8 7a 0a 00 00       	call   bd0 <memset>
  gets(buf, nbuf);
     156:	58                   	pop    %eax
     157:	5a                   	pop    %edx
     158:	56                   	push   %esi
     159:	53                   	push   %ebx
     15a:	e8 d1 0a 00 00       	call   c30 <gets>
  if(buf[0] == 0) // EOF
     15f:	83 c4 10             	add    $0x10,%esp
     162:	80 3b 01             	cmpb   $0x1,(%ebx)
     165:	19 c0                	sbb    %eax,%eax
}
     167:	8d 65 f8             	lea    -0x8(%ebp),%esp
     16a:	5b                   	pop    %ebx
     16b:	5e                   	pop    %esi
     16c:	5d                   	pop    %ebp
     16d:	c3                   	ret
     16e:	66 90                	xchg   %ax,%ax

00000170 <panic>:
{
     170:	55                   	push   %ebp
     171:	89 e5                	mov    %esp,%ebp
     173:	83 ec 0c             	sub    $0xc,%esp
  printf(2, "%s\n", s);
     176:	ff 75 08             	push   0x8(%ebp)
     179:	68 8c 12 00 00       	push   $0x128c
     17e:	6a 02                	push   $0x2
     180:	e8 2b 0d 00 00       	call   eb0 <printf>
  exit();
     185:	e8 c9 0b 00 00       	call   d53 <exit>
     18a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000190 <runcmd>:
{
     190:	55                   	push   %ebp
     191:	89 e5                	mov    %esp,%ebp
     193:	56                   	push   %esi
     194:	53                   	push   %ebx
     195:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(cmd == 0)
     198:	85 db                	test   %ebx,%ebx
     19a:	74 24                	je     1c0 <runcmd+0x30>
  switch(cmd->type){
     19c:	83 3b 05             	cmpl   $0x5,(%ebx)
     19f:	0f 87 a4 00 00 00    	ja     249 <runcmd+0xb9>
     1a5:	8b 03                	mov    (%ebx),%eax
     1a7:	ff 24 85 c8 12 00 00 	jmp    *0x12c8(,%eax,4)
    printf(2, "List Not Implemented\n");
     1ae:	51                   	push   %ecx
     1af:	51                   	push   %ecx
     1b0:	68 f2 11 00 00       	push   $0x11f2
     1b5:	6a 02                	push   $0x2
     1b7:	e8 f4 0c 00 00       	call   eb0 <printf>
    break;
     1bc:	83 c4 10             	add    $0x10,%esp
     1bf:	90                   	nop
    exit();
     1c0:	e8 8e 0b 00 00       	call   d53 <exit>
    printf(2, "Backgrounding not implemented\n");
     1c5:	50                   	push   %eax
     1c6:	50                   	push   %eax
     1c7:	68 a8 12 00 00       	push   $0x12a8
     1cc:	6a 02                	push   $0x2
     1ce:	e8 dd 0c 00 00       	call   eb0 <printf>
    break;
     1d3:	83 c4 10             	add    $0x10,%esp
     1d6:	eb e8                	jmp    1c0 <runcmd+0x30>
    if(ecmd->argv[0] == 0)
     1d8:	8b 43 04             	mov    0x4(%ebx),%eax
     1db:	85 c0                	test   %eax,%eax
     1dd:	74 e1                	je     1c0 <runcmd+0x30>
    exec(ecmd->argv[0], ecmd->argv);
     1df:	52                   	push   %edx
     1e0:	52                   	push   %edx
     1e1:	8d 53 04             	lea    0x4(%ebx),%edx
     1e4:	52                   	push   %edx
     1e5:	50                   	push   %eax
     1e6:	e8 a0 0b 00 00       	call   d8b <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
     1eb:	83 c4 0c             	add    $0xc,%esp
     1ee:	ff 73 04             	push   0x4(%ebx)
     1f1:	68 e2 11 00 00       	push   $0x11e2
     1f6:	6a 02                	push   $0x2
     1f8:	e8 b3 0c 00 00       	call   eb0 <printf>
    break;
     1fd:	83 c4 10             	add    $0x10,%esp
     200:	eb be                	jmp    1c0 <runcmd+0x30>
    int fd = open(rcmd->file, rcmd->mode);
     202:	56                   	push   %esi
     203:	56                   	push   %esi
     204:	ff 73 10             	push   0x10(%ebx)
     207:	ff 73 08             	push   0x8(%ebx)
     20a:	e8 84 0b 00 00       	call   d93 <open>
     20f:	89 c6                	mov    %eax,%esi
    close(rcmd->fd);
     211:	58                   	pop    %eax
     212:	ff 73 14             	push   0x14(%ebx)
     215:	e8 61 0b 00 00       	call   d7b <close>
    dup(fd);
     21a:	89 34 24             	mov    %esi,(%esp)
     21d:	e8 a9 0b 00 00       	call   dcb <dup>
    close(fd);
     222:	89 34 24             	mov    %esi,(%esp)
     225:	e8 51 0b 00 00       	call   d7b <close>
    runcmd(rcmd->cmd);
     22a:	58                   	pop    %eax
     22b:	ff 73 04             	push   0x4(%ebx)
     22e:	e8 5d ff ff ff       	call   190 <runcmd>
    printf(2, "Pipe Not implemented\n");
     233:	52                   	push   %edx
     234:	52                   	push   %edx
     235:	68 08 12 00 00       	push   $0x1208
     23a:	6a 02                	push   $0x2
     23c:	e8 6f 0c 00 00       	call   eb0 <printf>
    break;
     241:	83 c4 10             	add    $0x10,%esp
     244:	e9 77 ff ff ff       	jmp    1c0 <runcmd+0x30>
    panic("runcmd");
     249:	83 ec 0c             	sub    $0xc,%esp
     24c:	68 db 11 00 00       	push   $0x11db
     251:	e8 1a ff ff ff       	call   170 <panic>
     256:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     25d:	8d 76 00             	lea    0x0(%esi),%esi

00000260 <fork1>:
{
     260:	55                   	push   %ebp
     261:	89 e5                	mov    %esp,%ebp
     263:	83 ec 08             	sub    $0x8,%esp
  pid = fork();
     266:	e8 e0 0a 00 00       	call   d4b <fork>
  if(pid == -1)
     26b:	83 f8 ff             	cmp    $0xffffffff,%eax
     26e:	74 02                	je     272 <fork1+0x12>
  return pid;
}
     270:	c9                   	leave
     271:	c3                   	ret
    panic("fork");
     272:	83 ec 0c             	sub    $0xc,%esp
     275:	68 1e 12 00 00       	push   $0x121e
     27a:	e8 f1 fe ff ff       	call   170 <panic>
     27f:	90                   	nop

00000280 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     280:	55                   	push   %ebp
     281:	89 e5                	mov    %esp,%ebp
     283:	53                   	push   %ebx
     284:	83 ec 10             	sub    $0x10,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     287:	6a 54                	push   $0x54
     289:	e8 62 0e 00 00       	call   10f0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     28e:	83 c4 0c             	add    $0xc,%esp
     291:	6a 54                	push   $0x54
  cmd = malloc(sizeof(*cmd));
     293:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     295:	6a 00                	push   $0x0
     297:	50                   	push   %eax
     298:	e8 33 09 00 00       	call   bd0 <memset>
  cmd->type = EXEC;
     29d:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  return (struct cmd*)cmd;
}
     2a3:	89 d8                	mov    %ebx,%eax
     2a5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     2a8:	c9                   	leave
     2a9:	c3                   	ret
     2aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000002b0 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     2b0:	55                   	push   %ebp
     2b1:	89 e5                	mov    %esp,%ebp
     2b3:	53                   	push   %ebx
     2b4:	83 ec 10             	sub    $0x10,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     2b7:	6a 18                	push   $0x18
     2b9:	e8 32 0e 00 00       	call   10f0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     2be:	83 c4 0c             	add    $0xc,%esp
     2c1:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     2c3:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     2c5:	6a 00                	push   $0x0
     2c7:	50                   	push   %eax
     2c8:	e8 03 09 00 00       	call   bd0 <memset>
  cmd->type = REDIR;
  cmd->cmd = subcmd;
     2cd:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = REDIR;
     2d0:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
     2d6:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
     2d9:	8b 45 0c             	mov    0xc(%ebp),%eax
     2dc:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
     2df:	8b 45 10             	mov    0x10(%ebp),%eax
     2e2:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
     2e5:	8b 45 14             	mov    0x14(%ebp),%eax
     2e8:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
     2eb:	8b 45 18             	mov    0x18(%ebp),%eax
     2ee:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
     2f1:	89 d8                	mov    %ebx,%eax
     2f3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     2f6:	c9                   	leave
     2f7:	c3                   	ret
     2f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     2ff:	90                   	nop

00000300 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     300:	55                   	push   %ebp
     301:	89 e5                	mov    %esp,%ebp
     303:	53                   	push   %ebx
     304:	83 ec 10             	sub    $0x10,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     307:	6a 0c                	push   $0xc
     309:	e8 e2 0d 00 00       	call   10f0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     30e:	83 c4 0c             	add    $0xc,%esp
     311:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     313:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     315:	6a 00                	push   $0x0
     317:	50                   	push   %eax
     318:	e8 b3 08 00 00       	call   bd0 <memset>
  cmd->type = PIPE;
  cmd->left = left;
     31d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = PIPE;
     320:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
     326:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     329:	8b 45 0c             	mov    0xc(%ebp),%eax
     32c:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     32f:	89 d8                	mov    %ebx,%eax
     331:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     334:	c9                   	leave
     335:	c3                   	ret
     336:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     33d:	8d 76 00             	lea    0x0(%esi),%esi

00000340 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     340:	55                   	push   %ebp
     341:	89 e5                	mov    %esp,%ebp
     343:	53                   	push   %ebx
     344:	83 ec 10             	sub    $0x10,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     347:	6a 0c                	push   $0xc
     349:	e8 a2 0d 00 00       	call   10f0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     34e:	83 c4 0c             	add    $0xc,%esp
     351:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     353:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     355:	6a 00                	push   $0x0
     357:	50                   	push   %eax
     358:	e8 73 08 00 00       	call   bd0 <memset>
  cmd->type = LIST;
  cmd->left = left;
     35d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = LIST;
     360:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
     366:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     369:	8b 45 0c             	mov    0xc(%ebp),%eax
     36c:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     36f:	89 d8                	mov    %ebx,%eax
     371:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     374:	c9                   	leave
     375:	c3                   	ret
     376:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     37d:	8d 76 00             	lea    0x0(%esi),%esi

00000380 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     380:	55                   	push   %ebp
     381:	89 e5                	mov    %esp,%ebp
     383:	53                   	push   %ebx
     384:	83 ec 10             	sub    $0x10,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     387:	6a 08                	push   $0x8
     389:	e8 62 0d 00 00       	call   10f0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     38e:	83 c4 0c             	add    $0xc,%esp
     391:	6a 08                	push   $0x8
  cmd = malloc(sizeof(*cmd));
     393:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     395:	6a 00                	push   $0x0
     397:	50                   	push   %eax
     398:	e8 33 08 00 00       	call   bd0 <memset>
  cmd->type = BACK;
  cmd->cmd = subcmd;
     39d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = BACK;
     3a0:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
     3a6:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
     3a9:	89 d8                	mov    %ebx,%eax
     3ab:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     3ae:	c9                   	leave
     3af:	c3                   	ret

000003b0 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     3b0:	55                   	push   %ebp
     3b1:	89 e5                	mov    %esp,%ebp
     3b3:	57                   	push   %edi
     3b4:	56                   	push   %esi
     3b5:	53                   	push   %ebx
     3b6:	83 ec 0c             	sub    $0xc,%esp
  char *s;
  int ret;

  s = *ps;
     3b9:	8b 45 08             	mov    0x8(%ebp),%eax
{
     3bc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     3bf:	8b 75 10             	mov    0x10(%ebp),%esi
  s = *ps;
     3c2:	8b 38                	mov    (%eax),%edi
  while(s < es && strchr(whitespace, *s))
     3c4:	39 df                	cmp    %ebx,%edi
     3c6:	72 0f                	jb     3d7 <gettoken+0x27>
     3c8:	eb 25                	jmp    3ef <gettoken+0x3f>
     3ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    s++;
     3d0:	83 c7 01             	add    $0x1,%edi
  while(s < es && strchr(whitespace, *s))
     3d3:	39 fb                	cmp    %edi,%ebx
     3d5:	74 18                	je     3ef <gettoken+0x3f>
     3d7:	0f be 07             	movsbl (%edi),%eax
     3da:	83 ec 08             	sub    $0x8,%esp
     3dd:	50                   	push   %eax
     3de:	68 14 19 00 00       	push   $0x1914
     3e3:	e8 08 08 00 00       	call   bf0 <strchr>
     3e8:	83 c4 10             	add    $0x10,%esp
     3eb:	85 c0                	test   %eax,%eax
     3ed:	75 e1                	jne    3d0 <gettoken+0x20>
  if(q)
     3ef:	85 f6                	test   %esi,%esi
     3f1:	74 02                	je     3f5 <gettoken+0x45>
    *q = s;
     3f3:	89 3e                	mov    %edi,(%esi)
  ret = *s;
     3f5:	0f b6 07             	movzbl (%edi),%eax
  switch(*s){
     3f8:	3c 3c                	cmp    $0x3c,%al
     3fa:	0f 8f d0 00 00 00    	jg     4d0 <gettoken+0x120>
     400:	3c 3a                	cmp    $0x3a,%al
     402:	0f 8f bc 00 00 00    	jg     4c4 <gettoken+0x114>
     408:	84 c0                	test   %al,%al
     40a:	75 44                	jne    450 <gettoken+0xa0>
     40c:	31 f6                	xor    %esi,%esi
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     40e:	8b 4d 14             	mov    0x14(%ebp),%ecx
     411:	85 c9                	test   %ecx,%ecx
     413:	74 05                	je     41a <gettoken+0x6a>
    *eq = s;
     415:	8b 45 14             	mov    0x14(%ebp),%eax
     418:	89 38                	mov    %edi,(%eax)

  while(s < es && strchr(whitespace, *s))
     41a:	39 df                	cmp    %ebx,%edi
     41c:	72 09                	jb     427 <gettoken+0x77>
     41e:	eb 1f                	jmp    43f <gettoken+0x8f>
    s++;
     420:	83 c7 01             	add    $0x1,%edi
  while(s < es && strchr(whitespace, *s))
     423:	39 fb                	cmp    %edi,%ebx
     425:	74 18                	je     43f <gettoken+0x8f>
     427:	0f be 07             	movsbl (%edi),%eax
     42a:	83 ec 08             	sub    $0x8,%esp
     42d:	50                   	push   %eax
     42e:	68 14 19 00 00       	push   $0x1914
     433:	e8 b8 07 00 00       	call   bf0 <strchr>
     438:	83 c4 10             	add    $0x10,%esp
     43b:	85 c0                	test   %eax,%eax
     43d:	75 e1                	jne    420 <gettoken+0x70>
  *ps = s;
     43f:	8b 45 08             	mov    0x8(%ebp),%eax
     442:	89 38                	mov    %edi,(%eax)
  return ret;
}
     444:	8d 65 f4             	lea    -0xc(%ebp),%esp
     447:	89 f0                	mov    %esi,%eax
     449:	5b                   	pop    %ebx
     44a:	5e                   	pop    %esi
     44b:	5f                   	pop    %edi
     44c:	5d                   	pop    %ebp
     44d:	c3                   	ret
     44e:	66 90                	xchg   %ax,%ax
  switch(*s){
     450:	79 66                	jns    4b8 <gettoken+0x108>
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     452:	39 df                	cmp    %ebx,%edi
     454:	72 39                	jb     48f <gettoken+0xdf>
  if(eq)
     456:	8b 55 14             	mov    0x14(%ebp),%edx
     459:	85 d2                	test   %edx,%edx
     45b:	0f 84 b3 00 00 00    	je     514 <gettoken+0x164>
    *eq = s;
     461:	8b 45 14             	mov    0x14(%ebp),%eax
     464:	89 38                	mov    %edi,(%eax)
  while(s < es && strchr(whitespace, *s))
     466:	e9 a9 00 00 00       	jmp    514 <gettoken+0x164>
     46b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     46f:	90                   	nop
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     470:	0f be 07             	movsbl (%edi),%eax
     473:	83 ec 08             	sub    $0x8,%esp
     476:	50                   	push   %eax
     477:	68 0c 19 00 00       	push   $0x190c
     47c:	e8 6f 07 00 00       	call   bf0 <strchr>
     481:	83 c4 10             	add    $0x10,%esp
     484:	85 c0                	test   %eax,%eax
     486:	75 1f                	jne    4a7 <gettoken+0xf7>
      s++;
     488:	83 c7 01             	add    $0x1,%edi
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     48b:	39 fb                	cmp    %edi,%ebx
     48d:	74 77                	je     506 <gettoken+0x156>
     48f:	0f be 07             	movsbl (%edi),%eax
     492:	83 ec 08             	sub    $0x8,%esp
     495:	50                   	push   %eax
     496:	68 14 19 00 00       	push   $0x1914
     49b:	e8 50 07 00 00       	call   bf0 <strchr>
     4a0:	83 c4 10             	add    $0x10,%esp
     4a3:	85 c0                	test   %eax,%eax
     4a5:	74 c9                	je     470 <gettoken+0xc0>
    ret = 'a';
     4a7:	be 61 00 00 00       	mov    $0x61,%esi
     4ac:	e9 5d ff ff ff       	jmp    40e <gettoken+0x5e>
     4b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  switch(*s){
     4b8:	3c 26                	cmp    $0x26,%al
     4ba:	74 08                	je     4c4 <gettoken+0x114>
     4bc:	8d 48 d8             	lea    -0x28(%eax),%ecx
     4bf:	80 f9 01             	cmp    $0x1,%cl
     4c2:	77 8e                	ja     452 <gettoken+0xa2>
  ret = *s;
     4c4:	0f be f0             	movsbl %al,%esi
    s++;
     4c7:	83 c7 01             	add    $0x1,%edi
    break;
     4ca:	e9 3f ff ff ff       	jmp    40e <gettoken+0x5e>
     4cf:	90                   	nop
  switch(*s){
     4d0:	3c 3e                	cmp    $0x3e,%al
     4d2:	75 1c                	jne    4f0 <gettoken+0x140>
    if(*s == '>'){
     4d4:	80 7f 01 3e          	cmpb   $0x3e,0x1(%edi)
     4d8:	74 1f                	je     4f9 <gettoken+0x149>
    s++;
     4da:	83 c7 01             	add    $0x1,%edi
  ret = *s;
     4dd:	be 3e 00 00 00       	mov    $0x3e,%esi
     4e2:	e9 27 ff ff ff       	jmp    40e <gettoken+0x5e>
     4e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     4ee:	66 90                	xchg   %ax,%ax
  switch(*s){
     4f0:	3c 7c                	cmp    $0x7c,%al
     4f2:	74 d0                	je     4c4 <gettoken+0x114>
     4f4:	e9 59 ff ff ff       	jmp    452 <gettoken+0xa2>
      s++;
     4f9:	83 c7 02             	add    $0x2,%edi
      ret = '+';
     4fc:	be 2b 00 00 00       	mov    $0x2b,%esi
     501:	e9 08 ff ff ff       	jmp    40e <gettoken+0x5e>
  if(eq)
     506:	8b 45 14             	mov    0x14(%ebp),%eax
     509:	85 c0                	test   %eax,%eax
     50b:	74 05                	je     512 <gettoken+0x162>
    *eq = s;
     50d:	8b 45 14             	mov    0x14(%ebp),%eax
     510:	89 18                	mov    %ebx,(%eax)
      s++;
     512:	89 df                	mov    %ebx,%edi
    ret = 'a';
     514:	be 61 00 00 00       	mov    $0x61,%esi
     519:	e9 21 ff ff ff       	jmp    43f <gettoken+0x8f>
     51e:	66 90                	xchg   %ax,%ax

00000520 <peek>:

int
peek(char **ps, char *es, char *toks)
{
     520:	55                   	push   %ebp
     521:	89 e5                	mov    %esp,%ebp
     523:	57                   	push   %edi
     524:	56                   	push   %esi
     525:	53                   	push   %ebx
     526:	83 ec 0c             	sub    $0xc,%esp
     529:	8b 7d 08             	mov    0x8(%ebp),%edi
     52c:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;

  s = *ps;
     52f:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
     531:	39 f3                	cmp    %esi,%ebx
     533:	72 12                	jb     547 <peek+0x27>
     535:	eb 28                	jmp    55f <peek+0x3f>
     537:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     53e:	66 90                	xchg   %ax,%ax
    s++;
     540:	83 c3 01             	add    $0x1,%ebx
  while(s < es && strchr(whitespace, *s))
     543:	39 de                	cmp    %ebx,%esi
     545:	74 18                	je     55f <peek+0x3f>
     547:	0f be 03             	movsbl (%ebx),%eax
     54a:	83 ec 08             	sub    $0x8,%esp
     54d:	50                   	push   %eax
     54e:	68 14 19 00 00       	push   $0x1914
     553:	e8 98 06 00 00       	call   bf0 <strchr>
     558:	83 c4 10             	add    $0x10,%esp
     55b:	85 c0                	test   %eax,%eax
     55d:	75 e1                	jne    540 <peek+0x20>
  *ps = s;
     55f:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
     561:	0f be 03             	movsbl (%ebx),%eax
     564:	31 d2                	xor    %edx,%edx
     566:	84 c0                	test   %al,%al
     568:	75 0e                	jne    578 <peek+0x58>
}
     56a:	8d 65 f4             	lea    -0xc(%ebp),%esp
     56d:	89 d0                	mov    %edx,%eax
     56f:	5b                   	pop    %ebx
     570:	5e                   	pop    %esi
     571:	5f                   	pop    %edi
     572:	5d                   	pop    %ebp
     573:	c3                   	ret
     574:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  return *s && strchr(toks, *s);
     578:	83 ec 08             	sub    $0x8,%esp
     57b:	50                   	push   %eax
     57c:	ff 75 10             	push   0x10(%ebp)
     57f:	e8 6c 06 00 00       	call   bf0 <strchr>
     584:	83 c4 10             	add    $0x10,%esp
     587:	31 d2                	xor    %edx,%edx
     589:	85 c0                	test   %eax,%eax
     58b:	0f 95 c2             	setne  %dl
}
     58e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     591:	5b                   	pop    %ebx
     592:	89 d0                	mov    %edx,%eax
     594:	5e                   	pop    %esi
     595:	5f                   	pop    %edi
     596:	5d                   	pop    %ebp
     597:	c3                   	ret
     598:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     59f:	90                   	nop

000005a0 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     5a0:	55                   	push   %ebp
     5a1:	89 e5                	mov    %esp,%ebp
     5a3:	57                   	push   %edi
     5a4:	56                   	push   %esi
     5a5:	53                   	push   %ebx
     5a6:	83 ec 2c             	sub    $0x2c,%esp
     5a9:	8b 75 0c             	mov    0xc(%ebp),%esi
     5ac:	8b 5d 10             	mov    0x10(%ebp),%ebx
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     5af:	90                   	nop
     5b0:	83 ec 04             	sub    $0x4,%esp
     5b3:	68 40 12 00 00       	push   $0x1240
     5b8:	53                   	push   %ebx
     5b9:	56                   	push   %esi
     5ba:	e8 61 ff ff ff       	call   520 <peek>
     5bf:	83 c4 10             	add    $0x10,%esp
     5c2:	85 c0                	test   %eax,%eax
     5c4:	0f 84 f6 00 00 00    	je     6c0 <parseredirs+0x120>
    tok = gettoken(ps, es, 0, 0);
     5ca:	6a 00                	push   $0x0
     5cc:	6a 00                	push   $0x0
     5ce:	53                   	push   %ebx
     5cf:	56                   	push   %esi
     5d0:	e8 db fd ff ff       	call   3b0 <gettoken>
     5d5:	89 c7                	mov    %eax,%edi
    if(gettoken(ps, es, &q, &eq) != 'a')
     5d7:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     5da:	50                   	push   %eax
     5db:	8d 45 e0             	lea    -0x20(%ebp),%eax
     5de:	50                   	push   %eax
     5df:	53                   	push   %ebx
     5e0:	56                   	push   %esi
     5e1:	e8 ca fd ff ff       	call   3b0 <gettoken>
     5e6:	83 c4 20             	add    $0x20,%esp
     5e9:	83 f8 61             	cmp    $0x61,%eax
     5ec:	0f 85 d9 00 00 00    	jne    6cb <parseredirs+0x12b>
      panic("missing file for redirection");
    switch(tok){
     5f2:	83 ff 3c             	cmp    $0x3c,%edi
     5f5:	74 69                	je     660 <parseredirs+0xc0>
     5f7:	83 ff 3e             	cmp    $0x3e,%edi
     5fa:	74 05                	je     601 <parseredirs+0x61>
     5fc:	83 ff 2b             	cmp    $0x2b,%edi
     5ff:	75 af                	jne    5b0 <parseredirs+0x10>
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     601:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     604:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  cmd = malloc(sizeof(*cmd));
     607:	83 ec 0c             	sub    $0xc,%esp
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     60a:	89 55 d0             	mov    %edx,-0x30(%ebp)
     60d:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  cmd = malloc(sizeof(*cmd));
     610:	6a 18                	push   $0x18
     612:	e8 d9 0a 00 00       	call   10f0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     617:	83 c4 0c             	add    $0xc,%esp
     61a:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     61c:	89 c7                	mov    %eax,%edi
  memset(cmd, 0, sizeof(*cmd));
     61e:	6a 00                	push   $0x0
     620:	50                   	push   %eax
     621:	e8 aa 05 00 00       	call   bd0 <memset>
  cmd->type = REDIR;
     626:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
  cmd->cmd = subcmd;
     62c:	8b 45 08             	mov    0x8(%ebp),%eax
      break;
     62f:	83 c4 10             	add    $0x10,%esp
  cmd->cmd = subcmd;
     632:	89 47 04             	mov    %eax,0x4(%edi)
  cmd->file = file;
     635:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
     638:	89 4f 08             	mov    %ecx,0x8(%edi)
  cmd->efile = efile;
     63b:	8b 55 d0             	mov    -0x30(%ebp),%edx
  cmd->mode = mode;
     63e:	c7 47 10 01 02 00 00 	movl   $0x201,0x10(%edi)
  cmd->efile = efile;
     645:	89 57 0c             	mov    %edx,0xc(%edi)
  cmd->fd = fd;
     648:	c7 47 14 01 00 00 00 	movl   $0x1,0x14(%edi)
      break;
     64f:	89 7d 08             	mov    %edi,0x8(%ebp)
     652:	e9 59 ff ff ff       	jmp    5b0 <parseredirs+0x10>
     657:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     65e:	66 90                	xchg   %ax,%ax
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     660:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     663:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  cmd = malloc(sizeof(*cmd));
     666:	83 ec 0c             	sub    $0xc,%esp
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     669:	89 55 d0             	mov    %edx,-0x30(%ebp)
     66c:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  cmd = malloc(sizeof(*cmd));
     66f:	6a 18                	push   $0x18
     671:	e8 7a 0a 00 00       	call   10f0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     676:	83 c4 0c             	add    $0xc,%esp
     679:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     67b:	89 c7                	mov    %eax,%edi
  memset(cmd, 0, sizeof(*cmd));
     67d:	6a 00                	push   $0x0
     67f:	50                   	push   %eax
     680:	e8 4b 05 00 00       	call   bd0 <memset>
  cmd->cmd = subcmd;
     685:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->file = file;
     688:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      break;
     68b:	89 7d 08             	mov    %edi,0x8(%ebp)
  cmd->efile = efile;
     68e:	8b 55 d0             	mov    -0x30(%ebp),%edx
  cmd->type = REDIR;
     691:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
      break;
     697:	83 c4 10             	add    $0x10,%esp
  cmd->cmd = subcmd;
     69a:	89 47 04             	mov    %eax,0x4(%edi)
  cmd->file = file;
     69d:	89 4f 08             	mov    %ecx,0x8(%edi)
  cmd->efile = efile;
     6a0:	89 57 0c             	mov    %edx,0xc(%edi)
  cmd->mode = mode;
     6a3:	c7 47 10 00 00 00 00 	movl   $0x0,0x10(%edi)
  cmd->fd = fd;
     6aa:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
      break;
     6b1:	e9 fa fe ff ff       	jmp    5b0 <parseredirs+0x10>
     6b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     6bd:	8d 76 00             	lea    0x0(%esi),%esi
    }
  }
  return cmd;
}
     6c0:	8b 45 08             	mov    0x8(%ebp),%eax
     6c3:	8d 65 f4             	lea    -0xc(%ebp),%esp
     6c6:	5b                   	pop    %ebx
     6c7:	5e                   	pop    %esi
     6c8:	5f                   	pop    %edi
     6c9:	5d                   	pop    %ebp
     6ca:	c3                   	ret
      panic("missing file for redirection");
     6cb:	83 ec 0c             	sub    $0xc,%esp
     6ce:	68 23 12 00 00       	push   $0x1223
     6d3:	e8 98 fa ff ff       	call   170 <panic>
     6d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     6df:	90                   	nop

000006e0 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     6e0:	55                   	push   %ebp
     6e1:	89 e5                	mov    %esp,%ebp
     6e3:	57                   	push   %edi
     6e4:	56                   	push   %esi
     6e5:	53                   	push   %ebx
     6e6:	83 ec 30             	sub    $0x30,%esp
     6e9:	8b 5d 08             	mov    0x8(%ebp),%ebx
     6ec:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     6ef:	68 43 12 00 00       	push   $0x1243
     6f4:	56                   	push   %esi
     6f5:	53                   	push   %ebx
     6f6:	e8 25 fe ff ff       	call   520 <peek>
     6fb:	83 c4 10             	add    $0x10,%esp
     6fe:	85 c0                	test   %eax,%eax
     700:	0f 85 aa 00 00 00    	jne    7b0 <parseexec+0xd0>
  cmd = malloc(sizeof(*cmd));
     706:	83 ec 0c             	sub    $0xc,%esp
     709:	89 c7                	mov    %eax,%edi
     70b:	6a 54                	push   $0x54
     70d:	e8 de 09 00 00       	call   10f0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     712:	83 c4 0c             	add    $0xc,%esp
     715:	6a 54                	push   $0x54
     717:	6a 00                	push   $0x0
     719:	89 45 d0             	mov    %eax,-0x30(%ebp)
     71c:	50                   	push   %eax
     71d:	e8 ae 04 00 00       	call   bd0 <memset>
  cmd->type = EXEC;
     722:	8b 45 d0             	mov    -0x30(%ebp),%eax

  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     725:	83 c4 0c             	add    $0xc,%esp
  cmd->type = EXEC;
     728:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  ret = parseredirs(ret, ps, es);
     72e:	56                   	push   %esi
     72f:	53                   	push   %ebx
     730:	50                   	push   %eax
     731:	e8 6a fe ff ff       	call   5a0 <parseredirs>
  while(!peek(ps, es, "|)&;")){
     736:	83 c4 10             	add    $0x10,%esp
  ret = parseredirs(ret, ps, es);
     739:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     73c:	eb 15                	jmp    753 <parseexec+0x73>
     73e:	66 90                	xchg   %ax,%ax
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
     740:	83 ec 04             	sub    $0x4,%esp
     743:	56                   	push   %esi
     744:	53                   	push   %ebx
     745:	ff 75 d4             	push   -0x2c(%ebp)
     748:	e8 53 fe ff ff       	call   5a0 <parseredirs>
     74d:	83 c4 10             	add    $0x10,%esp
     750:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     753:	83 ec 04             	sub    $0x4,%esp
     756:	68 5a 12 00 00       	push   $0x125a
     75b:	56                   	push   %esi
     75c:	53                   	push   %ebx
     75d:	e8 be fd ff ff       	call   520 <peek>
     762:	83 c4 10             	add    $0x10,%esp
     765:	85 c0                	test   %eax,%eax
     767:	75 5f                	jne    7c8 <parseexec+0xe8>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     769:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     76c:	50                   	push   %eax
     76d:	8d 45 e0             	lea    -0x20(%ebp),%eax
     770:	50                   	push   %eax
     771:	56                   	push   %esi
     772:	53                   	push   %ebx
     773:	e8 38 fc ff ff       	call   3b0 <gettoken>
     778:	83 c4 10             	add    $0x10,%esp
     77b:	85 c0                	test   %eax,%eax
     77d:	74 49                	je     7c8 <parseexec+0xe8>
    if(tok != 'a')
     77f:	83 f8 61             	cmp    $0x61,%eax
     782:	75 62                	jne    7e6 <parseexec+0x106>
    cmd->argv[argc] = q;
     784:	8b 45 e0             	mov    -0x20(%ebp),%eax
     787:	8b 55 d0             	mov    -0x30(%ebp),%edx
     78a:	89 44 ba 04          	mov    %eax,0x4(%edx,%edi,4)
    cmd->eargv[argc] = eq;
     78e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     791:	89 44 ba 2c          	mov    %eax,0x2c(%edx,%edi,4)
    argc++;
     795:	83 c7 01             	add    $0x1,%edi
    if(argc >= MAXARGS)
     798:	83 ff 0a             	cmp    $0xa,%edi
     79b:	75 a3                	jne    740 <parseexec+0x60>
      panic("too many args");
     79d:	83 ec 0c             	sub    $0xc,%esp
     7a0:	68 4c 12 00 00       	push   $0x124c
     7a5:	e8 c6 f9 ff ff       	call   170 <panic>
     7aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return parseblock(ps, es);
     7b0:	89 75 0c             	mov    %esi,0xc(%ebp)
     7b3:	89 5d 08             	mov    %ebx,0x8(%ebp)
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     7b6:	8d 65 f4             	lea    -0xc(%ebp),%esp
     7b9:	5b                   	pop    %ebx
     7ba:	5e                   	pop    %esi
     7bb:	5f                   	pop    %edi
     7bc:	5d                   	pop    %ebp
    return parseblock(ps, es);
     7bd:	e9 ae 01 00 00       	jmp    970 <parseblock>
     7c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  cmd->argv[argc] = 0;
     7c8:	8b 45 d0             	mov    -0x30(%ebp),%eax
     7cb:	c7 44 b8 04 00 00 00 	movl   $0x0,0x4(%eax,%edi,4)
     7d2:	00 
  cmd->eargv[argc] = 0;
     7d3:	c7 44 b8 2c 00 00 00 	movl   $0x0,0x2c(%eax,%edi,4)
     7da:	00 
}
     7db:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     7de:	8d 65 f4             	lea    -0xc(%ebp),%esp
     7e1:	5b                   	pop    %ebx
     7e2:	5e                   	pop    %esi
     7e3:	5f                   	pop    %edi
     7e4:	5d                   	pop    %ebp
     7e5:	c3                   	ret
      panic("syntax");
     7e6:	83 ec 0c             	sub    $0xc,%esp
     7e9:	68 45 12 00 00       	push   $0x1245
     7ee:	e8 7d f9 ff ff       	call   170 <panic>
     7f3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     7fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000800 <parsepipe>:
{
     800:	55                   	push   %ebp
     801:	89 e5                	mov    %esp,%ebp
     803:	57                   	push   %edi
     804:	56                   	push   %esi
     805:	53                   	push   %ebx
     806:	83 ec 14             	sub    $0x14,%esp
     809:	8b 75 08             	mov    0x8(%ebp),%esi
     80c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parseexec(ps, es);
     80f:	57                   	push   %edi
     810:	56                   	push   %esi
     811:	e8 ca fe ff ff       	call   6e0 <parseexec>
  if(peek(ps, es, "|")){
     816:	83 c4 0c             	add    $0xc,%esp
     819:	68 5f 12 00 00       	push   $0x125f
  cmd = parseexec(ps, es);
     81e:	89 c3                	mov    %eax,%ebx
  if(peek(ps, es, "|")){
     820:	57                   	push   %edi
     821:	56                   	push   %esi
     822:	e8 f9 fc ff ff       	call   520 <peek>
     827:	83 c4 10             	add    $0x10,%esp
     82a:	85 c0                	test   %eax,%eax
     82c:	75 12                	jne    840 <parsepipe+0x40>
}
     82e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     831:	89 d8                	mov    %ebx,%eax
     833:	5b                   	pop    %ebx
     834:	5e                   	pop    %esi
     835:	5f                   	pop    %edi
     836:	5d                   	pop    %ebp
     837:	c3                   	ret
     838:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     83f:	90                   	nop
    gettoken(ps, es, 0, 0);
     840:	6a 00                	push   $0x0
     842:	6a 00                	push   $0x0
     844:	57                   	push   %edi
     845:	56                   	push   %esi
     846:	e8 65 fb ff ff       	call   3b0 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     84b:	58                   	pop    %eax
     84c:	5a                   	pop    %edx
     84d:	57                   	push   %edi
     84e:	56                   	push   %esi
     84f:	e8 ac ff ff ff       	call   800 <parsepipe>
  cmd = malloc(sizeof(*cmd));
     854:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
    cmd = pipecmd(cmd, parsepipe(ps, es));
     85b:	89 c7                	mov    %eax,%edi
  cmd = malloc(sizeof(*cmd));
     85d:	e8 8e 08 00 00       	call   10f0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     862:	83 c4 0c             	add    $0xc,%esp
     865:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     867:	89 c6                	mov    %eax,%esi
  memset(cmd, 0, sizeof(*cmd));
     869:	6a 00                	push   $0x0
     86b:	50                   	push   %eax
     86c:	e8 5f 03 00 00       	call   bd0 <memset>
  cmd->left = left;
     871:	89 5e 04             	mov    %ebx,0x4(%esi)
  cmd->right = right;
     874:	83 c4 10             	add    $0x10,%esp
     877:	89 f3                	mov    %esi,%ebx
  cmd->type = PIPE;
     879:	c7 06 03 00 00 00    	movl   $0x3,(%esi)
}
     87f:	89 d8                	mov    %ebx,%eax
  cmd->right = right;
     881:	89 7e 08             	mov    %edi,0x8(%esi)
}
     884:	8d 65 f4             	lea    -0xc(%ebp),%esp
     887:	5b                   	pop    %ebx
     888:	5e                   	pop    %esi
     889:	5f                   	pop    %edi
     88a:	5d                   	pop    %ebp
     88b:	c3                   	ret
     88c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000890 <parseline>:
{
     890:	55                   	push   %ebp
     891:	89 e5                	mov    %esp,%ebp
     893:	57                   	push   %edi
     894:	56                   	push   %esi
     895:	53                   	push   %ebx
     896:	83 ec 24             	sub    $0x24,%esp
     899:	8b 75 08             	mov    0x8(%ebp),%esi
     89c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parsepipe(ps, es);
     89f:	57                   	push   %edi
     8a0:	56                   	push   %esi
     8a1:	e8 5a ff ff ff       	call   800 <parsepipe>
  while(peek(ps, es, "&")){
     8a6:	83 c4 10             	add    $0x10,%esp
  cmd = parsepipe(ps, es);
     8a9:	89 c3                	mov    %eax,%ebx
  while(peek(ps, es, "&")){
     8ab:	eb 3b                	jmp    8e8 <parseline+0x58>
     8ad:	8d 76 00             	lea    0x0(%esi),%esi
    gettoken(ps, es, 0, 0);
     8b0:	6a 00                	push   $0x0
     8b2:	6a 00                	push   $0x0
     8b4:	57                   	push   %edi
     8b5:	56                   	push   %esi
     8b6:	e8 f5 fa ff ff       	call   3b0 <gettoken>
  cmd = malloc(sizeof(*cmd));
     8bb:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
     8c2:	e8 29 08 00 00       	call   10f0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     8c7:	83 c4 0c             	add    $0xc,%esp
     8ca:	6a 08                	push   $0x8
     8cc:	6a 00                	push   $0x0
     8ce:	50                   	push   %eax
     8cf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     8d2:	e8 f9 02 00 00       	call   bd0 <memset>
  cmd->type = BACK;
     8d7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  cmd->cmd = subcmd;
     8da:	83 c4 10             	add    $0x10,%esp
  cmd->type = BACK;
     8dd:	c7 02 05 00 00 00    	movl   $0x5,(%edx)
  cmd->cmd = subcmd;
     8e3:	89 5a 04             	mov    %ebx,0x4(%edx)
     8e6:	89 d3                	mov    %edx,%ebx
  while(peek(ps, es, "&")){
     8e8:	83 ec 04             	sub    $0x4,%esp
     8eb:	68 61 12 00 00       	push   $0x1261
     8f0:	57                   	push   %edi
     8f1:	56                   	push   %esi
     8f2:	e8 29 fc ff ff       	call   520 <peek>
     8f7:	83 c4 10             	add    $0x10,%esp
     8fa:	85 c0                	test   %eax,%eax
     8fc:	75 b2                	jne    8b0 <parseline+0x20>
  if(peek(ps, es, ";")){
     8fe:	83 ec 04             	sub    $0x4,%esp
     901:	68 5d 12 00 00       	push   $0x125d
     906:	57                   	push   %edi
     907:	56                   	push   %esi
     908:	e8 13 fc ff ff       	call   520 <peek>
     90d:	83 c4 10             	add    $0x10,%esp
     910:	85 c0                	test   %eax,%eax
     912:	75 0c                	jne    920 <parseline+0x90>
}
     914:	8d 65 f4             	lea    -0xc(%ebp),%esp
     917:	89 d8                	mov    %ebx,%eax
     919:	5b                   	pop    %ebx
     91a:	5e                   	pop    %esi
     91b:	5f                   	pop    %edi
     91c:	5d                   	pop    %ebp
     91d:	c3                   	ret
     91e:	66 90                	xchg   %ax,%ax
    gettoken(ps, es, 0, 0);
     920:	6a 00                	push   $0x0
     922:	6a 00                	push   $0x0
     924:	57                   	push   %edi
     925:	56                   	push   %esi
     926:	e8 85 fa ff ff       	call   3b0 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     92b:	58                   	pop    %eax
     92c:	5a                   	pop    %edx
     92d:	57                   	push   %edi
     92e:	56                   	push   %esi
     92f:	e8 5c ff ff ff       	call   890 <parseline>
  cmd = malloc(sizeof(*cmd));
     934:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
    cmd = listcmd(cmd, parseline(ps, es));
     93b:	89 c7                	mov    %eax,%edi
  cmd = malloc(sizeof(*cmd));
     93d:	e8 ae 07 00 00       	call   10f0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     942:	83 c4 0c             	add    $0xc,%esp
     945:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     947:	89 c6                	mov    %eax,%esi
  memset(cmd, 0, sizeof(*cmd));
     949:	6a 00                	push   $0x0
     94b:	50                   	push   %eax
     94c:	e8 7f 02 00 00       	call   bd0 <memset>
  cmd->left = left;
     951:	89 5e 04             	mov    %ebx,0x4(%esi)
  cmd->right = right;
     954:	83 c4 10             	add    $0x10,%esp
     957:	89 f3                	mov    %esi,%ebx
  cmd->type = LIST;
     959:	c7 06 04 00 00 00    	movl   $0x4,(%esi)
}
     95f:	89 d8                	mov    %ebx,%eax
  cmd->right = right;
     961:	89 7e 08             	mov    %edi,0x8(%esi)
}
     964:	8d 65 f4             	lea    -0xc(%ebp),%esp
     967:	5b                   	pop    %ebx
     968:	5e                   	pop    %esi
     969:	5f                   	pop    %edi
     96a:	5d                   	pop    %ebp
     96b:	c3                   	ret
     96c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000970 <parseblock>:
{
     970:	55                   	push   %ebp
     971:	89 e5                	mov    %esp,%ebp
     973:	57                   	push   %edi
     974:	56                   	push   %esi
     975:	53                   	push   %ebx
     976:	83 ec 10             	sub    $0x10,%esp
     979:	8b 5d 08             	mov    0x8(%ebp),%ebx
     97c:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(!peek(ps, es, "("))
     97f:	68 43 12 00 00       	push   $0x1243
     984:	56                   	push   %esi
     985:	53                   	push   %ebx
     986:	e8 95 fb ff ff       	call   520 <peek>
     98b:	83 c4 10             	add    $0x10,%esp
     98e:	85 c0                	test   %eax,%eax
     990:	74 4a                	je     9dc <parseblock+0x6c>
  gettoken(ps, es, 0, 0);
     992:	6a 00                	push   $0x0
     994:	6a 00                	push   $0x0
     996:	56                   	push   %esi
     997:	53                   	push   %ebx
     998:	e8 13 fa ff ff       	call   3b0 <gettoken>
  cmd = parseline(ps, es);
     99d:	58                   	pop    %eax
     99e:	5a                   	pop    %edx
     99f:	56                   	push   %esi
     9a0:	53                   	push   %ebx
     9a1:	e8 ea fe ff ff       	call   890 <parseline>
  if(!peek(ps, es, ")"))
     9a6:	83 c4 0c             	add    $0xc,%esp
     9a9:	68 7f 12 00 00       	push   $0x127f
  cmd = parseline(ps, es);
     9ae:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
     9b0:	56                   	push   %esi
     9b1:	53                   	push   %ebx
     9b2:	e8 69 fb ff ff       	call   520 <peek>
     9b7:	83 c4 10             	add    $0x10,%esp
     9ba:	85 c0                	test   %eax,%eax
     9bc:	74 2b                	je     9e9 <parseblock+0x79>
  gettoken(ps, es, 0, 0);
     9be:	6a 00                	push   $0x0
     9c0:	6a 00                	push   $0x0
     9c2:	56                   	push   %esi
     9c3:	53                   	push   %ebx
     9c4:	e8 e7 f9 ff ff       	call   3b0 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     9c9:	83 c4 0c             	add    $0xc,%esp
     9cc:	56                   	push   %esi
     9cd:	53                   	push   %ebx
     9ce:	57                   	push   %edi
     9cf:	e8 cc fb ff ff       	call   5a0 <parseredirs>
}
     9d4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     9d7:	5b                   	pop    %ebx
     9d8:	5e                   	pop    %esi
     9d9:	5f                   	pop    %edi
     9da:	5d                   	pop    %ebp
     9db:	c3                   	ret
    panic("parseblock");
     9dc:	83 ec 0c             	sub    $0xc,%esp
     9df:	68 63 12 00 00       	push   $0x1263
     9e4:	e8 87 f7 ff ff       	call   170 <panic>
    panic("syntax - missing )");
     9e9:	83 ec 0c             	sub    $0xc,%esp
     9ec:	68 6e 12 00 00       	push   $0x126e
     9f1:	e8 7a f7 ff ff       	call   170 <panic>
     9f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     9fd:	8d 76 00             	lea    0x0(%esi),%esi

00000a00 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     a00:	55                   	push   %ebp
     a01:	89 e5                	mov    %esp,%ebp
     a03:	53                   	push   %ebx
     a04:	83 ec 04             	sub    $0x4,%esp
     a07:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     a0a:	85 db                	test   %ebx,%ebx
     a0c:	0f 84 7e 00 00 00    	je     a90 <nulterminate+0x90>
    return 0;

  switch(cmd->type){
     a12:	83 3b 05             	cmpl   $0x5,(%ebx)
     a15:	77 20                	ja     a37 <nulterminate+0x37>
     a17:	8b 03                	mov    (%ebx),%eax
     a19:	ff 24 85 e0 12 00 00 	jmp    *0x12e0(,%eax,4)
    nulterminate(pcmd->right);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    nulterminate(lcmd->left);
     a20:	83 ec 0c             	sub    $0xc,%esp
     a23:	ff 73 04             	push   0x4(%ebx)
     a26:	e8 d5 ff ff ff       	call   a00 <nulterminate>
    nulterminate(lcmd->right);
     a2b:	58                   	pop    %eax
     a2c:	ff 73 08             	push   0x8(%ebx)
     a2f:	e8 cc ff ff ff       	call   a00 <nulterminate>
    break;
     a34:	83 c4 10             	add    $0x10,%esp
    return 0;
     a37:	89 d8                	mov    %ebx,%eax
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     a39:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     a3c:	c9                   	leave
     a3d:	c3                   	ret
     a3e:	66 90                	xchg   %ax,%ax
    nulterminate(bcmd->cmd);
     a40:	83 ec 0c             	sub    $0xc,%esp
     a43:	ff 73 04             	push   0x4(%ebx)
     a46:	e8 b5 ff ff ff       	call   a00 <nulterminate>
    break;
     a4b:	83 c4 10             	add    $0x10,%esp
     a4e:	eb e7                	jmp    a37 <nulterminate+0x37>
    for(i=0; ecmd->argv[i]; i++)
     a50:	8b 4b 04             	mov    0x4(%ebx),%ecx
     a53:	8d 43 08             	lea    0x8(%ebx),%eax
     a56:	85 c9                	test   %ecx,%ecx
     a58:	74 dd                	je     a37 <nulterminate+0x37>
     a5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      *ecmd->eargv[i] = 0;
     a60:	8b 50 24             	mov    0x24(%eax),%edx
    for(i=0; ecmd->argv[i]; i++)
     a63:	83 c0 04             	add    $0x4,%eax
      *ecmd->eargv[i] = 0;
     a66:	c6 02 00             	movb   $0x0,(%edx)
    for(i=0; ecmd->argv[i]; i++)
     a69:	8b 50 fc             	mov    -0x4(%eax),%edx
     a6c:	85 d2                	test   %edx,%edx
     a6e:	75 f0                	jne    a60 <nulterminate+0x60>
     a70:	eb c5                	jmp    a37 <nulterminate+0x37>
     a72:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    nulterminate(rcmd->cmd);
     a78:	83 ec 0c             	sub    $0xc,%esp
     a7b:	ff 73 04             	push   0x4(%ebx)
     a7e:	e8 7d ff ff ff       	call   a00 <nulterminate>
    *rcmd->efile = 0;
     a83:	8b 43 0c             	mov    0xc(%ebx),%eax
    break;
     a86:	83 c4 10             	add    $0x10,%esp
    *rcmd->efile = 0;
     a89:	c6 00 00             	movb   $0x0,(%eax)
    break;
     a8c:	eb a9                	jmp    a37 <nulterminate+0x37>
     a8e:	66 90                	xchg   %ax,%ax
    return 0;
     a90:	31 c0                	xor    %eax,%eax
     a92:	eb a5                	jmp    a39 <nulterminate+0x39>
     a94:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     a9b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     a9f:	90                   	nop

00000aa0 <parsecmd>:
{
     aa0:	55                   	push   %ebp
     aa1:	89 e5                	mov    %esp,%ebp
     aa3:	57                   	push   %edi
     aa4:	56                   	push   %esi
  cmd = parseline(&s, es);
     aa5:	8d 7d 08             	lea    0x8(%ebp),%edi
{
     aa8:	53                   	push   %ebx
     aa9:	83 ec 18             	sub    $0x18,%esp
  es = s + strlen(s);
     aac:	8b 5d 08             	mov    0x8(%ebp),%ebx
     aaf:	53                   	push   %ebx
     ab0:	e8 eb 00 00 00       	call   ba0 <strlen>
  cmd = parseline(&s, es);
     ab5:	59                   	pop    %ecx
     ab6:	5e                   	pop    %esi
  es = s + strlen(s);
     ab7:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
     ab9:	53                   	push   %ebx
     aba:	57                   	push   %edi
     abb:	e8 d0 fd ff ff       	call   890 <parseline>
  peek(&s, es, "");
     ac0:	83 c4 0c             	add    $0xc,%esp
     ac3:	68 f1 11 00 00       	push   $0x11f1
  cmd = parseline(&s, es);
     ac8:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
     aca:	53                   	push   %ebx
     acb:	57                   	push   %edi
     acc:	e8 4f fa ff ff       	call   520 <peek>
  if(s != es){
     ad1:	8b 45 08             	mov    0x8(%ebp),%eax
     ad4:	83 c4 10             	add    $0x10,%esp
     ad7:	39 d8                	cmp    %ebx,%eax
     ad9:	75 13                	jne    aee <parsecmd+0x4e>
  nulterminate(cmd);
     adb:	83 ec 0c             	sub    $0xc,%esp
     ade:	56                   	push   %esi
     adf:	e8 1c ff ff ff       	call   a00 <nulterminate>
}
     ae4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     ae7:	89 f0                	mov    %esi,%eax
     ae9:	5b                   	pop    %ebx
     aea:	5e                   	pop    %esi
     aeb:	5f                   	pop    %edi
     aec:	5d                   	pop    %ebp
     aed:	c3                   	ret
    printf(2, "leftovers: %s\n", s);
     aee:	52                   	push   %edx
     aef:	50                   	push   %eax
     af0:	68 81 12 00 00       	push   $0x1281
     af5:	6a 02                	push   $0x2
     af7:	e8 b4 03 00 00       	call   eb0 <printf>
    panic("syntax");
     afc:	c7 04 24 45 12 00 00 	movl   $0x1245,(%esp)
     b03:	e8 68 f6 ff ff       	call   170 <panic>
     b08:	66 90                	xchg   %ax,%ax
     b0a:	66 90                	xchg   %ax,%ax
     b0c:	66 90                	xchg   %ax,%ax
     b0e:	66 90                	xchg   %ax,%ax

00000b10 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     b10:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     b11:	31 c0                	xor    %eax,%eax
{
     b13:	89 e5                	mov    %esp,%ebp
     b15:	53                   	push   %ebx
     b16:	8b 4d 08             	mov    0x8(%ebp),%ecx
     b19:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     b1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
     b20:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
     b24:	88 14 01             	mov    %dl,(%ecx,%eax,1)
     b27:	83 c0 01             	add    $0x1,%eax
     b2a:	84 d2                	test   %dl,%dl
     b2c:	75 f2                	jne    b20 <strcpy+0x10>
    ;
  return os;
}
     b2e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     b31:	89 c8                	mov    %ecx,%eax
     b33:	c9                   	leave
     b34:	c3                   	ret
     b35:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     b3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000b40 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     b40:	55                   	push   %ebp
     b41:	89 e5                	mov    %esp,%ebp
     b43:	53                   	push   %ebx
     b44:	8b 55 08             	mov    0x8(%ebp),%edx
     b47:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
     b4a:	0f b6 02             	movzbl (%edx),%eax
     b4d:	84 c0                	test   %al,%al
     b4f:	75 17                	jne    b68 <strcmp+0x28>
     b51:	eb 3a                	jmp    b8d <strcmp+0x4d>
     b53:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     b57:	90                   	nop
     b58:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
     b5c:	83 c2 01             	add    $0x1,%edx
     b5f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
     b62:	84 c0                	test   %al,%al
     b64:	74 1a                	je     b80 <strcmp+0x40>
    p++, q++;
     b66:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
     b68:	0f b6 19             	movzbl (%ecx),%ebx
     b6b:	38 c3                	cmp    %al,%bl
     b6d:	74 e9                	je     b58 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
     b6f:	29 d8                	sub    %ebx,%eax
}
     b71:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     b74:	c9                   	leave
     b75:	c3                   	ret
     b76:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     b7d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
     b80:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
     b84:	31 c0                	xor    %eax,%eax
     b86:	29 d8                	sub    %ebx,%eax
}
     b88:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     b8b:	c9                   	leave
     b8c:	c3                   	ret
  return (uchar)*p - (uchar)*q;
     b8d:	0f b6 19             	movzbl (%ecx),%ebx
     b90:	31 c0                	xor    %eax,%eax
     b92:	eb db                	jmp    b6f <strcmp+0x2f>
     b94:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     b9b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     b9f:	90                   	nop

00000ba0 <strlen>:

uint
strlen(char *s)
{
     ba0:	55                   	push   %ebp
     ba1:	89 e5                	mov    %esp,%ebp
     ba3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
     ba6:	80 3a 00             	cmpb   $0x0,(%edx)
     ba9:	74 15                	je     bc0 <strlen+0x20>
     bab:	31 c0                	xor    %eax,%eax
     bad:	8d 76 00             	lea    0x0(%esi),%esi
     bb0:	83 c0 01             	add    $0x1,%eax
     bb3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
     bb7:	89 c1                	mov    %eax,%ecx
     bb9:	75 f5                	jne    bb0 <strlen+0x10>
    ;
  return n;
}
     bbb:	89 c8                	mov    %ecx,%eax
     bbd:	5d                   	pop    %ebp
     bbe:	c3                   	ret
     bbf:	90                   	nop
  for(n = 0; s[n]; n++)
     bc0:	31 c9                	xor    %ecx,%ecx
}
     bc2:	5d                   	pop    %ebp
     bc3:	89 c8                	mov    %ecx,%eax
     bc5:	c3                   	ret
     bc6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     bcd:	8d 76 00             	lea    0x0(%esi),%esi

00000bd0 <memset>:

void*
memset(void *dst, int c, uint n)
{
     bd0:	55                   	push   %ebp
     bd1:	89 e5                	mov    %esp,%ebp
     bd3:	57                   	push   %edi
     bd4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     bd7:	8b 4d 10             	mov    0x10(%ebp),%ecx
     bda:	8b 45 0c             	mov    0xc(%ebp),%eax
     bdd:	89 d7                	mov    %edx,%edi
     bdf:	fc                   	cld
     be0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     be2:	8b 7d fc             	mov    -0x4(%ebp),%edi
     be5:	89 d0                	mov    %edx,%eax
     be7:	c9                   	leave
     be8:	c3                   	ret
     be9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000bf0 <strchr>:

char*
strchr(const char *s, char c)
{
     bf0:	55                   	push   %ebp
     bf1:	89 e5                	mov    %esp,%ebp
     bf3:	8b 45 08             	mov    0x8(%ebp),%eax
     bf6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
     bfa:	0f b6 10             	movzbl (%eax),%edx
     bfd:	84 d2                	test   %dl,%dl
     bff:	75 12                	jne    c13 <strchr+0x23>
     c01:	eb 1d                	jmp    c20 <strchr+0x30>
     c03:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     c07:	90                   	nop
     c08:	0f b6 50 01          	movzbl 0x1(%eax),%edx
     c0c:	83 c0 01             	add    $0x1,%eax
     c0f:	84 d2                	test   %dl,%dl
     c11:	74 0d                	je     c20 <strchr+0x30>
    if(*s == c)
     c13:	38 d1                	cmp    %dl,%cl
     c15:	75 f1                	jne    c08 <strchr+0x18>
      return (char*)s;
  return 0;
}
     c17:	5d                   	pop    %ebp
     c18:	c3                   	ret
     c19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
     c20:	31 c0                	xor    %eax,%eax
}
     c22:	5d                   	pop    %ebp
     c23:	c3                   	ret
     c24:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     c2b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     c2f:	90                   	nop

00000c30 <gets>:

char*
gets(char *buf, int max)
{
     c30:	55                   	push   %ebp
     c31:	89 e5                	mov    %esp,%ebp
     c33:	57                   	push   %edi
     c34:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
     c35:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
     c38:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
     c39:	31 db                	xor    %ebx,%ebx
{
     c3b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
     c3e:	eb 27                	jmp    c67 <gets+0x37>
    cc = read(0, &c, 1);
     c40:	83 ec 04             	sub    $0x4,%esp
     c43:	6a 01                	push   $0x1
     c45:	56                   	push   %esi
     c46:	6a 00                	push   $0x0
     c48:	e8 1e 01 00 00       	call   d6b <read>
    if(cc < 1)
     c4d:	83 c4 10             	add    $0x10,%esp
     c50:	85 c0                	test   %eax,%eax
     c52:	7e 1d                	jle    c71 <gets+0x41>
      break;
    buf[i++] = c;
     c54:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     c58:	8b 55 08             	mov    0x8(%ebp),%edx
     c5b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
     c5f:	3c 0a                	cmp    $0xa,%al
     c61:	74 10                	je     c73 <gets+0x43>
     c63:	3c 0d                	cmp    $0xd,%al
     c65:	74 0c                	je     c73 <gets+0x43>
  for(i=0; i+1 < max; ){
     c67:	89 df                	mov    %ebx,%edi
     c69:	83 c3 01             	add    $0x1,%ebx
     c6c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     c6f:	7c cf                	jl     c40 <gets+0x10>
     c71:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
     c73:	8b 45 08             	mov    0x8(%ebp),%eax
     c76:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
     c7a:	8d 65 f4             	lea    -0xc(%ebp),%esp
     c7d:	5b                   	pop    %ebx
     c7e:	5e                   	pop    %esi
     c7f:	5f                   	pop    %edi
     c80:	5d                   	pop    %ebp
     c81:	c3                   	ret
     c82:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     c89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000c90 <stat>:

int
stat(char *n, struct stat *st)
{
     c90:	55                   	push   %ebp
     c91:	89 e5                	mov    %esp,%ebp
     c93:	56                   	push   %esi
     c94:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     c95:	83 ec 08             	sub    $0x8,%esp
     c98:	6a 00                	push   $0x0
     c9a:	ff 75 08             	push   0x8(%ebp)
     c9d:	e8 f1 00 00 00       	call   d93 <open>
  if(fd < 0)
     ca2:	83 c4 10             	add    $0x10,%esp
     ca5:	85 c0                	test   %eax,%eax
     ca7:	78 27                	js     cd0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
     ca9:	83 ec 08             	sub    $0x8,%esp
     cac:	ff 75 0c             	push   0xc(%ebp)
     caf:	89 c3                	mov    %eax,%ebx
     cb1:	50                   	push   %eax
     cb2:	e8 f4 00 00 00       	call   dab <fstat>
  close(fd);
     cb7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
     cba:	89 c6                	mov    %eax,%esi
  close(fd);
     cbc:	e8 ba 00 00 00       	call   d7b <close>
  return r;
     cc1:	83 c4 10             	add    $0x10,%esp
}
     cc4:	8d 65 f8             	lea    -0x8(%ebp),%esp
     cc7:	89 f0                	mov    %esi,%eax
     cc9:	5b                   	pop    %ebx
     cca:	5e                   	pop    %esi
     ccb:	5d                   	pop    %ebp
     ccc:	c3                   	ret
     ccd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
     cd0:	be ff ff ff ff       	mov    $0xffffffff,%esi
     cd5:	eb ed                	jmp    cc4 <stat+0x34>
     cd7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     cde:	66 90                	xchg   %ax,%ax

00000ce0 <atoi>:

int
atoi(const char *s)
{
     ce0:	55                   	push   %ebp
     ce1:	89 e5                	mov    %esp,%ebp
     ce3:	53                   	push   %ebx
     ce4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     ce7:	0f be 02             	movsbl (%edx),%eax
     cea:	8d 48 d0             	lea    -0x30(%eax),%ecx
     ced:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
     cf0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
     cf5:	77 1e                	ja     d15 <atoi+0x35>
     cf7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     cfe:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
     d00:	83 c2 01             	add    $0x1,%edx
     d03:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
     d06:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
     d0a:	0f be 02             	movsbl (%edx),%eax
     d0d:	8d 58 d0             	lea    -0x30(%eax),%ebx
     d10:	80 fb 09             	cmp    $0x9,%bl
     d13:	76 eb                	jbe    d00 <atoi+0x20>
  return n;
}
     d15:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     d18:	89 c8                	mov    %ecx,%eax
     d1a:	c9                   	leave
     d1b:	c3                   	ret
     d1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000d20 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     d20:	55                   	push   %ebp
     d21:	89 e5                	mov    %esp,%ebp
     d23:	57                   	push   %edi
     d24:	56                   	push   %esi
     d25:	8b 45 10             	mov    0x10(%ebp),%eax
     d28:	8b 55 08             	mov    0x8(%ebp),%edx
     d2b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     d2e:	85 c0                	test   %eax,%eax
     d30:	7e 13                	jle    d45 <memmove+0x25>
     d32:	01 d0                	add    %edx,%eax
  dst = vdst;
     d34:	89 d7                	mov    %edx,%edi
     d36:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     d3d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
     d40:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
     d41:	39 f8                	cmp    %edi,%eax
     d43:	75 fb                	jne    d40 <memmove+0x20>
  return vdst;
}
     d45:	5e                   	pop    %esi
     d46:	89 d0                	mov    %edx,%eax
     d48:	5f                   	pop    %edi
     d49:	5d                   	pop    %ebp
     d4a:	c3                   	ret

00000d4b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     d4b:	b8 01 00 00 00       	mov    $0x1,%eax
     d50:	cd 40                	int    $0x40
     d52:	c3                   	ret

00000d53 <exit>:
SYSCALL(exit)
     d53:	b8 02 00 00 00       	mov    $0x2,%eax
     d58:	cd 40                	int    $0x40
     d5a:	c3                   	ret

00000d5b <wait>:
SYSCALL(wait)
     d5b:	b8 03 00 00 00       	mov    $0x3,%eax
     d60:	cd 40                	int    $0x40
     d62:	c3                   	ret

00000d63 <pipe>:
SYSCALL(pipe)
     d63:	b8 04 00 00 00       	mov    $0x4,%eax
     d68:	cd 40                	int    $0x40
     d6a:	c3                   	ret

00000d6b <read>:
SYSCALL(read)
     d6b:	b8 05 00 00 00       	mov    $0x5,%eax
     d70:	cd 40                	int    $0x40
     d72:	c3                   	ret

00000d73 <write>:
SYSCALL(write)
     d73:	b8 10 00 00 00       	mov    $0x10,%eax
     d78:	cd 40                	int    $0x40
     d7a:	c3                   	ret

00000d7b <close>:
SYSCALL(close)
     d7b:	b8 15 00 00 00       	mov    $0x15,%eax
     d80:	cd 40                	int    $0x40
     d82:	c3                   	ret

00000d83 <kill>:
SYSCALL(kill)
     d83:	b8 06 00 00 00       	mov    $0x6,%eax
     d88:	cd 40                	int    $0x40
     d8a:	c3                   	ret

00000d8b <exec>:
SYSCALL(exec)
     d8b:	b8 07 00 00 00       	mov    $0x7,%eax
     d90:	cd 40                	int    $0x40
     d92:	c3                   	ret

00000d93 <open>:
SYSCALL(open)
     d93:	b8 0f 00 00 00       	mov    $0xf,%eax
     d98:	cd 40                	int    $0x40
     d9a:	c3                   	ret

00000d9b <mknod>:
SYSCALL(mknod)
     d9b:	b8 11 00 00 00       	mov    $0x11,%eax
     da0:	cd 40                	int    $0x40
     da2:	c3                   	ret

00000da3 <unlink>:
SYSCALL(unlink)
     da3:	b8 12 00 00 00       	mov    $0x12,%eax
     da8:	cd 40                	int    $0x40
     daa:	c3                   	ret

00000dab <fstat>:
SYSCALL(fstat)
     dab:	b8 08 00 00 00       	mov    $0x8,%eax
     db0:	cd 40                	int    $0x40
     db2:	c3                   	ret

00000db3 <link>:
SYSCALL(link)
     db3:	b8 13 00 00 00       	mov    $0x13,%eax
     db8:	cd 40                	int    $0x40
     dba:	c3                   	ret

00000dbb <mkdir>:
SYSCALL(mkdir)
     dbb:	b8 14 00 00 00       	mov    $0x14,%eax
     dc0:	cd 40                	int    $0x40
     dc2:	c3                   	ret

00000dc3 <chdir>:
SYSCALL(chdir)
     dc3:	b8 09 00 00 00       	mov    $0x9,%eax
     dc8:	cd 40                	int    $0x40
     dca:	c3                   	ret

00000dcb <dup>:
SYSCALL(dup)
     dcb:	b8 0a 00 00 00       	mov    $0xa,%eax
     dd0:	cd 40                	int    $0x40
     dd2:	c3                   	ret

00000dd3 <getpid>:
SYSCALL(getpid)
     dd3:	b8 0b 00 00 00       	mov    $0xb,%eax
     dd8:	cd 40                	int    $0x40
     dda:	c3                   	ret

00000ddb <sbrk>:
SYSCALL(sbrk)
     ddb:	b8 0c 00 00 00       	mov    $0xc,%eax
     de0:	cd 40                	int    $0x40
     de2:	c3                   	ret

00000de3 <sleep>:
SYSCALL(sleep)
     de3:	b8 0d 00 00 00       	mov    $0xd,%eax
     de8:	cd 40                	int    $0x40
     dea:	c3                   	ret

00000deb <uptime>:
SYSCALL(uptime)
     deb:	b8 0e 00 00 00       	mov    $0xe,%eax
     df0:	cd 40                	int    $0x40
     df2:	c3                   	ret

00000df3 <shutdown>:
SYSCALL(shutdown)
     df3:	b8 16 00 00 00       	mov    $0x16,%eax
     df8:	cd 40                	int    $0x40
     dfa:	c3                   	ret

00000dfb <cps>:
SYSCALL(cps)
     dfb:	b8 17 00 00 00       	mov    $0x17,%eax
     e00:	cd 40                	int    $0x40
     e02:	c3                   	ret

00000e03 <chpr>:
SYSCALL(chpr)
     e03:	b8 18 00 00 00       	mov    $0x18,%eax
     e08:	cd 40                	int    $0x40
     e0a:	c3                   	ret
     e0b:	66 90                	xchg   %ax,%ax
     e0d:	66 90                	xchg   %ax,%ax
     e0f:	90                   	nop

00000e10 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
     e10:	55                   	push   %ebp
     e11:	89 e5                	mov    %esp,%ebp
     e13:	57                   	push   %edi
     e14:	56                   	push   %esi
     e15:	53                   	push   %ebx
     e16:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
     e18:	89 d1                	mov    %edx,%ecx
{
     e1a:	83 ec 3c             	sub    $0x3c,%esp
     e1d:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
     e20:	85 d2                	test   %edx,%edx
     e22:	0f 89 80 00 00 00    	jns    ea8 <printint+0x98>
     e28:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
     e2c:	74 7a                	je     ea8 <printint+0x98>
    x = -xx;
     e2e:	f7 d9                	neg    %ecx
    neg = 1;
     e30:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
     e35:	89 45 c4             	mov    %eax,-0x3c(%ebp)
     e38:	31 f6                	xor    %esi,%esi
     e3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
     e40:	89 c8                	mov    %ecx,%eax
     e42:	31 d2                	xor    %edx,%edx
     e44:	89 f7                	mov    %esi,%edi
     e46:	f7 f3                	div    %ebx
     e48:	8d 76 01             	lea    0x1(%esi),%esi
     e4b:	0f b6 92 58 13 00 00 	movzbl 0x1358(%edx),%edx
     e52:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
     e56:	89 ca                	mov    %ecx,%edx
     e58:	89 c1                	mov    %eax,%ecx
     e5a:	39 da                	cmp    %ebx,%edx
     e5c:	73 e2                	jae    e40 <printint+0x30>
  if(neg)
     e5e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
     e61:	85 c0                	test   %eax,%eax
     e63:	74 07                	je     e6c <printint+0x5c>
    buf[i++] = '-';
     e65:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)
    buf[i++] = digits[x % base];
     e6a:	89 f7                	mov    %esi,%edi
     e6c:	8d 5d d8             	lea    -0x28(%ebp),%ebx
     e6f:	8b 75 c0             	mov    -0x40(%ebp),%esi
     e72:	01 df                	add    %ebx,%edi
     e74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  while(--i >= 0)
    putc(fd, buf[i]);
     e78:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
     e7b:	83 ec 04             	sub    $0x4,%esp
     e7e:	88 45 d7             	mov    %al,-0x29(%ebp)
     e81:	8d 45 d7             	lea    -0x29(%ebp),%eax
     e84:	6a 01                	push   $0x1
     e86:	50                   	push   %eax
     e87:	56                   	push   %esi
     e88:	e8 e6 fe ff ff       	call   d73 <write>
  while(--i >= 0)
     e8d:	89 f8                	mov    %edi,%eax
     e8f:	83 c4 10             	add    $0x10,%esp
     e92:	83 ef 01             	sub    $0x1,%edi
     e95:	39 d8                	cmp    %ebx,%eax
     e97:	75 df                	jne    e78 <printint+0x68>
}
     e99:	8d 65 f4             	lea    -0xc(%ebp),%esp
     e9c:	5b                   	pop    %ebx
     e9d:	5e                   	pop    %esi
     e9e:	5f                   	pop    %edi
     e9f:	5d                   	pop    %ebp
     ea0:	c3                   	ret
     ea1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
     ea8:	31 c0                	xor    %eax,%eax
     eaa:	eb 89                	jmp    e35 <printint+0x25>
     eac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000eb0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     eb0:	55                   	push   %ebp
     eb1:	89 e5                	mov    %esp,%ebp
     eb3:	57                   	push   %edi
     eb4:	56                   	push   %esi
     eb5:	53                   	push   %ebx
     eb6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     eb9:	8b 75 0c             	mov    0xc(%ebp),%esi
{
     ebc:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
     ebf:	0f b6 1e             	movzbl (%esi),%ebx
     ec2:	83 c6 01             	add    $0x1,%esi
     ec5:	84 db                	test   %bl,%bl
     ec7:	74 67                	je     f30 <printf+0x80>
     ec9:	8d 4d 10             	lea    0x10(%ebp),%ecx
     ecc:	31 d2                	xor    %edx,%edx
     ece:	89 4d d0             	mov    %ecx,-0x30(%ebp)
     ed1:	eb 34                	jmp    f07 <printf+0x57>
     ed3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     ed7:	90                   	nop
     ed8:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
     edb:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
     ee0:	83 f8 25             	cmp    $0x25,%eax
     ee3:	74 18                	je     efd <printf+0x4d>
  write(fd, &c, 1);
     ee5:	83 ec 04             	sub    $0x4,%esp
     ee8:	8d 45 e7             	lea    -0x19(%ebp),%eax
     eeb:	88 5d e7             	mov    %bl,-0x19(%ebp)
     eee:	6a 01                	push   $0x1
     ef0:	50                   	push   %eax
     ef1:	57                   	push   %edi
     ef2:	e8 7c fe ff ff       	call   d73 <write>
     ef7:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
     efa:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
     efd:	0f b6 1e             	movzbl (%esi),%ebx
     f00:	83 c6 01             	add    $0x1,%esi
     f03:	84 db                	test   %bl,%bl
     f05:	74 29                	je     f30 <printf+0x80>
    c = fmt[i] & 0xff;
     f07:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
     f0a:	85 d2                	test   %edx,%edx
     f0c:	74 ca                	je     ed8 <printf+0x28>
      }
    } else if(state == '%'){
     f0e:	83 fa 25             	cmp    $0x25,%edx
     f11:	75 ea                	jne    efd <printf+0x4d>
      if(c == 'd'){
     f13:	83 f8 25             	cmp    $0x25,%eax
     f16:	0f 84 24 01 00 00    	je     1040 <printf+0x190>
     f1c:	83 e8 63             	sub    $0x63,%eax
     f1f:	83 f8 15             	cmp    $0x15,%eax
     f22:	77 1c                	ja     f40 <printf+0x90>
     f24:	ff 24 85 00 13 00 00 	jmp    *0x1300(,%eax,4)
     f2b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     f2f:	90                   	nop
        putc(fd, c);
      }
      state = 0;
    }
  }
}
     f30:	8d 65 f4             	lea    -0xc(%ebp),%esp
     f33:	5b                   	pop    %ebx
     f34:	5e                   	pop    %esi
     f35:	5f                   	pop    %edi
     f36:	5d                   	pop    %ebp
     f37:	c3                   	ret
     f38:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     f3f:	90                   	nop
  write(fd, &c, 1);
     f40:	83 ec 04             	sub    $0x4,%esp
     f43:	8d 55 e7             	lea    -0x19(%ebp),%edx
     f46:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
     f4a:	6a 01                	push   $0x1
     f4c:	52                   	push   %edx
     f4d:	89 55 d4             	mov    %edx,-0x2c(%ebp)
     f50:	57                   	push   %edi
     f51:	e8 1d fe ff ff       	call   d73 <write>
     f56:	83 c4 0c             	add    $0xc,%esp
     f59:	88 5d e7             	mov    %bl,-0x19(%ebp)
     f5c:	6a 01                	push   $0x1
     f5e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     f61:	52                   	push   %edx
     f62:	57                   	push   %edi
     f63:	e8 0b fe ff ff       	call   d73 <write>
        putc(fd, c);
     f68:	83 c4 10             	add    $0x10,%esp
      state = 0;
     f6b:	31 d2                	xor    %edx,%edx
     f6d:	eb 8e                	jmp    efd <printf+0x4d>
     f6f:	90                   	nop
        printint(fd, *ap, 16, 0);
     f70:	8b 5d d0             	mov    -0x30(%ebp),%ebx
     f73:	83 ec 0c             	sub    $0xc,%esp
     f76:	b9 10 00 00 00       	mov    $0x10,%ecx
     f7b:	8b 13                	mov    (%ebx),%edx
     f7d:	6a 00                	push   $0x0
     f7f:	89 f8                	mov    %edi,%eax
        ap++;
     f81:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
     f84:	e8 87 fe ff ff       	call   e10 <printint>
        ap++;
     f89:	89 5d d0             	mov    %ebx,-0x30(%ebp)
     f8c:	83 c4 10             	add    $0x10,%esp
      state = 0;
     f8f:	31 d2                	xor    %edx,%edx
     f91:	e9 67 ff ff ff       	jmp    efd <printf+0x4d>
     f96:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     f9d:	8d 76 00             	lea    0x0(%esi),%esi
        s = (char*)*ap;
     fa0:	8b 45 d0             	mov    -0x30(%ebp),%eax
     fa3:	8b 18                	mov    (%eax),%ebx
        ap++;
     fa5:	83 c0 04             	add    $0x4,%eax
     fa8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
     fab:	85 db                	test   %ebx,%ebx
     fad:	0f 84 9d 00 00 00    	je     1050 <printf+0x1a0>
        while(*s != 0){
     fb3:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
     fb6:	31 d2                	xor    %edx,%edx
        while(*s != 0){
     fb8:	84 c0                	test   %al,%al
     fba:	0f 84 3d ff ff ff    	je     efd <printf+0x4d>
     fc0:	8d 55 e7             	lea    -0x19(%ebp),%edx
     fc3:	89 75 d4             	mov    %esi,-0x2c(%ebp)
     fc6:	89 de                	mov    %ebx,%esi
     fc8:	89 d3                	mov    %edx,%ebx
     fca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  write(fd, &c, 1);
     fd0:	83 ec 04             	sub    $0x4,%esp
     fd3:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
     fd6:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
     fd9:	6a 01                	push   $0x1
     fdb:	53                   	push   %ebx
     fdc:	57                   	push   %edi
     fdd:	e8 91 fd ff ff       	call   d73 <write>
        while(*s != 0){
     fe2:	0f b6 06             	movzbl (%esi),%eax
     fe5:	83 c4 10             	add    $0x10,%esp
     fe8:	84 c0                	test   %al,%al
     fea:	75 e4                	jne    fd0 <printf+0x120>
      state = 0;
     fec:	8b 75 d4             	mov    -0x2c(%ebp),%esi
     fef:	31 d2                	xor    %edx,%edx
     ff1:	e9 07 ff ff ff       	jmp    efd <printf+0x4d>
     ff6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     ffd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1000:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    1003:	83 ec 0c             	sub    $0xc,%esp
    1006:	b9 0a 00 00 00       	mov    $0xa,%ecx
    100b:	8b 13                	mov    (%ebx),%edx
    100d:	6a 01                	push   $0x1
    100f:	e9 6b ff ff ff       	jmp    f7f <printf+0xcf>
    1014:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    1018:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
    101b:	83 ec 04             	sub    $0x4,%esp
    101e:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
    1021:	8b 03                	mov    (%ebx),%eax
        ap++;
    1023:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
    1026:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1029:	6a 01                	push   $0x1
    102b:	52                   	push   %edx
    102c:	57                   	push   %edi
    102d:	e8 41 fd ff ff       	call   d73 <write>
        ap++;
    1032:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    1035:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1038:	31 d2                	xor    %edx,%edx
    103a:	e9 be fe ff ff       	jmp    efd <printf+0x4d>
    103f:	90                   	nop
  write(fd, &c, 1);
    1040:	83 ec 04             	sub    $0x4,%esp
    1043:	88 5d e7             	mov    %bl,-0x19(%ebp)
    1046:	8d 55 e7             	lea    -0x19(%ebp),%edx
    1049:	6a 01                	push   $0x1
    104b:	e9 11 ff ff ff       	jmp    f61 <printf+0xb1>
    1050:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
    1055:	bb f8 12 00 00       	mov    $0x12f8,%ebx
    105a:	e9 61 ff ff ff       	jmp    fc0 <printf+0x110>
    105f:	90                   	nop

00001060 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1060:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1061:	a1 84 19 00 00       	mov    0x1984,%eax
{
    1066:	89 e5                	mov    %esp,%ebp
    1068:	57                   	push   %edi
    1069:	56                   	push   %esi
    106a:	53                   	push   %ebx
    106b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    106e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1071:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1078:	89 c2                	mov    %eax,%edx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    107a:	8b 00                	mov    (%eax),%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    107c:	39 ca                	cmp    %ecx,%edx
    107e:	73 30                	jae    10b0 <free+0x50>
    1080:	39 c1                	cmp    %eax,%ecx
    1082:	72 04                	jb     1088 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1084:	39 c2                	cmp    %eax,%edx
    1086:	72 f0                	jb     1078 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1088:	8b 73 fc             	mov    -0x4(%ebx),%esi
    108b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    108e:	39 f8                	cmp    %edi,%eax
    1090:	74 2e                	je     10c0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    1092:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    1095:	8b 42 04             	mov    0x4(%edx),%eax
    1098:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    109b:	39 f1                	cmp    %esi,%ecx
    109d:	74 38                	je     10d7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    109f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
    10a1:	5b                   	pop    %ebx
  freep = p;
    10a2:	89 15 84 19 00 00    	mov    %edx,0x1984
}
    10a8:	5e                   	pop    %esi
    10a9:	5f                   	pop    %edi
    10aa:	5d                   	pop    %ebp
    10ab:	c3                   	ret
    10ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    10b0:	39 c1                	cmp    %eax,%ecx
    10b2:	72 d0                	jb     1084 <free+0x24>
    10b4:	eb c2                	jmp    1078 <free+0x18>
    10b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10bd:	8d 76 00             	lea    0x0(%esi),%esi
    bp->s.size += p->s.ptr->s.size;
    10c0:	03 70 04             	add    0x4(%eax),%esi
    10c3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    10c6:	8b 02                	mov    (%edx),%eax
    10c8:	8b 00                	mov    (%eax),%eax
    10ca:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    10cd:	8b 42 04             	mov    0x4(%edx),%eax
    10d0:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    10d3:	39 f1                	cmp    %esi,%ecx
    10d5:	75 c8                	jne    109f <free+0x3f>
    p->s.size += bp->s.size;
    10d7:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
    10da:	89 15 84 19 00 00    	mov    %edx,0x1984
    p->s.size += bp->s.size;
    10e0:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
    10e3:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    10e6:	89 0a                	mov    %ecx,(%edx)
}
    10e8:	5b                   	pop    %ebx
    10e9:	5e                   	pop    %esi
    10ea:	5f                   	pop    %edi
    10eb:	5d                   	pop    %ebp
    10ec:	c3                   	ret
    10ed:	8d 76 00             	lea    0x0(%esi),%esi

000010f0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    10f0:	55                   	push   %ebp
    10f1:	89 e5                	mov    %esp,%ebp
    10f3:	57                   	push   %edi
    10f4:	56                   	push   %esi
    10f5:	53                   	push   %ebx
    10f6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    10f9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    10fc:	8b 15 84 19 00 00    	mov    0x1984,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1102:	8d 78 07             	lea    0x7(%eax),%edi
    1105:	c1 ef 03             	shr    $0x3,%edi
    1108:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    110b:	85 d2                	test   %edx,%edx
    110d:	0f 84 8d 00 00 00    	je     11a0 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1113:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    1115:	8b 48 04             	mov    0x4(%eax),%ecx
    1118:	39 f9                	cmp    %edi,%ecx
    111a:	73 64                	jae    1180 <malloc+0x90>
  if(nu < 4096)
    111c:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1121:	39 df                	cmp    %ebx,%edi
    1123:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    1126:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    112d:	eb 0a                	jmp    1139 <malloc+0x49>
    112f:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1130:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    1132:	8b 48 04             	mov    0x4(%eax),%ecx
    1135:	39 f9                	cmp    %edi,%ecx
    1137:	73 47                	jae    1180 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1139:	89 c2                	mov    %eax,%edx
    113b:	39 05 84 19 00 00    	cmp    %eax,0x1984
    1141:	75 ed                	jne    1130 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
    1143:	83 ec 0c             	sub    $0xc,%esp
    1146:	56                   	push   %esi
    1147:	e8 8f fc ff ff       	call   ddb <sbrk>
  if(p == (char*)-1)
    114c:	83 c4 10             	add    $0x10,%esp
    114f:	83 f8 ff             	cmp    $0xffffffff,%eax
    1152:	74 1c                	je     1170 <malloc+0x80>
  hp->s.size = nu;
    1154:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    1157:	83 ec 0c             	sub    $0xc,%esp
    115a:	83 c0 08             	add    $0x8,%eax
    115d:	50                   	push   %eax
    115e:	e8 fd fe ff ff       	call   1060 <free>
  return freep;
    1163:	8b 15 84 19 00 00    	mov    0x1984,%edx
      if((p = morecore(nunits)) == 0)
    1169:	83 c4 10             	add    $0x10,%esp
    116c:	85 d2                	test   %edx,%edx
    116e:	75 c0                	jne    1130 <malloc+0x40>
        return 0;
  }
}
    1170:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    1173:	31 c0                	xor    %eax,%eax
}
    1175:	5b                   	pop    %ebx
    1176:	5e                   	pop    %esi
    1177:	5f                   	pop    %edi
    1178:	5d                   	pop    %ebp
    1179:	c3                   	ret
    117a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    1180:	39 cf                	cmp    %ecx,%edi
    1182:	74 4c                	je     11d0 <malloc+0xe0>
        p->s.size -= nunits;
    1184:	29 f9                	sub    %edi,%ecx
    1186:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1189:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    118c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    118f:	89 15 84 19 00 00    	mov    %edx,0x1984
}
    1195:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    1198:	83 c0 08             	add    $0x8,%eax
}
    119b:	5b                   	pop    %ebx
    119c:	5e                   	pop    %esi
    119d:	5f                   	pop    %edi
    119e:	5d                   	pop    %ebp
    119f:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
    11a0:	c7 05 84 19 00 00 88 	movl   $0x1988,0x1984
    11a7:	19 00 00 
    base.s.size = 0;
    11aa:	b8 88 19 00 00       	mov    $0x1988,%eax
    base.s.ptr = freep = prevp = &base;
    11af:	c7 05 88 19 00 00 88 	movl   $0x1988,0x1988
    11b6:	19 00 00 
    base.s.size = 0;
    11b9:	c7 05 8c 19 00 00 00 	movl   $0x0,0x198c
    11c0:	00 00 00 
    if(p->s.size >= nunits){
    11c3:	e9 54 ff ff ff       	jmp    111c <malloc+0x2c>
    11c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11cf:	90                   	nop
        prevp->s.ptr = p->s.ptr;
    11d0:	8b 08                	mov    (%eax),%ecx
    11d2:	89 0a                	mov    %ecx,(%edx)
    11d4:	eb b9                	jmp    118f <malloc+0x9f>
