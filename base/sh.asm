
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
      26:	68 1a 13 00 00       	push   $0x131a
      2b:	e8 03 0e 00 00       	call   e33 <open>
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
      40:	80 3d c2 19 00 00 20 	cmpb   $0x20,0x19c2
      47:	0f 84 8d 00 00 00    	je     da <main+0xda>
      4d:	8d 76 00             	lea    0x0(%esi),%esi
int
fork1(void)
{
  int pid;

  pid = fork();
      50:	e8 96 0d 00 00       	call   deb <fork>
  if(pid == -1)
      55:	83 f8 ff             	cmp    $0xffffffff,%eax
      58:	0f 84 c1 00 00 00    	je     11f <main+0x11f>
    if(fork1() == 0)
      5e:	85 c0                	test   %eax,%eax
      60:	74 63                	je     c5 <main+0xc5>
    wait();
      62:	e8 94 0d 00 00       	call   dfb <wait>
  printf(2, "$ ");
      67:	83 ec 08             	sub    $0x8,%esp
      6a:	68 78 12 00 00       	push   $0x1278
      6f:	6a 02                	push   $0x2
      71:	e8 da 0e 00 00       	call   f50 <printf>
  memset(buf, 0, nbuf);
      76:	83 c4 0c             	add    $0xc,%esp
      79:	6a 64                	push   $0x64
      7b:	6a 00                	push   $0x0
      7d:	68 c0 19 00 00       	push   $0x19c0
      82:	e8 e9 0b 00 00       	call   c70 <memset>
  gets(buf, nbuf);
      87:	58                   	pop    %eax
      88:	5a                   	pop    %edx
      89:	6a 64                	push   $0x64
      8b:	68 c0 19 00 00       	push   $0x19c0
      90:	e8 3b 0c 00 00       	call   cd0 <gets>
  if(buf[0] == 0) // EOF
      95:	0f b6 05 c0 19 00 00 	movzbl 0x19c0,%eax
      9c:	83 c4 10             	add    $0x10,%esp
      9f:	84 c0                	test   %al,%al
      a1:	74 0f                	je     b2 <main+0xb2>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      a3:	3c 63                	cmp    $0x63,%al
      a5:	75 a9                	jne    50 <main+0x50>
      a7:	80 3d c1 19 00 00 64 	cmpb   $0x64,0x19c1
      ae:	75 a0                	jne    50 <main+0x50>
      b0:	eb 8e                	jmp    40 <main+0x40>
  exit();
      b2:	e8 3c 0d 00 00       	call   df3 <exit>
      close(fd);
      b7:	83 ec 0c             	sub    $0xc,%esp
      ba:	50                   	push   %eax
      bb:	e8 5b 0d 00 00       	call   e1b <close>
      break;
      c0:	83 c4 10             	add    $0x10,%esp
      c3:	eb a2                	jmp    67 <main+0x67>
      runcmd(parsecmd(buf));
      c5:	83 ec 0c             	sub    $0xc,%esp
      c8:	68 c0 19 00 00       	push   $0x19c0
      cd:	e8 6e 0a 00 00       	call   b40 <parsecmd>
      d2:	89 04 24             	mov    %eax,(%esp)
      d5:	e8 d6 00 00 00       	call   1b0 <runcmd>
      buf[strlen(buf)-1] = 0;  // chop \n
      da:	83 ec 0c             	sub    $0xc,%esp
      dd:	68 c0 19 00 00       	push   $0x19c0
      e2:	e8 59 0b 00 00       	call   c40 <strlen>
      if(chdir(buf+3) < 0)
      e7:	c7 04 24 c3 19 00 00 	movl   $0x19c3,(%esp)
      buf[strlen(buf)-1] = 0;  // chop \n
      ee:	c6 80 bf 19 00 00 00 	movb   $0x0,0x19bf(%eax)
      if(chdir(buf+3) < 0)
      f5:	e8 69 0d 00 00       	call   e63 <chdir>
      fa:	83 c4 10             	add    $0x10,%esp
      fd:	85 c0                	test   %eax,%eax
      ff:	0f 89 62 ff ff ff    	jns    67 <main+0x67>
        printf(2, "cannot cd %s\n", buf+3);
     105:	51                   	push   %ecx
     106:	68 c3 19 00 00       	push   $0x19c3
     10b:	68 22 13 00 00       	push   $0x1322
     110:	6a 02                	push   $0x2
     112:	e8 39 0e 00 00       	call   f50 <printf>
     117:	83 c4 10             	add    $0x10,%esp
     11a:	e9 48 ff ff ff       	jmp    67 <main+0x67>
    panic("fork");
     11f:	83 ec 0c             	sub    $0xc,%esp
     122:	68 7b 12 00 00       	push   $0x127b
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
     13e:	68 78 12 00 00       	push   $0x1278
     143:	6a 02                	push   $0x2
     145:	e8 06 0e 00 00       	call   f50 <printf>
  memset(buf, 0, nbuf);
     14a:	83 c4 0c             	add    $0xc,%esp
     14d:	56                   	push   %esi
     14e:	6a 00                	push   $0x0
     150:	53                   	push   %ebx
     151:	e8 1a 0b 00 00       	call   c70 <memset>
  gets(buf, nbuf);
     156:	58                   	pop    %eax
     157:	5a                   	pop    %edx
     158:	56                   	push   %esi
     159:	53                   	push   %ebx
     15a:	e8 71 0b 00 00       	call   cd0 <gets>
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
     179:	68 16 13 00 00       	push   $0x1316
     17e:	6a 02                	push   $0x2
     180:	e8 cb 0d 00 00       	call   f50 <printf>
  exit();
     185:	e8 69 0c 00 00       	call   df3 <exit>
     18a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000190 <fork1>:
{
     190:	55                   	push   %ebp
     191:	89 e5                	mov    %esp,%ebp
     193:	83 ec 08             	sub    $0x8,%esp
  pid = fork();
     196:	e8 50 0c 00 00       	call   deb <fork>
  if(pid == -1)
     19b:	83 f8 ff             	cmp    $0xffffffff,%eax
     19e:	74 02                	je     1a2 <fork1+0x12>
  return pid;
}
     1a0:	c9                   	leave
     1a1:	c3                   	ret
    panic("fork");
     1a2:	83 ec 0c             	sub    $0xc,%esp
     1a5:	68 7b 12 00 00       	push   $0x127b
     1aa:	e8 c1 ff ff ff       	call   170 <panic>
     1af:	90                   	nop

000001b0 <runcmd>:
{
     1b0:	55                   	push   %ebp
     1b1:	89 e5                	mov    %esp,%ebp
     1b3:	56                   	push   %esi
     1b4:	53                   	push   %ebx
     1b5:	83 ec 10             	sub    $0x10,%esp
     1b8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(cmd == 0)
     1bb:	85 db                	test   %ebx,%ebx
     1bd:	74 61                	je     220 <runcmd+0x70>
  switch(cmd->type){
     1bf:	83 3b 05             	cmpl   $0x5,(%ebx)
     1c2:	0f 87 e1 00 00 00    	ja     2a9 <runcmd+0xf9>
     1c8:	8b 03                	mov    (%ebx),%eax
     1ca:	ff 24 85 50 13 00 00 	jmp    *0x1350(,%eax,4)
    pipe(p);
     1d1:	83 ec 0c             	sub    $0xc,%esp
     1d4:	8d 45 f0             	lea    -0x10(%ebp),%eax
     1d7:	50                   	push   %eax
     1d8:	e8 26 0c 00 00       	call   e03 <pipe>
    if(fork1() == 0) {
     1dd:	e8 ae ff ff ff       	call   190 <fork1>
     1e2:	83 c4 10             	add    $0x10,%esp
     1e5:	85 c0                	test   %eax,%eax
     1e7:	0f 84 c9 00 00 00    	je     2b6 <runcmd+0x106>
    if(fork1() == 0) {
     1ed:	e8 9e ff ff ff       	call   190 <fork1>
     1f2:	85 c0                	test   %eax,%eax
     1f4:	0f 84 ea 00 00 00    	je     2e4 <runcmd+0x134>
    close(p[0]);
     1fa:	83 ec 0c             	sub    $0xc,%esp
     1fd:	ff 75 f0             	push   -0x10(%ebp)
     200:	e8 16 0c 00 00       	call   e1b <close>
    close(p[1]);
     205:	5a                   	pop    %edx
     206:	ff 75 f4             	push   -0xc(%ebp)
     209:	e8 0d 0c 00 00       	call   e1b <close>
    wait();
     20e:	e8 e8 0b 00 00       	call   dfb <wait>
    wait();
     213:	e8 e3 0b 00 00       	call   dfb <wait>
    break;
     218:	83 c4 10             	add    $0x10,%esp
     21b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     21f:	90                   	nop
    exit();
     220:	e8 ce 0b 00 00       	call   df3 <exit>
    printf(2, "Backgrounding not implemented\n");
     225:	50                   	push   %eax
     226:	50                   	push   %eax
     227:	68 30 13 00 00       	push   $0x1330
     22c:	6a 02                	push   $0x2
     22e:	e8 1d 0d 00 00       	call   f50 <printf>
    break;
     233:	83 c4 10             	add    $0x10,%esp
     236:	eb e8                	jmp    220 <runcmd+0x70>
    if(ecmd->argv[0] == 0)
     238:	8b 43 04             	mov    0x4(%ebx),%eax
     23b:	85 c0                	test   %eax,%eax
     23d:	74 e1                	je     220 <runcmd+0x70>
    exec(ecmd->argv[0], ecmd->argv);
     23f:	52                   	push   %edx
     240:	52                   	push   %edx
     241:	8d 53 04             	lea    0x4(%ebx),%edx
     244:	52                   	push   %edx
     245:	50                   	push   %eax
     246:	e8 e0 0b 00 00       	call   e2b <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
     24b:	83 c4 0c             	add    $0xc,%esp
     24e:	ff 73 04             	push   0x4(%ebx)
     251:	68 87 12 00 00       	push   $0x1287
     256:	6a 02                	push   $0x2
     258:	e8 f3 0c 00 00       	call   f50 <printf>
    break;
     25d:	83 c4 10             	add    $0x10,%esp
     260:	eb be                	jmp    220 <runcmd+0x70>
    int rfd = open(rfile, rmode);	
     262:	56                   	push   %esi
     263:	56                   	push   %esi
     264:	ff 73 10             	push   0x10(%ebx)
     267:	ff 73 08             	push   0x8(%ebx)
     26a:	e8 c4 0b 00 00       	call   e33 <open>
     26f:	89 c6                	mov    %eax,%esi
    close(rcmd->fd);
     271:	58                   	pop    %eax
     272:	ff 73 14             	push   0x14(%ebx)
     275:	e8 a1 0b 00 00       	call   e1b <close>
    dup(rfd);
     27a:	89 34 24             	mov    %esi,(%esp)
     27d:	e8 e9 0b 00 00       	call   e6b <dup>
    close(rfd);
     282:	89 34 24             	mov    %esi,(%esp)
     285:	e8 91 0b 00 00       	call   e1b <close>
    runcmd(rcmd->cmd);
     28a:	58                   	pop    %eax
     28b:	ff 73 04             	push   0x4(%ebx)
     28e:	e8 1d ff ff ff       	call   1b0 <runcmd>
    printf(2, "List Not Implemented\n");
     293:	51                   	push   %ecx
     294:	51                   	push   %ecx
     295:	68 97 12 00 00       	push   $0x1297
     29a:	6a 02                	push   $0x2
     29c:	e8 af 0c 00 00       	call   f50 <printf>
    break;
     2a1:	83 c4 10             	add    $0x10,%esp
     2a4:	e9 77 ff ff ff       	jmp    220 <runcmd+0x70>
    panic("runcmd");
     2a9:	83 ec 0c             	sub    $0xc,%esp
     2ac:	68 80 12 00 00       	push   $0x1280
     2b1:	e8 ba fe ff ff       	call   170 <panic>
      close(1);
     2b6:	83 ec 0c             	sub    $0xc,%esp
     2b9:	6a 01                	push   $0x1
     2bb:	e8 5b 0b 00 00       	call   e1b <close>
      dup(p[1]);
     2c0:	58                   	pop    %eax
     2c1:	ff 75 f4             	push   -0xc(%ebp)
     2c4:	e8 a2 0b 00 00       	call   e6b <dup>
      close(p[0]);
     2c9:	58                   	pop    %eax
     2ca:	ff 75 f0             	push   -0x10(%ebp)
     2cd:	e8 49 0b 00 00       	call   e1b <close>
      close(p[1]);
     2d2:	58                   	pop    %eax
     2d3:	ff 75 f4             	push   -0xc(%ebp)
     2d6:	e8 40 0b 00 00       	call   e1b <close>
      runcmd(pcmd->left);
     2db:	5a                   	pop    %edx
     2dc:	ff 73 04             	push   0x4(%ebx)
     2df:	e8 cc fe ff ff       	call   1b0 <runcmd>
      close(0);
     2e4:	83 ec 0c             	sub    $0xc,%esp
     2e7:	6a 00                	push   $0x0
     2e9:	e8 2d 0b 00 00       	call   e1b <close>
      dup(p[0]);
     2ee:	59                   	pop    %ecx
     2ef:	ff 75 f0             	push   -0x10(%ebp)
     2f2:	e8 74 0b 00 00       	call   e6b <dup>
      close(p[0]);
     2f7:	5e                   	pop    %esi
     2f8:	ff 75 f0             	push   -0x10(%ebp)
     2fb:	e8 1b 0b 00 00       	call   e1b <close>
      close(p[1]);
     300:	58                   	pop    %eax
     301:	ff 75 f4             	push   -0xc(%ebp)
     304:	e8 12 0b 00 00       	call   e1b <close>
      runcmd(pcmd->right);
     309:	58                   	pop    %eax
     30a:	ff 73 08             	push   0x8(%ebx)
     30d:	e8 9e fe ff ff       	call   1b0 <runcmd>
     312:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     319:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000320 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     320:	55                   	push   %ebp
     321:	89 e5                	mov    %esp,%ebp
     323:	53                   	push   %ebx
     324:	83 ec 10             	sub    $0x10,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     327:	6a 54                	push   $0x54
     329:	e8 62 0e 00 00       	call   1190 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     32e:	83 c4 0c             	add    $0xc,%esp
     331:	6a 54                	push   $0x54
  cmd = malloc(sizeof(*cmd));
     333:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     335:	6a 00                	push   $0x0
     337:	50                   	push   %eax
     338:	e8 33 09 00 00       	call   c70 <memset>
  cmd->type = EXEC;
     33d:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  return (struct cmd*)cmd;
}
     343:	89 d8                	mov    %ebx,%eax
     345:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     348:	c9                   	leave
     349:	c3                   	ret
     34a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000350 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     350:	55                   	push   %ebp
     351:	89 e5                	mov    %esp,%ebp
     353:	53                   	push   %ebx
     354:	83 ec 10             	sub    $0x10,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     357:	6a 18                	push   $0x18
     359:	e8 32 0e 00 00       	call   1190 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     35e:	83 c4 0c             	add    $0xc,%esp
     361:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     363:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     365:	6a 00                	push   $0x0
     367:	50                   	push   %eax
     368:	e8 03 09 00 00       	call   c70 <memset>
  cmd->type = REDIR;
  cmd->cmd = subcmd;
     36d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = REDIR;
     370:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
     376:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
     379:	8b 45 0c             	mov    0xc(%ebp),%eax
     37c:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
     37f:	8b 45 10             	mov    0x10(%ebp),%eax
     382:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
     385:	8b 45 14             	mov    0x14(%ebp),%eax
     388:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
     38b:	8b 45 18             	mov    0x18(%ebp),%eax
     38e:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
     391:	89 d8                	mov    %ebx,%eax
     393:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     396:	c9                   	leave
     397:	c3                   	ret
     398:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     39f:	90                   	nop

000003a0 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     3a0:	55                   	push   %ebp
     3a1:	89 e5                	mov    %esp,%ebp
     3a3:	53                   	push   %ebx
     3a4:	83 ec 10             	sub    $0x10,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3a7:	6a 0c                	push   $0xc
     3a9:	e8 e2 0d 00 00       	call   1190 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     3ae:	83 c4 0c             	add    $0xc,%esp
     3b1:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     3b3:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     3b5:	6a 00                	push   $0x0
     3b7:	50                   	push   %eax
     3b8:	e8 b3 08 00 00       	call   c70 <memset>
  cmd->type = PIPE;
  cmd->left = left;
     3bd:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = PIPE;
     3c0:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
     3c6:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     3c9:	8b 45 0c             	mov    0xc(%ebp),%eax
     3cc:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     3cf:	89 d8                	mov    %ebx,%eax
     3d1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     3d4:	c9                   	leave
     3d5:	c3                   	ret
     3d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     3dd:	8d 76 00             	lea    0x0(%esi),%esi

000003e0 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     3e0:	55                   	push   %ebp
     3e1:	89 e5                	mov    %esp,%ebp
     3e3:	53                   	push   %ebx
     3e4:	83 ec 10             	sub    $0x10,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3e7:	6a 0c                	push   $0xc
     3e9:	e8 a2 0d 00 00       	call   1190 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     3ee:	83 c4 0c             	add    $0xc,%esp
     3f1:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     3f3:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     3f5:	6a 00                	push   $0x0
     3f7:	50                   	push   %eax
     3f8:	e8 73 08 00 00       	call   c70 <memset>
  cmd->type = LIST;
  cmd->left = left;
     3fd:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = LIST;
     400:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
     406:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     409:	8b 45 0c             	mov    0xc(%ebp),%eax
     40c:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     40f:	89 d8                	mov    %ebx,%eax
     411:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     414:	c9                   	leave
     415:	c3                   	ret
     416:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     41d:	8d 76 00             	lea    0x0(%esi),%esi

00000420 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     420:	55                   	push   %ebp
     421:	89 e5                	mov    %esp,%ebp
     423:	53                   	push   %ebx
     424:	83 ec 10             	sub    $0x10,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     427:	6a 08                	push   $0x8
     429:	e8 62 0d 00 00       	call   1190 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     42e:	83 c4 0c             	add    $0xc,%esp
     431:	6a 08                	push   $0x8
  cmd = malloc(sizeof(*cmd));
     433:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     435:	6a 00                	push   $0x0
     437:	50                   	push   %eax
     438:	e8 33 08 00 00       	call   c70 <memset>
  cmd->type = BACK;
  cmd->cmd = subcmd;
     43d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = BACK;
     440:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
     446:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
     449:	89 d8                	mov    %ebx,%eax
     44b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     44e:	c9                   	leave
     44f:	c3                   	ret

00000450 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     450:	55                   	push   %ebp
     451:	89 e5                	mov    %esp,%ebp
     453:	57                   	push   %edi
     454:	56                   	push   %esi
     455:	53                   	push   %ebx
     456:	83 ec 0c             	sub    $0xc,%esp
  char *s;
  int ret;

  s = *ps;
     459:	8b 45 08             	mov    0x8(%ebp),%eax
{
     45c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     45f:	8b 75 10             	mov    0x10(%ebp),%esi
  s = *ps;
     462:	8b 38                	mov    (%eax),%edi
  while(s < es && strchr(whitespace, *s))
     464:	39 df                	cmp    %ebx,%edi
     466:	72 0f                	jb     477 <gettoken+0x27>
     468:	eb 25                	jmp    48f <gettoken+0x3f>
     46a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    s++;
     470:	83 c7 01             	add    $0x1,%edi
  while(s < es && strchr(whitespace, *s))
     473:	39 fb                	cmp    %edi,%ebx
     475:	74 18                	je     48f <gettoken+0x3f>
     477:	0f be 07             	movsbl (%edi),%eax
     47a:	83 ec 08             	sub    $0x8,%esp
     47d:	50                   	push   %eax
     47e:	68 9c 19 00 00       	push   $0x199c
     483:	e8 08 08 00 00       	call   c90 <strchr>
     488:	83 c4 10             	add    $0x10,%esp
     48b:	85 c0                	test   %eax,%eax
     48d:	75 e1                	jne    470 <gettoken+0x20>
  if(q)
     48f:	85 f6                	test   %esi,%esi
     491:	74 02                	je     495 <gettoken+0x45>
    *q = s;
     493:	89 3e                	mov    %edi,(%esi)
  ret = *s;
     495:	0f b6 07             	movzbl (%edi),%eax
  switch(*s){
     498:	3c 3c                	cmp    $0x3c,%al
     49a:	0f 8f d0 00 00 00    	jg     570 <gettoken+0x120>
     4a0:	3c 3a                	cmp    $0x3a,%al
     4a2:	0f 8f bc 00 00 00    	jg     564 <gettoken+0x114>
     4a8:	84 c0                	test   %al,%al
     4aa:	75 44                	jne    4f0 <gettoken+0xa0>
     4ac:	31 f6                	xor    %esi,%esi
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     4ae:	8b 4d 14             	mov    0x14(%ebp),%ecx
     4b1:	85 c9                	test   %ecx,%ecx
     4b3:	74 05                	je     4ba <gettoken+0x6a>
    *eq = s;
     4b5:	8b 45 14             	mov    0x14(%ebp),%eax
     4b8:	89 38                	mov    %edi,(%eax)

  while(s < es && strchr(whitespace, *s))
     4ba:	39 df                	cmp    %ebx,%edi
     4bc:	72 09                	jb     4c7 <gettoken+0x77>
     4be:	eb 1f                	jmp    4df <gettoken+0x8f>
    s++;
     4c0:	83 c7 01             	add    $0x1,%edi
  while(s < es && strchr(whitespace, *s))
     4c3:	39 fb                	cmp    %edi,%ebx
     4c5:	74 18                	je     4df <gettoken+0x8f>
     4c7:	0f be 07             	movsbl (%edi),%eax
     4ca:	83 ec 08             	sub    $0x8,%esp
     4cd:	50                   	push   %eax
     4ce:	68 9c 19 00 00       	push   $0x199c
     4d3:	e8 b8 07 00 00       	call   c90 <strchr>
     4d8:	83 c4 10             	add    $0x10,%esp
     4db:	85 c0                	test   %eax,%eax
     4dd:	75 e1                	jne    4c0 <gettoken+0x70>
  *ps = s;
     4df:	8b 45 08             	mov    0x8(%ebp),%eax
     4e2:	89 38                	mov    %edi,(%eax)
  return ret;
}
     4e4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     4e7:	89 f0                	mov    %esi,%eax
     4e9:	5b                   	pop    %ebx
     4ea:	5e                   	pop    %esi
     4eb:	5f                   	pop    %edi
     4ec:	5d                   	pop    %ebp
     4ed:	c3                   	ret
     4ee:	66 90                	xchg   %ax,%ax
  switch(*s){
     4f0:	79 66                	jns    558 <gettoken+0x108>
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     4f2:	39 df                	cmp    %ebx,%edi
     4f4:	72 39                	jb     52f <gettoken+0xdf>
  if(eq)
     4f6:	8b 55 14             	mov    0x14(%ebp),%edx
     4f9:	85 d2                	test   %edx,%edx
     4fb:	0f 84 b3 00 00 00    	je     5b4 <gettoken+0x164>
    *eq = s;
     501:	8b 45 14             	mov    0x14(%ebp),%eax
     504:	89 38                	mov    %edi,(%eax)
  while(s < es && strchr(whitespace, *s))
     506:	e9 a9 00 00 00       	jmp    5b4 <gettoken+0x164>
     50b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     50f:	90                   	nop
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     510:	0f be 07             	movsbl (%edi),%eax
     513:	83 ec 08             	sub    $0x8,%esp
     516:	50                   	push   %eax
     517:	68 94 19 00 00       	push   $0x1994
     51c:	e8 6f 07 00 00       	call   c90 <strchr>
     521:	83 c4 10             	add    $0x10,%esp
     524:	85 c0                	test   %eax,%eax
     526:	75 1f                	jne    547 <gettoken+0xf7>
      s++;
     528:	83 c7 01             	add    $0x1,%edi
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     52b:	39 fb                	cmp    %edi,%ebx
     52d:	74 77                	je     5a6 <gettoken+0x156>
     52f:	0f be 07             	movsbl (%edi),%eax
     532:	83 ec 08             	sub    $0x8,%esp
     535:	50                   	push   %eax
     536:	68 9c 19 00 00       	push   $0x199c
     53b:	e8 50 07 00 00       	call   c90 <strchr>
     540:	83 c4 10             	add    $0x10,%esp
     543:	85 c0                	test   %eax,%eax
     545:	74 c9                	je     510 <gettoken+0xc0>
    ret = 'a';
     547:	be 61 00 00 00       	mov    $0x61,%esi
     54c:	e9 5d ff ff ff       	jmp    4ae <gettoken+0x5e>
     551:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  switch(*s){
     558:	3c 26                	cmp    $0x26,%al
     55a:	74 08                	je     564 <gettoken+0x114>
     55c:	8d 48 d8             	lea    -0x28(%eax),%ecx
     55f:	80 f9 01             	cmp    $0x1,%cl
     562:	77 8e                	ja     4f2 <gettoken+0xa2>
  ret = *s;
     564:	0f be f0             	movsbl %al,%esi
    s++;
     567:	83 c7 01             	add    $0x1,%edi
    break;
     56a:	e9 3f ff ff ff       	jmp    4ae <gettoken+0x5e>
     56f:	90                   	nop
  switch(*s){
     570:	3c 3e                	cmp    $0x3e,%al
     572:	75 1c                	jne    590 <gettoken+0x140>
    if(*s == '>'){
     574:	80 7f 01 3e          	cmpb   $0x3e,0x1(%edi)
     578:	74 1f                	je     599 <gettoken+0x149>
    s++;
     57a:	83 c7 01             	add    $0x1,%edi
  ret = *s;
     57d:	be 3e 00 00 00       	mov    $0x3e,%esi
     582:	e9 27 ff ff ff       	jmp    4ae <gettoken+0x5e>
     587:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     58e:	66 90                	xchg   %ax,%ax
  switch(*s){
     590:	3c 7c                	cmp    $0x7c,%al
     592:	74 d0                	je     564 <gettoken+0x114>
     594:	e9 59 ff ff ff       	jmp    4f2 <gettoken+0xa2>
      s++;
     599:	83 c7 02             	add    $0x2,%edi
      ret = '+';
     59c:	be 2b 00 00 00       	mov    $0x2b,%esi
     5a1:	e9 08 ff ff ff       	jmp    4ae <gettoken+0x5e>
  if(eq)
     5a6:	8b 45 14             	mov    0x14(%ebp),%eax
     5a9:	85 c0                	test   %eax,%eax
     5ab:	74 05                	je     5b2 <gettoken+0x162>
    *eq = s;
     5ad:	8b 45 14             	mov    0x14(%ebp),%eax
     5b0:	89 18                	mov    %ebx,(%eax)
      s++;
     5b2:	89 df                	mov    %ebx,%edi
    ret = 'a';
     5b4:	be 61 00 00 00       	mov    $0x61,%esi
     5b9:	e9 21 ff ff ff       	jmp    4df <gettoken+0x8f>
     5be:	66 90                	xchg   %ax,%ax

000005c0 <peek>:

int
peek(char **ps, char *es, char *toks)
{
     5c0:	55                   	push   %ebp
     5c1:	89 e5                	mov    %esp,%ebp
     5c3:	57                   	push   %edi
     5c4:	56                   	push   %esi
     5c5:	53                   	push   %ebx
     5c6:	83 ec 0c             	sub    $0xc,%esp
     5c9:	8b 7d 08             	mov    0x8(%ebp),%edi
     5cc:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;

  s = *ps;
     5cf:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
     5d1:	39 f3                	cmp    %esi,%ebx
     5d3:	72 12                	jb     5e7 <peek+0x27>
     5d5:	eb 28                	jmp    5ff <peek+0x3f>
     5d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     5de:	66 90                	xchg   %ax,%ax
    s++;
     5e0:	83 c3 01             	add    $0x1,%ebx
  while(s < es && strchr(whitespace, *s))
     5e3:	39 de                	cmp    %ebx,%esi
     5e5:	74 18                	je     5ff <peek+0x3f>
     5e7:	0f be 03             	movsbl (%ebx),%eax
     5ea:	83 ec 08             	sub    $0x8,%esp
     5ed:	50                   	push   %eax
     5ee:	68 9c 19 00 00       	push   $0x199c
     5f3:	e8 98 06 00 00       	call   c90 <strchr>
     5f8:	83 c4 10             	add    $0x10,%esp
     5fb:	85 c0                	test   %eax,%eax
     5fd:	75 e1                	jne    5e0 <peek+0x20>
  *ps = s;
     5ff:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
     601:	0f be 03             	movsbl (%ebx),%eax
     604:	31 d2                	xor    %edx,%edx
     606:	84 c0                	test   %al,%al
     608:	75 0e                	jne    618 <peek+0x58>
}
     60a:	8d 65 f4             	lea    -0xc(%ebp),%esp
     60d:	89 d0                	mov    %edx,%eax
     60f:	5b                   	pop    %ebx
     610:	5e                   	pop    %esi
     611:	5f                   	pop    %edi
     612:	5d                   	pop    %ebp
     613:	c3                   	ret
     614:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  return *s && strchr(toks, *s);
     618:	83 ec 08             	sub    $0x8,%esp
     61b:	50                   	push   %eax
     61c:	ff 75 10             	push   0x10(%ebp)
     61f:	e8 6c 06 00 00       	call   c90 <strchr>
     624:	83 c4 10             	add    $0x10,%esp
     627:	31 d2                	xor    %edx,%edx
     629:	85 c0                	test   %eax,%eax
     62b:	0f 95 c2             	setne  %dl
}
     62e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     631:	5b                   	pop    %ebx
     632:	89 d0                	mov    %edx,%eax
     634:	5e                   	pop    %esi
     635:	5f                   	pop    %edi
     636:	5d                   	pop    %ebp
     637:	c3                   	ret
     638:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     63f:	90                   	nop

00000640 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     640:	55                   	push   %ebp
     641:	89 e5                	mov    %esp,%ebp
     643:	57                   	push   %edi
     644:	56                   	push   %esi
     645:	53                   	push   %ebx
     646:	83 ec 2c             	sub    $0x2c,%esp
     649:	8b 75 0c             	mov    0xc(%ebp),%esi
     64c:	8b 5d 10             	mov    0x10(%ebp),%ebx
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     64f:	90                   	nop
     650:	83 ec 04             	sub    $0x4,%esp
     653:	68 ca 12 00 00       	push   $0x12ca
     658:	53                   	push   %ebx
     659:	56                   	push   %esi
     65a:	e8 61 ff ff ff       	call   5c0 <peek>
     65f:	83 c4 10             	add    $0x10,%esp
     662:	85 c0                	test   %eax,%eax
     664:	0f 84 f6 00 00 00    	je     760 <parseredirs+0x120>
    tok = gettoken(ps, es, 0, 0);
     66a:	6a 00                	push   $0x0
     66c:	6a 00                	push   $0x0
     66e:	53                   	push   %ebx
     66f:	56                   	push   %esi
     670:	e8 db fd ff ff       	call   450 <gettoken>
     675:	89 c7                	mov    %eax,%edi
    if(gettoken(ps, es, &q, &eq) != 'a')
     677:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     67a:	50                   	push   %eax
     67b:	8d 45 e0             	lea    -0x20(%ebp),%eax
     67e:	50                   	push   %eax
     67f:	53                   	push   %ebx
     680:	56                   	push   %esi
     681:	e8 ca fd ff ff       	call   450 <gettoken>
     686:	83 c4 20             	add    $0x20,%esp
     689:	83 f8 61             	cmp    $0x61,%eax
     68c:	0f 85 d9 00 00 00    	jne    76b <parseredirs+0x12b>
      panic("missing file for redirection");
    switch(tok){
     692:	83 ff 3c             	cmp    $0x3c,%edi
     695:	74 69                	je     700 <parseredirs+0xc0>
     697:	83 ff 3e             	cmp    $0x3e,%edi
     69a:	74 05                	je     6a1 <parseredirs+0x61>
     69c:	83 ff 2b             	cmp    $0x2b,%edi
     69f:	75 af                	jne    650 <parseredirs+0x10>
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     6a1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     6a4:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  cmd = malloc(sizeof(*cmd));
     6a7:	83 ec 0c             	sub    $0xc,%esp
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     6aa:	89 55 d0             	mov    %edx,-0x30(%ebp)
     6ad:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  cmd = malloc(sizeof(*cmd));
     6b0:	6a 18                	push   $0x18
     6b2:	e8 d9 0a 00 00       	call   1190 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     6b7:	83 c4 0c             	add    $0xc,%esp
     6ba:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     6bc:	89 c7                	mov    %eax,%edi
  memset(cmd, 0, sizeof(*cmd));
     6be:	6a 00                	push   $0x0
     6c0:	50                   	push   %eax
     6c1:	e8 aa 05 00 00       	call   c70 <memset>
  cmd->type = REDIR;
     6c6:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
  cmd->cmd = subcmd;
     6cc:	8b 45 08             	mov    0x8(%ebp),%eax
      break;
     6cf:	83 c4 10             	add    $0x10,%esp
  cmd->cmd = subcmd;
     6d2:	89 47 04             	mov    %eax,0x4(%edi)
  cmd->file = file;
     6d5:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
     6d8:	89 4f 08             	mov    %ecx,0x8(%edi)
  cmd->efile = efile;
     6db:	8b 55 d0             	mov    -0x30(%ebp),%edx
  cmd->mode = mode;
     6de:	c7 47 10 01 02 00 00 	movl   $0x201,0x10(%edi)
  cmd->efile = efile;
     6e5:	89 57 0c             	mov    %edx,0xc(%edi)
  cmd->fd = fd;
     6e8:	c7 47 14 01 00 00 00 	movl   $0x1,0x14(%edi)
      break;
     6ef:	89 7d 08             	mov    %edi,0x8(%ebp)
     6f2:	e9 59 ff ff ff       	jmp    650 <parseredirs+0x10>
     6f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     6fe:	66 90                	xchg   %ax,%ax
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     700:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     703:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  cmd = malloc(sizeof(*cmd));
     706:	83 ec 0c             	sub    $0xc,%esp
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     709:	89 55 d0             	mov    %edx,-0x30(%ebp)
     70c:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  cmd = malloc(sizeof(*cmd));
     70f:	6a 18                	push   $0x18
     711:	e8 7a 0a 00 00       	call   1190 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     716:	83 c4 0c             	add    $0xc,%esp
     719:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     71b:	89 c7                	mov    %eax,%edi
  memset(cmd, 0, sizeof(*cmd));
     71d:	6a 00                	push   $0x0
     71f:	50                   	push   %eax
     720:	e8 4b 05 00 00       	call   c70 <memset>
  cmd->cmd = subcmd;
     725:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->file = file;
     728:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      break;
     72b:	89 7d 08             	mov    %edi,0x8(%ebp)
  cmd->efile = efile;
     72e:	8b 55 d0             	mov    -0x30(%ebp),%edx
  cmd->type = REDIR;
     731:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
      break;
     737:	83 c4 10             	add    $0x10,%esp
  cmd->cmd = subcmd;
     73a:	89 47 04             	mov    %eax,0x4(%edi)
  cmd->file = file;
     73d:	89 4f 08             	mov    %ecx,0x8(%edi)
  cmd->efile = efile;
     740:	89 57 0c             	mov    %edx,0xc(%edi)
  cmd->mode = mode;
     743:	c7 47 10 00 00 00 00 	movl   $0x0,0x10(%edi)
  cmd->fd = fd;
     74a:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
      break;
     751:	e9 fa fe ff ff       	jmp    650 <parseredirs+0x10>
     756:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     75d:	8d 76 00             	lea    0x0(%esi),%esi
    }
  }
  return cmd;
}
     760:	8b 45 08             	mov    0x8(%ebp),%eax
     763:	8d 65 f4             	lea    -0xc(%ebp),%esp
     766:	5b                   	pop    %ebx
     767:	5e                   	pop    %esi
     768:	5f                   	pop    %edi
     769:	5d                   	pop    %ebp
     76a:	c3                   	ret
      panic("missing file for redirection");
     76b:	83 ec 0c             	sub    $0xc,%esp
     76e:	68 ad 12 00 00       	push   $0x12ad
     773:	e8 f8 f9 ff ff       	call   170 <panic>
     778:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     77f:	90                   	nop

00000780 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     780:	55                   	push   %ebp
     781:	89 e5                	mov    %esp,%ebp
     783:	57                   	push   %edi
     784:	56                   	push   %esi
     785:	53                   	push   %ebx
     786:	83 ec 30             	sub    $0x30,%esp
     789:	8b 5d 08             	mov    0x8(%ebp),%ebx
     78c:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     78f:	68 cd 12 00 00       	push   $0x12cd
     794:	56                   	push   %esi
     795:	53                   	push   %ebx
     796:	e8 25 fe ff ff       	call   5c0 <peek>
     79b:	83 c4 10             	add    $0x10,%esp
     79e:	85 c0                	test   %eax,%eax
     7a0:	0f 85 aa 00 00 00    	jne    850 <parseexec+0xd0>
  cmd = malloc(sizeof(*cmd));
     7a6:	83 ec 0c             	sub    $0xc,%esp
     7a9:	89 c7                	mov    %eax,%edi
     7ab:	6a 54                	push   $0x54
     7ad:	e8 de 09 00 00       	call   1190 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     7b2:	83 c4 0c             	add    $0xc,%esp
     7b5:	6a 54                	push   $0x54
     7b7:	6a 00                	push   $0x0
     7b9:	89 45 d0             	mov    %eax,-0x30(%ebp)
     7bc:	50                   	push   %eax
     7bd:	e8 ae 04 00 00       	call   c70 <memset>
  cmd->type = EXEC;
     7c2:	8b 45 d0             	mov    -0x30(%ebp),%eax

  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     7c5:	83 c4 0c             	add    $0xc,%esp
  cmd->type = EXEC;
     7c8:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  ret = parseredirs(ret, ps, es);
     7ce:	56                   	push   %esi
     7cf:	53                   	push   %ebx
     7d0:	50                   	push   %eax
     7d1:	e8 6a fe ff ff       	call   640 <parseredirs>
  while(!peek(ps, es, "|)&;")){
     7d6:	83 c4 10             	add    $0x10,%esp
  ret = parseredirs(ret, ps, es);
     7d9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     7dc:	eb 15                	jmp    7f3 <parseexec+0x73>
     7de:	66 90                	xchg   %ax,%ax
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
     7e0:	83 ec 04             	sub    $0x4,%esp
     7e3:	56                   	push   %esi
     7e4:	53                   	push   %ebx
     7e5:	ff 75 d4             	push   -0x2c(%ebp)
     7e8:	e8 53 fe ff ff       	call   640 <parseredirs>
     7ed:	83 c4 10             	add    $0x10,%esp
     7f0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     7f3:	83 ec 04             	sub    $0x4,%esp
     7f6:	68 e4 12 00 00       	push   $0x12e4
     7fb:	56                   	push   %esi
     7fc:	53                   	push   %ebx
     7fd:	e8 be fd ff ff       	call   5c0 <peek>
     802:	83 c4 10             	add    $0x10,%esp
     805:	85 c0                	test   %eax,%eax
     807:	75 5f                	jne    868 <parseexec+0xe8>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     809:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     80c:	50                   	push   %eax
     80d:	8d 45 e0             	lea    -0x20(%ebp),%eax
     810:	50                   	push   %eax
     811:	56                   	push   %esi
     812:	53                   	push   %ebx
     813:	e8 38 fc ff ff       	call   450 <gettoken>
     818:	83 c4 10             	add    $0x10,%esp
     81b:	85 c0                	test   %eax,%eax
     81d:	74 49                	je     868 <parseexec+0xe8>
    if(tok != 'a')
     81f:	83 f8 61             	cmp    $0x61,%eax
     822:	75 62                	jne    886 <parseexec+0x106>
    cmd->argv[argc] = q;
     824:	8b 45 e0             	mov    -0x20(%ebp),%eax
     827:	8b 55 d0             	mov    -0x30(%ebp),%edx
     82a:	89 44 ba 04          	mov    %eax,0x4(%edx,%edi,4)
    cmd->eargv[argc] = eq;
     82e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     831:	89 44 ba 2c          	mov    %eax,0x2c(%edx,%edi,4)
    argc++;
     835:	83 c7 01             	add    $0x1,%edi
    if(argc >= MAXARGS)
     838:	83 ff 0a             	cmp    $0xa,%edi
     83b:	75 a3                	jne    7e0 <parseexec+0x60>
      panic("too many args");
     83d:	83 ec 0c             	sub    $0xc,%esp
     840:	68 d6 12 00 00       	push   $0x12d6
     845:	e8 26 f9 ff ff       	call   170 <panic>
     84a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return parseblock(ps, es);
     850:	89 75 0c             	mov    %esi,0xc(%ebp)
     853:	89 5d 08             	mov    %ebx,0x8(%ebp)
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     856:	8d 65 f4             	lea    -0xc(%ebp),%esp
     859:	5b                   	pop    %ebx
     85a:	5e                   	pop    %esi
     85b:	5f                   	pop    %edi
     85c:	5d                   	pop    %ebp
    return parseblock(ps, es);
     85d:	e9 ae 01 00 00       	jmp    a10 <parseblock>
     862:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  cmd->argv[argc] = 0;
     868:	8b 45 d0             	mov    -0x30(%ebp),%eax
     86b:	c7 44 b8 04 00 00 00 	movl   $0x0,0x4(%eax,%edi,4)
     872:	00 
  cmd->eargv[argc] = 0;
     873:	c7 44 b8 2c 00 00 00 	movl   $0x0,0x2c(%eax,%edi,4)
     87a:	00 
}
     87b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     87e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     881:	5b                   	pop    %ebx
     882:	5e                   	pop    %esi
     883:	5f                   	pop    %edi
     884:	5d                   	pop    %ebp
     885:	c3                   	ret
      panic("syntax");
     886:	83 ec 0c             	sub    $0xc,%esp
     889:	68 cf 12 00 00       	push   $0x12cf
     88e:	e8 dd f8 ff ff       	call   170 <panic>
     893:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     89a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000008a0 <parsepipe>:
{
     8a0:	55                   	push   %ebp
     8a1:	89 e5                	mov    %esp,%ebp
     8a3:	57                   	push   %edi
     8a4:	56                   	push   %esi
     8a5:	53                   	push   %ebx
     8a6:	83 ec 14             	sub    $0x14,%esp
     8a9:	8b 75 08             	mov    0x8(%ebp),%esi
     8ac:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parseexec(ps, es);
     8af:	57                   	push   %edi
     8b0:	56                   	push   %esi
     8b1:	e8 ca fe ff ff       	call   780 <parseexec>
  if(peek(ps, es, "|")){
     8b6:	83 c4 0c             	add    $0xc,%esp
     8b9:	68 e9 12 00 00       	push   $0x12e9
  cmd = parseexec(ps, es);
     8be:	89 c3                	mov    %eax,%ebx
  if(peek(ps, es, "|")){
     8c0:	57                   	push   %edi
     8c1:	56                   	push   %esi
     8c2:	e8 f9 fc ff ff       	call   5c0 <peek>
     8c7:	83 c4 10             	add    $0x10,%esp
     8ca:	85 c0                	test   %eax,%eax
     8cc:	75 12                	jne    8e0 <parsepipe+0x40>
}
     8ce:	8d 65 f4             	lea    -0xc(%ebp),%esp
     8d1:	89 d8                	mov    %ebx,%eax
     8d3:	5b                   	pop    %ebx
     8d4:	5e                   	pop    %esi
     8d5:	5f                   	pop    %edi
     8d6:	5d                   	pop    %ebp
     8d7:	c3                   	ret
     8d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     8df:	90                   	nop
    gettoken(ps, es, 0, 0);
     8e0:	6a 00                	push   $0x0
     8e2:	6a 00                	push   $0x0
     8e4:	57                   	push   %edi
     8e5:	56                   	push   %esi
     8e6:	e8 65 fb ff ff       	call   450 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     8eb:	58                   	pop    %eax
     8ec:	5a                   	pop    %edx
     8ed:	57                   	push   %edi
     8ee:	56                   	push   %esi
     8ef:	e8 ac ff ff ff       	call   8a0 <parsepipe>
  cmd = malloc(sizeof(*cmd));
     8f4:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
    cmd = pipecmd(cmd, parsepipe(ps, es));
     8fb:	89 c7                	mov    %eax,%edi
  cmd = malloc(sizeof(*cmd));
     8fd:	e8 8e 08 00 00       	call   1190 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     902:	83 c4 0c             	add    $0xc,%esp
     905:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     907:	89 c6                	mov    %eax,%esi
  memset(cmd, 0, sizeof(*cmd));
     909:	6a 00                	push   $0x0
     90b:	50                   	push   %eax
     90c:	e8 5f 03 00 00       	call   c70 <memset>
  cmd->left = left;
     911:	89 5e 04             	mov    %ebx,0x4(%esi)
  cmd->right = right;
     914:	83 c4 10             	add    $0x10,%esp
     917:	89 f3                	mov    %esi,%ebx
  cmd->type = PIPE;
     919:	c7 06 03 00 00 00    	movl   $0x3,(%esi)
}
     91f:	89 d8                	mov    %ebx,%eax
  cmd->right = right;
     921:	89 7e 08             	mov    %edi,0x8(%esi)
}
     924:	8d 65 f4             	lea    -0xc(%ebp),%esp
     927:	5b                   	pop    %ebx
     928:	5e                   	pop    %esi
     929:	5f                   	pop    %edi
     92a:	5d                   	pop    %ebp
     92b:	c3                   	ret
     92c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000930 <parseline>:
{
     930:	55                   	push   %ebp
     931:	89 e5                	mov    %esp,%ebp
     933:	57                   	push   %edi
     934:	56                   	push   %esi
     935:	53                   	push   %ebx
     936:	83 ec 24             	sub    $0x24,%esp
     939:	8b 75 08             	mov    0x8(%ebp),%esi
     93c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parsepipe(ps, es);
     93f:	57                   	push   %edi
     940:	56                   	push   %esi
     941:	e8 5a ff ff ff       	call   8a0 <parsepipe>
  while(peek(ps, es, "&")){
     946:	83 c4 10             	add    $0x10,%esp
  cmd = parsepipe(ps, es);
     949:	89 c3                	mov    %eax,%ebx
  while(peek(ps, es, "&")){
     94b:	eb 3b                	jmp    988 <parseline+0x58>
     94d:	8d 76 00             	lea    0x0(%esi),%esi
    gettoken(ps, es, 0, 0);
     950:	6a 00                	push   $0x0
     952:	6a 00                	push   $0x0
     954:	57                   	push   %edi
     955:	56                   	push   %esi
     956:	e8 f5 fa ff ff       	call   450 <gettoken>
  cmd = malloc(sizeof(*cmd));
     95b:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
     962:	e8 29 08 00 00       	call   1190 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     967:	83 c4 0c             	add    $0xc,%esp
     96a:	6a 08                	push   $0x8
     96c:	6a 00                	push   $0x0
     96e:	50                   	push   %eax
     96f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     972:	e8 f9 02 00 00       	call   c70 <memset>
  cmd->type = BACK;
     977:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  cmd->cmd = subcmd;
     97a:	83 c4 10             	add    $0x10,%esp
  cmd->type = BACK;
     97d:	c7 02 05 00 00 00    	movl   $0x5,(%edx)
  cmd->cmd = subcmd;
     983:	89 5a 04             	mov    %ebx,0x4(%edx)
     986:	89 d3                	mov    %edx,%ebx
  while(peek(ps, es, "&")){
     988:	83 ec 04             	sub    $0x4,%esp
     98b:	68 eb 12 00 00       	push   $0x12eb
     990:	57                   	push   %edi
     991:	56                   	push   %esi
     992:	e8 29 fc ff ff       	call   5c0 <peek>
     997:	83 c4 10             	add    $0x10,%esp
     99a:	85 c0                	test   %eax,%eax
     99c:	75 b2                	jne    950 <parseline+0x20>
  if(peek(ps, es, ";")){
     99e:	83 ec 04             	sub    $0x4,%esp
     9a1:	68 e7 12 00 00       	push   $0x12e7
     9a6:	57                   	push   %edi
     9a7:	56                   	push   %esi
     9a8:	e8 13 fc ff ff       	call   5c0 <peek>
     9ad:	83 c4 10             	add    $0x10,%esp
     9b0:	85 c0                	test   %eax,%eax
     9b2:	75 0c                	jne    9c0 <parseline+0x90>
}
     9b4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     9b7:	89 d8                	mov    %ebx,%eax
     9b9:	5b                   	pop    %ebx
     9ba:	5e                   	pop    %esi
     9bb:	5f                   	pop    %edi
     9bc:	5d                   	pop    %ebp
     9bd:	c3                   	ret
     9be:	66 90                	xchg   %ax,%ax
    gettoken(ps, es, 0, 0);
     9c0:	6a 00                	push   $0x0
     9c2:	6a 00                	push   $0x0
     9c4:	57                   	push   %edi
     9c5:	56                   	push   %esi
     9c6:	e8 85 fa ff ff       	call   450 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     9cb:	58                   	pop    %eax
     9cc:	5a                   	pop    %edx
     9cd:	57                   	push   %edi
     9ce:	56                   	push   %esi
     9cf:	e8 5c ff ff ff       	call   930 <parseline>
  cmd = malloc(sizeof(*cmd));
     9d4:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
    cmd = listcmd(cmd, parseline(ps, es));
     9db:	89 c7                	mov    %eax,%edi
  cmd = malloc(sizeof(*cmd));
     9dd:	e8 ae 07 00 00       	call   1190 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     9e2:	83 c4 0c             	add    $0xc,%esp
     9e5:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     9e7:	89 c6                	mov    %eax,%esi
  memset(cmd, 0, sizeof(*cmd));
     9e9:	6a 00                	push   $0x0
     9eb:	50                   	push   %eax
     9ec:	e8 7f 02 00 00       	call   c70 <memset>
  cmd->left = left;
     9f1:	89 5e 04             	mov    %ebx,0x4(%esi)
  cmd->right = right;
     9f4:	83 c4 10             	add    $0x10,%esp
     9f7:	89 f3                	mov    %esi,%ebx
  cmd->type = LIST;
     9f9:	c7 06 04 00 00 00    	movl   $0x4,(%esi)
}
     9ff:	89 d8                	mov    %ebx,%eax
  cmd->right = right;
     a01:	89 7e 08             	mov    %edi,0x8(%esi)
}
     a04:	8d 65 f4             	lea    -0xc(%ebp),%esp
     a07:	5b                   	pop    %ebx
     a08:	5e                   	pop    %esi
     a09:	5f                   	pop    %edi
     a0a:	5d                   	pop    %ebp
     a0b:	c3                   	ret
     a0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a10 <parseblock>:
{
     a10:	55                   	push   %ebp
     a11:	89 e5                	mov    %esp,%ebp
     a13:	57                   	push   %edi
     a14:	56                   	push   %esi
     a15:	53                   	push   %ebx
     a16:	83 ec 10             	sub    $0x10,%esp
     a19:	8b 5d 08             	mov    0x8(%ebp),%ebx
     a1c:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(!peek(ps, es, "("))
     a1f:	68 cd 12 00 00       	push   $0x12cd
     a24:	56                   	push   %esi
     a25:	53                   	push   %ebx
     a26:	e8 95 fb ff ff       	call   5c0 <peek>
     a2b:	83 c4 10             	add    $0x10,%esp
     a2e:	85 c0                	test   %eax,%eax
     a30:	74 4a                	je     a7c <parseblock+0x6c>
  gettoken(ps, es, 0, 0);
     a32:	6a 00                	push   $0x0
     a34:	6a 00                	push   $0x0
     a36:	56                   	push   %esi
     a37:	53                   	push   %ebx
     a38:	e8 13 fa ff ff       	call   450 <gettoken>
  cmd = parseline(ps, es);
     a3d:	58                   	pop    %eax
     a3e:	5a                   	pop    %edx
     a3f:	56                   	push   %esi
     a40:	53                   	push   %ebx
     a41:	e8 ea fe ff ff       	call   930 <parseline>
  if(!peek(ps, es, ")"))
     a46:	83 c4 0c             	add    $0xc,%esp
     a49:	68 09 13 00 00       	push   $0x1309
  cmd = parseline(ps, es);
     a4e:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
     a50:	56                   	push   %esi
     a51:	53                   	push   %ebx
     a52:	e8 69 fb ff ff       	call   5c0 <peek>
     a57:	83 c4 10             	add    $0x10,%esp
     a5a:	85 c0                	test   %eax,%eax
     a5c:	74 2b                	je     a89 <parseblock+0x79>
  gettoken(ps, es, 0, 0);
     a5e:	6a 00                	push   $0x0
     a60:	6a 00                	push   $0x0
     a62:	56                   	push   %esi
     a63:	53                   	push   %ebx
     a64:	e8 e7 f9 ff ff       	call   450 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     a69:	83 c4 0c             	add    $0xc,%esp
     a6c:	56                   	push   %esi
     a6d:	53                   	push   %ebx
     a6e:	57                   	push   %edi
     a6f:	e8 cc fb ff ff       	call   640 <parseredirs>
}
     a74:	8d 65 f4             	lea    -0xc(%ebp),%esp
     a77:	5b                   	pop    %ebx
     a78:	5e                   	pop    %esi
     a79:	5f                   	pop    %edi
     a7a:	5d                   	pop    %ebp
     a7b:	c3                   	ret
    panic("parseblock");
     a7c:	83 ec 0c             	sub    $0xc,%esp
     a7f:	68 ed 12 00 00       	push   $0x12ed
     a84:	e8 e7 f6 ff ff       	call   170 <panic>
    panic("syntax - missing )");
     a89:	83 ec 0c             	sub    $0xc,%esp
     a8c:	68 f8 12 00 00       	push   $0x12f8
     a91:	e8 da f6 ff ff       	call   170 <panic>
     a96:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     a9d:	8d 76 00             	lea    0x0(%esi),%esi

00000aa0 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     aa0:	55                   	push   %ebp
     aa1:	89 e5                	mov    %esp,%ebp
     aa3:	53                   	push   %ebx
     aa4:	83 ec 04             	sub    $0x4,%esp
     aa7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     aaa:	85 db                	test   %ebx,%ebx
     aac:	0f 84 7e 00 00 00    	je     b30 <nulterminate+0x90>
    return 0;

  switch(cmd->type){
     ab2:	83 3b 05             	cmpl   $0x5,(%ebx)
     ab5:	77 20                	ja     ad7 <nulterminate+0x37>
     ab7:	8b 03                	mov    (%ebx),%eax
     ab9:	ff 24 85 68 13 00 00 	jmp    *0x1368(,%eax,4)
    nulterminate(pcmd->right);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    nulterminate(lcmd->left);
     ac0:	83 ec 0c             	sub    $0xc,%esp
     ac3:	ff 73 04             	push   0x4(%ebx)
     ac6:	e8 d5 ff ff ff       	call   aa0 <nulterminate>
    nulterminate(lcmd->right);
     acb:	58                   	pop    %eax
     acc:	ff 73 08             	push   0x8(%ebx)
     acf:	e8 cc ff ff ff       	call   aa0 <nulterminate>
    break;
     ad4:	83 c4 10             	add    $0x10,%esp
    return 0;
     ad7:	89 d8                	mov    %ebx,%eax
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     ad9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     adc:	c9                   	leave
     add:	c3                   	ret
     ade:	66 90                	xchg   %ax,%ax
    nulterminate(bcmd->cmd);
     ae0:	83 ec 0c             	sub    $0xc,%esp
     ae3:	ff 73 04             	push   0x4(%ebx)
     ae6:	e8 b5 ff ff ff       	call   aa0 <nulterminate>
    break;
     aeb:	83 c4 10             	add    $0x10,%esp
     aee:	eb e7                	jmp    ad7 <nulterminate+0x37>
    for(i=0; ecmd->argv[i]; i++)
     af0:	8b 4b 04             	mov    0x4(%ebx),%ecx
     af3:	8d 43 08             	lea    0x8(%ebx),%eax
     af6:	85 c9                	test   %ecx,%ecx
     af8:	74 dd                	je     ad7 <nulterminate+0x37>
     afa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      *ecmd->eargv[i] = 0;
     b00:	8b 50 24             	mov    0x24(%eax),%edx
    for(i=0; ecmd->argv[i]; i++)
     b03:	83 c0 04             	add    $0x4,%eax
      *ecmd->eargv[i] = 0;
     b06:	c6 02 00             	movb   $0x0,(%edx)
    for(i=0; ecmd->argv[i]; i++)
     b09:	8b 50 fc             	mov    -0x4(%eax),%edx
     b0c:	85 d2                	test   %edx,%edx
     b0e:	75 f0                	jne    b00 <nulterminate+0x60>
     b10:	eb c5                	jmp    ad7 <nulterminate+0x37>
     b12:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    nulterminate(rcmd->cmd);
     b18:	83 ec 0c             	sub    $0xc,%esp
     b1b:	ff 73 04             	push   0x4(%ebx)
     b1e:	e8 7d ff ff ff       	call   aa0 <nulterminate>
    *rcmd->efile = 0;
     b23:	8b 43 0c             	mov    0xc(%ebx),%eax
    break;
     b26:	83 c4 10             	add    $0x10,%esp
    *rcmd->efile = 0;
     b29:	c6 00 00             	movb   $0x0,(%eax)
    break;
     b2c:	eb a9                	jmp    ad7 <nulterminate+0x37>
     b2e:	66 90                	xchg   %ax,%ax
    return 0;
     b30:	31 c0                	xor    %eax,%eax
     b32:	eb a5                	jmp    ad9 <nulterminate+0x39>
     b34:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     b3b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     b3f:	90                   	nop

00000b40 <parsecmd>:
{
     b40:	55                   	push   %ebp
     b41:	89 e5                	mov    %esp,%ebp
     b43:	57                   	push   %edi
     b44:	56                   	push   %esi
  cmd = parseline(&s, es);
     b45:	8d 7d 08             	lea    0x8(%ebp),%edi
{
     b48:	53                   	push   %ebx
     b49:	83 ec 18             	sub    $0x18,%esp
  es = s + strlen(s);
     b4c:	8b 5d 08             	mov    0x8(%ebp),%ebx
     b4f:	53                   	push   %ebx
     b50:	e8 eb 00 00 00       	call   c40 <strlen>
  cmd = parseline(&s, es);
     b55:	59                   	pop    %ecx
     b56:	5e                   	pop    %esi
  es = s + strlen(s);
     b57:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
     b59:	53                   	push   %ebx
     b5a:	57                   	push   %edi
     b5b:	e8 d0 fd ff ff       	call   930 <parseline>
  peek(&s, es, "");
     b60:	83 c4 0c             	add    $0xc,%esp
     b63:	68 96 12 00 00       	push   $0x1296
  cmd = parseline(&s, es);
     b68:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
     b6a:	53                   	push   %ebx
     b6b:	57                   	push   %edi
     b6c:	e8 4f fa ff ff       	call   5c0 <peek>
  if(s != es){
     b71:	8b 45 08             	mov    0x8(%ebp),%eax
     b74:	83 c4 10             	add    $0x10,%esp
     b77:	39 d8                	cmp    %ebx,%eax
     b79:	75 13                	jne    b8e <parsecmd+0x4e>
  nulterminate(cmd);
     b7b:	83 ec 0c             	sub    $0xc,%esp
     b7e:	56                   	push   %esi
     b7f:	e8 1c ff ff ff       	call   aa0 <nulterminate>
}
     b84:	8d 65 f4             	lea    -0xc(%ebp),%esp
     b87:	89 f0                	mov    %esi,%eax
     b89:	5b                   	pop    %ebx
     b8a:	5e                   	pop    %esi
     b8b:	5f                   	pop    %edi
     b8c:	5d                   	pop    %ebp
     b8d:	c3                   	ret
    printf(2, "leftovers: %s\n", s);
     b8e:	52                   	push   %edx
     b8f:	50                   	push   %eax
     b90:	68 0b 13 00 00       	push   $0x130b
     b95:	6a 02                	push   $0x2
     b97:	e8 b4 03 00 00       	call   f50 <printf>
    panic("syntax");
     b9c:	c7 04 24 cf 12 00 00 	movl   $0x12cf,(%esp)
     ba3:	e8 c8 f5 ff ff       	call   170 <panic>
     ba8:	66 90                	xchg   %ax,%ax
     baa:	66 90                	xchg   %ax,%ax
     bac:	66 90                	xchg   %ax,%ax
     bae:	66 90                	xchg   %ax,%ax

00000bb0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     bb0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     bb1:	31 c0                	xor    %eax,%eax
{
     bb3:	89 e5                	mov    %esp,%ebp
     bb5:	53                   	push   %ebx
     bb6:	8b 4d 08             	mov    0x8(%ebp),%ecx
     bb9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     bbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
     bc0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
     bc4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
     bc7:	83 c0 01             	add    $0x1,%eax
     bca:	84 d2                	test   %dl,%dl
     bcc:	75 f2                	jne    bc0 <strcpy+0x10>
    ;
  return os;
}
     bce:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     bd1:	89 c8                	mov    %ecx,%eax
     bd3:	c9                   	leave
     bd4:	c3                   	ret
     bd5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     bdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000be0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     be0:	55                   	push   %ebp
     be1:	89 e5                	mov    %esp,%ebp
     be3:	53                   	push   %ebx
     be4:	8b 55 08             	mov    0x8(%ebp),%edx
     be7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
     bea:	0f b6 02             	movzbl (%edx),%eax
     bed:	84 c0                	test   %al,%al
     bef:	75 17                	jne    c08 <strcmp+0x28>
     bf1:	eb 3a                	jmp    c2d <strcmp+0x4d>
     bf3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     bf7:	90                   	nop
     bf8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
     bfc:	83 c2 01             	add    $0x1,%edx
     bff:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
     c02:	84 c0                	test   %al,%al
     c04:	74 1a                	je     c20 <strcmp+0x40>
    p++, q++;
     c06:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
     c08:	0f b6 19             	movzbl (%ecx),%ebx
     c0b:	38 c3                	cmp    %al,%bl
     c0d:	74 e9                	je     bf8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
     c0f:	29 d8                	sub    %ebx,%eax
}
     c11:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     c14:	c9                   	leave
     c15:	c3                   	ret
     c16:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     c1d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
     c20:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
     c24:	31 c0                	xor    %eax,%eax
     c26:	29 d8                	sub    %ebx,%eax
}
     c28:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     c2b:	c9                   	leave
     c2c:	c3                   	ret
  return (uchar)*p - (uchar)*q;
     c2d:	0f b6 19             	movzbl (%ecx),%ebx
     c30:	31 c0                	xor    %eax,%eax
     c32:	eb db                	jmp    c0f <strcmp+0x2f>
     c34:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     c3b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     c3f:	90                   	nop

00000c40 <strlen>:

uint
strlen(char *s)
{
     c40:	55                   	push   %ebp
     c41:	89 e5                	mov    %esp,%ebp
     c43:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
     c46:	80 3a 00             	cmpb   $0x0,(%edx)
     c49:	74 15                	je     c60 <strlen+0x20>
     c4b:	31 c0                	xor    %eax,%eax
     c4d:	8d 76 00             	lea    0x0(%esi),%esi
     c50:	83 c0 01             	add    $0x1,%eax
     c53:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
     c57:	89 c1                	mov    %eax,%ecx
     c59:	75 f5                	jne    c50 <strlen+0x10>
    ;
  return n;
}
     c5b:	89 c8                	mov    %ecx,%eax
     c5d:	5d                   	pop    %ebp
     c5e:	c3                   	ret
     c5f:	90                   	nop
  for(n = 0; s[n]; n++)
     c60:	31 c9                	xor    %ecx,%ecx
}
     c62:	5d                   	pop    %ebp
     c63:	89 c8                	mov    %ecx,%eax
     c65:	c3                   	ret
     c66:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     c6d:	8d 76 00             	lea    0x0(%esi),%esi

00000c70 <memset>:

void*
memset(void *dst, int c, uint n)
{
     c70:	55                   	push   %ebp
     c71:	89 e5                	mov    %esp,%ebp
     c73:	57                   	push   %edi
     c74:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     c77:	8b 4d 10             	mov    0x10(%ebp),%ecx
     c7a:	8b 45 0c             	mov    0xc(%ebp),%eax
     c7d:	89 d7                	mov    %edx,%edi
     c7f:	fc                   	cld
     c80:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     c82:	8b 7d fc             	mov    -0x4(%ebp),%edi
     c85:	89 d0                	mov    %edx,%eax
     c87:	c9                   	leave
     c88:	c3                   	ret
     c89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000c90 <strchr>:

char*
strchr(const char *s, char c)
{
     c90:	55                   	push   %ebp
     c91:	89 e5                	mov    %esp,%ebp
     c93:	8b 45 08             	mov    0x8(%ebp),%eax
     c96:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
     c9a:	0f b6 10             	movzbl (%eax),%edx
     c9d:	84 d2                	test   %dl,%dl
     c9f:	75 12                	jne    cb3 <strchr+0x23>
     ca1:	eb 1d                	jmp    cc0 <strchr+0x30>
     ca3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     ca7:	90                   	nop
     ca8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
     cac:	83 c0 01             	add    $0x1,%eax
     caf:	84 d2                	test   %dl,%dl
     cb1:	74 0d                	je     cc0 <strchr+0x30>
    if(*s == c)
     cb3:	38 d1                	cmp    %dl,%cl
     cb5:	75 f1                	jne    ca8 <strchr+0x18>
      return (char*)s;
  return 0;
}
     cb7:	5d                   	pop    %ebp
     cb8:	c3                   	ret
     cb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
     cc0:	31 c0                	xor    %eax,%eax
}
     cc2:	5d                   	pop    %ebp
     cc3:	c3                   	ret
     cc4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     ccb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     ccf:	90                   	nop

00000cd0 <gets>:

char*
gets(char *buf, int max)
{
     cd0:	55                   	push   %ebp
     cd1:	89 e5                	mov    %esp,%ebp
     cd3:	57                   	push   %edi
     cd4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
     cd5:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
     cd8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
     cd9:	31 db                	xor    %ebx,%ebx
{
     cdb:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
     cde:	eb 27                	jmp    d07 <gets+0x37>
    cc = read(0, &c, 1);
     ce0:	83 ec 04             	sub    $0x4,%esp
     ce3:	6a 01                	push   $0x1
     ce5:	56                   	push   %esi
     ce6:	6a 00                	push   $0x0
     ce8:	e8 1e 01 00 00       	call   e0b <read>
    if(cc < 1)
     ced:	83 c4 10             	add    $0x10,%esp
     cf0:	85 c0                	test   %eax,%eax
     cf2:	7e 1d                	jle    d11 <gets+0x41>
      break;
    buf[i++] = c;
     cf4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     cf8:	8b 55 08             	mov    0x8(%ebp),%edx
     cfb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
     cff:	3c 0a                	cmp    $0xa,%al
     d01:	74 10                	je     d13 <gets+0x43>
     d03:	3c 0d                	cmp    $0xd,%al
     d05:	74 0c                	je     d13 <gets+0x43>
  for(i=0; i+1 < max; ){
     d07:	89 df                	mov    %ebx,%edi
     d09:	83 c3 01             	add    $0x1,%ebx
     d0c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     d0f:	7c cf                	jl     ce0 <gets+0x10>
     d11:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
     d13:	8b 45 08             	mov    0x8(%ebp),%eax
     d16:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
     d1a:	8d 65 f4             	lea    -0xc(%ebp),%esp
     d1d:	5b                   	pop    %ebx
     d1e:	5e                   	pop    %esi
     d1f:	5f                   	pop    %edi
     d20:	5d                   	pop    %ebp
     d21:	c3                   	ret
     d22:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     d29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000d30 <stat>:

int
stat(char *n, struct stat *st)
{
     d30:	55                   	push   %ebp
     d31:	89 e5                	mov    %esp,%ebp
     d33:	56                   	push   %esi
     d34:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     d35:	83 ec 08             	sub    $0x8,%esp
     d38:	6a 00                	push   $0x0
     d3a:	ff 75 08             	push   0x8(%ebp)
     d3d:	e8 f1 00 00 00       	call   e33 <open>
  if(fd < 0)
     d42:	83 c4 10             	add    $0x10,%esp
     d45:	85 c0                	test   %eax,%eax
     d47:	78 27                	js     d70 <stat+0x40>
    return -1;
  r = fstat(fd, st);
     d49:	83 ec 08             	sub    $0x8,%esp
     d4c:	ff 75 0c             	push   0xc(%ebp)
     d4f:	89 c3                	mov    %eax,%ebx
     d51:	50                   	push   %eax
     d52:	e8 f4 00 00 00       	call   e4b <fstat>
  close(fd);
     d57:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
     d5a:	89 c6                	mov    %eax,%esi
  close(fd);
     d5c:	e8 ba 00 00 00       	call   e1b <close>
  return r;
     d61:	83 c4 10             	add    $0x10,%esp
}
     d64:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d67:	89 f0                	mov    %esi,%eax
     d69:	5b                   	pop    %ebx
     d6a:	5e                   	pop    %esi
     d6b:	5d                   	pop    %ebp
     d6c:	c3                   	ret
     d6d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
     d70:	be ff ff ff ff       	mov    $0xffffffff,%esi
     d75:	eb ed                	jmp    d64 <stat+0x34>
     d77:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     d7e:	66 90                	xchg   %ax,%ax

00000d80 <atoi>:

int
atoi(const char *s)
{
     d80:	55                   	push   %ebp
     d81:	89 e5                	mov    %esp,%ebp
     d83:	53                   	push   %ebx
     d84:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     d87:	0f be 02             	movsbl (%edx),%eax
     d8a:	8d 48 d0             	lea    -0x30(%eax),%ecx
     d8d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
     d90:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
     d95:	77 1e                	ja     db5 <atoi+0x35>
     d97:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     d9e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
     da0:	83 c2 01             	add    $0x1,%edx
     da3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
     da6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
     daa:	0f be 02             	movsbl (%edx),%eax
     dad:	8d 58 d0             	lea    -0x30(%eax),%ebx
     db0:	80 fb 09             	cmp    $0x9,%bl
     db3:	76 eb                	jbe    da0 <atoi+0x20>
  return n;
}
     db5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     db8:	89 c8                	mov    %ecx,%eax
     dba:	c9                   	leave
     dbb:	c3                   	ret
     dbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000dc0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     dc0:	55                   	push   %ebp
     dc1:	89 e5                	mov    %esp,%ebp
     dc3:	57                   	push   %edi
     dc4:	56                   	push   %esi
     dc5:	8b 45 10             	mov    0x10(%ebp),%eax
     dc8:	8b 55 08             	mov    0x8(%ebp),%edx
     dcb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     dce:	85 c0                	test   %eax,%eax
     dd0:	7e 13                	jle    de5 <memmove+0x25>
     dd2:	01 d0                	add    %edx,%eax
  dst = vdst;
     dd4:	89 d7                	mov    %edx,%edi
     dd6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     ddd:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
     de0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
     de1:	39 f8                	cmp    %edi,%eax
     de3:	75 fb                	jne    de0 <memmove+0x20>
  return vdst;
}
     de5:	5e                   	pop    %esi
     de6:	89 d0                	mov    %edx,%eax
     de8:	5f                   	pop    %edi
     de9:	5d                   	pop    %ebp
     dea:	c3                   	ret

00000deb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     deb:	b8 01 00 00 00       	mov    $0x1,%eax
     df0:	cd 40                	int    $0x40
     df2:	c3                   	ret

00000df3 <exit>:
SYSCALL(exit)
     df3:	b8 02 00 00 00       	mov    $0x2,%eax
     df8:	cd 40                	int    $0x40
     dfa:	c3                   	ret

00000dfb <wait>:
SYSCALL(wait)
     dfb:	b8 03 00 00 00       	mov    $0x3,%eax
     e00:	cd 40                	int    $0x40
     e02:	c3                   	ret

00000e03 <pipe>:
SYSCALL(pipe)
     e03:	b8 04 00 00 00       	mov    $0x4,%eax
     e08:	cd 40                	int    $0x40
     e0a:	c3                   	ret

00000e0b <read>:
SYSCALL(read)
     e0b:	b8 05 00 00 00       	mov    $0x5,%eax
     e10:	cd 40                	int    $0x40
     e12:	c3                   	ret

00000e13 <write>:
SYSCALL(write)
     e13:	b8 10 00 00 00       	mov    $0x10,%eax
     e18:	cd 40                	int    $0x40
     e1a:	c3                   	ret

00000e1b <close>:
SYSCALL(close)
     e1b:	b8 15 00 00 00       	mov    $0x15,%eax
     e20:	cd 40                	int    $0x40
     e22:	c3                   	ret

00000e23 <kill>:
SYSCALL(kill)
     e23:	b8 06 00 00 00       	mov    $0x6,%eax
     e28:	cd 40                	int    $0x40
     e2a:	c3                   	ret

00000e2b <exec>:
SYSCALL(exec)
     e2b:	b8 07 00 00 00       	mov    $0x7,%eax
     e30:	cd 40                	int    $0x40
     e32:	c3                   	ret

00000e33 <open>:
SYSCALL(open)
     e33:	b8 0f 00 00 00       	mov    $0xf,%eax
     e38:	cd 40                	int    $0x40
     e3a:	c3                   	ret

00000e3b <mknod>:
SYSCALL(mknod)
     e3b:	b8 11 00 00 00       	mov    $0x11,%eax
     e40:	cd 40                	int    $0x40
     e42:	c3                   	ret

00000e43 <unlink>:
SYSCALL(unlink)
     e43:	b8 12 00 00 00       	mov    $0x12,%eax
     e48:	cd 40                	int    $0x40
     e4a:	c3                   	ret

00000e4b <fstat>:
SYSCALL(fstat)
     e4b:	b8 08 00 00 00       	mov    $0x8,%eax
     e50:	cd 40                	int    $0x40
     e52:	c3                   	ret

00000e53 <link>:
SYSCALL(link)
     e53:	b8 13 00 00 00       	mov    $0x13,%eax
     e58:	cd 40                	int    $0x40
     e5a:	c3                   	ret

00000e5b <mkdir>:
SYSCALL(mkdir)
     e5b:	b8 14 00 00 00       	mov    $0x14,%eax
     e60:	cd 40                	int    $0x40
     e62:	c3                   	ret

00000e63 <chdir>:
SYSCALL(chdir)
     e63:	b8 09 00 00 00       	mov    $0x9,%eax
     e68:	cd 40                	int    $0x40
     e6a:	c3                   	ret

00000e6b <dup>:
SYSCALL(dup)
     e6b:	b8 0a 00 00 00       	mov    $0xa,%eax
     e70:	cd 40                	int    $0x40
     e72:	c3                   	ret

00000e73 <getpid>:
SYSCALL(getpid)
     e73:	b8 0b 00 00 00       	mov    $0xb,%eax
     e78:	cd 40                	int    $0x40
     e7a:	c3                   	ret

00000e7b <sbrk>:
SYSCALL(sbrk)
     e7b:	b8 0c 00 00 00       	mov    $0xc,%eax
     e80:	cd 40                	int    $0x40
     e82:	c3                   	ret

00000e83 <sleep>:
SYSCALL(sleep)
     e83:	b8 0d 00 00 00       	mov    $0xd,%eax
     e88:	cd 40                	int    $0x40
     e8a:	c3                   	ret

00000e8b <uptime>:
SYSCALL(uptime)
     e8b:	b8 0e 00 00 00       	mov    $0xe,%eax
     e90:	cd 40                	int    $0x40
     e92:	c3                   	ret

00000e93 <shutdown>:
SYSCALL(shutdown)
     e93:	b8 16 00 00 00       	mov    $0x16,%eax
     e98:	cd 40                	int    $0x40
     e9a:	c3                   	ret

00000e9b <cps>:
SYSCALL(cps)
     e9b:	b8 17 00 00 00       	mov    $0x17,%eax
     ea0:	cd 40                	int    $0x40
     ea2:	c3                   	ret

00000ea3 <chpr>:
SYSCALL(chpr)
     ea3:	b8 18 00 00 00       	mov    $0x18,%eax
     ea8:	cd 40                	int    $0x40
     eaa:	c3                   	ret
     eab:	66 90                	xchg   %ax,%ax
     ead:	66 90                	xchg   %ax,%ax
     eaf:	90                   	nop

00000eb0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
     eb0:	55                   	push   %ebp
     eb1:	89 e5                	mov    %esp,%ebp
     eb3:	57                   	push   %edi
     eb4:	56                   	push   %esi
     eb5:	53                   	push   %ebx
     eb6:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
     eb8:	89 d1                	mov    %edx,%ecx
{
     eba:	83 ec 3c             	sub    $0x3c,%esp
     ebd:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
     ec0:	85 d2                	test   %edx,%edx
     ec2:	0f 89 80 00 00 00    	jns    f48 <printint+0x98>
     ec8:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
     ecc:	74 7a                	je     f48 <printint+0x98>
    x = -xx;
     ece:	f7 d9                	neg    %ecx
    neg = 1;
     ed0:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
     ed5:	89 45 c4             	mov    %eax,-0x3c(%ebp)
     ed8:	31 f6                	xor    %esi,%esi
     eda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
     ee0:	89 c8                	mov    %ecx,%eax
     ee2:	31 d2                	xor    %edx,%edx
     ee4:	89 f7                	mov    %esi,%edi
     ee6:	f7 f3                	div    %ebx
     ee8:	8d 76 01             	lea    0x1(%esi),%esi
     eeb:	0f b6 92 e0 13 00 00 	movzbl 0x13e0(%edx),%edx
     ef2:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
     ef6:	89 ca                	mov    %ecx,%edx
     ef8:	89 c1                	mov    %eax,%ecx
     efa:	39 da                	cmp    %ebx,%edx
     efc:	73 e2                	jae    ee0 <printint+0x30>
  if(neg)
     efe:	8b 45 c4             	mov    -0x3c(%ebp),%eax
     f01:	85 c0                	test   %eax,%eax
     f03:	74 07                	je     f0c <printint+0x5c>
    buf[i++] = '-';
     f05:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)
    buf[i++] = digits[x % base];
     f0a:	89 f7                	mov    %esi,%edi
     f0c:	8d 5d d8             	lea    -0x28(%ebp),%ebx
     f0f:	8b 75 c0             	mov    -0x40(%ebp),%esi
     f12:	01 df                	add    %ebx,%edi
     f14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  while(--i >= 0)
    putc(fd, buf[i]);
     f18:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
     f1b:	83 ec 04             	sub    $0x4,%esp
     f1e:	88 45 d7             	mov    %al,-0x29(%ebp)
     f21:	8d 45 d7             	lea    -0x29(%ebp),%eax
     f24:	6a 01                	push   $0x1
     f26:	50                   	push   %eax
     f27:	56                   	push   %esi
     f28:	e8 e6 fe ff ff       	call   e13 <write>
  while(--i >= 0)
     f2d:	89 f8                	mov    %edi,%eax
     f2f:	83 c4 10             	add    $0x10,%esp
     f32:	83 ef 01             	sub    $0x1,%edi
     f35:	39 d8                	cmp    %ebx,%eax
     f37:	75 df                	jne    f18 <printint+0x68>
}
     f39:	8d 65 f4             	lea    -0xc(%ebp),%esp
     f3c:	5b                   	pop    %ebx
     f3d:	5e                   	pop    %esi
     f3e:	5f                   	pop    %edi
     f3f:	5d                   	pop    %ebp
     f40:	c3                   	ret
     f41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
     f48:	31 c0                	xor    %eax,%eax
     f4a:	eb 89                	jmp    ed5 <printint+0x25>
     f4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000f50 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     f50:	55                   	push   %ebp
     f51:	89 e5                	mov    %esp,%ebp
     f53:	57                   	push   %edi
     f54:	56                   	push   %esi
     f55:	53                   	push   %ebx
     f56:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     f59:	8b 75 0c             	mov    0xc(%ebp),%esi
{
     f5c:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
     f5f:	0f b6 1e             	movzbl (%esi),%ebx
     f62:	83 c6 01             	add    $0x1,%esi
     f65:	84 db                	test   %bl,%bl
     f67:	74 67                	je     fd0 <printf+0x80>
     f69:	8d 4d 10             	lea    0x10(%ebp),%ecx
     f6c:	31 d2                	xor    %edx,%edx
     f6e:	89 4d d0             	mov    %ecx,-0x30(%ebp)
     f71:	eb 34                	jmp    fa7 <printf+0x57>
     f73:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     f77:	90                   	nop
     f78:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
     f7b:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
     f80:	83 f8 25             	cmp    $0x25,%eax
     f83:	74 18                	je     f9d <printf+0x4d>
  write(fd, &c, 1);
     f85:	83 ec 04             	sub    $0x4,%esp
     f88:	8d 45 e7             	lea    -0x19(%ebp),%eax
     f8b:	88 5d e7             	mov    %bl,-0x19(%ebp)
     f8e:	6a 01                	push   $0x1
     f90:	50                   	push   %eax
     f91:	57                   	push   %edi
     f92:	e8 7c fe ff ff       	call   e13 <write>
     f97:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
     f9a:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
     f9d:	0f b6 1e             	movzbl (%esi),%ebx
     fa0:	83 c6 01             	add    $0x1,%esi
     fa3:	84 db                	test   %bl,%bl
     fa5:	74 29                	je     fd0 <printf+0x80>
    c = fmt[i] & 0xff;
     fa7:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
     faa:	85 d2                	test   %edx,%edx
     fac:	74 ca                	je     f78 <printf+0x28>
      }
    } else if(state == '%'){
     fae:	83 fa 25             	cmp    $0x25,%edx
     fb1:	75 ea                	jne    f9d <printf+0x4d>
      if(c == 'd'){
     fb3:	83 f8 25             	cmp    $0x25,%eax
     fb6:	0f 84 24 01 00 00    	je     10e0 <printf+0x190>
     fbc:	83 e8 63             	sub    $0x63,%eax
     fbf:	83 f8 15             	cmp    $0x15,%eax
     fc2:	77 1c                	ja     fe0 <printf+0x90>
     fc4:	ff 24 85 88 13 00 00 	jmp    *0x1388(,%eax,4)
     fcb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     fcf:	90                   	nop
        putc(fd, c);
      }
      state = 0;
    }
  }
}
     fd0:	8d 65 f4             	lea    -0xc(%ebp),%esp
     fd3:	5b                   	pop    %ebx
     fd4:	5e                   	pop    %esi
     fd5:	5f                   	pop    %edi
     fd6:	5d                   	pop    %ebp
     fd7:	c3                   	ret
     fd8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     fdf:	90                   	nop
  write(fd, &c, 1);
     fe0:	83 ec 04             	sub    $0x4,%esp
     fe3:	8d 55 e7             	lea    -0x19(%ebp),%edx
     fe6:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
     fea:	6a 01                	push   $0x1
     fec:	52                   	push   %edx
     fed:	89 55 d4             	mov    %edx,-0x2c(%ebp)
     ff0:	57                   	push   %edi
     ff1:	e8 1d fe ff ff       	call   e13 <write>
     ff6:	83 c4 0c             	add    $0xc,%esp
     ff9:	88 5d e7             	mov    %bl,-0x19(%ebp)
     ffc:	6a 01                	push   $0x1
     ffe:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    1001:	52                   	push   %edx
    1002:	57                   	push   %edi
    1003:	e8 0b fe ff ff       	call   e13 <write>
        putc(fd, c);
    1008:	83 c4 10             	add    $0x10,%esp
      state = 0;
    100b:	31 d2                	xor    %edx,%edx
    100d:	eb 8e                	jmp    f9d <printf+0x4d>
    100f:	90                   	nop
        printint(fd, *ap, 16, 0);
    1010:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    1013:	83 ec 0c             	sub    $0xc,%esp
    1016:	b9 10 00 00 00       	mov    $0x10,%ecx
    101b:	8b 13                	mov    (%ebx),%edx
    101d:	6a 00                	push   $0x0
    101f:	89 f8                	mov    %edi,%eax
        ap++;
    1021:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
    1024:	e8 87 fe ff ff       	call   eb0 <printint>
        ap++;
    1029:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    102c:	83 c4 10             	add    $0x10,%esp
      state = 0;
    102f:	31 d2                	xor    %edx,%edx
    1031:	e9 67 ff ff ff       	jmp    f9d <printf+0x4d>
    1036:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    103d:	8d 76 00             	lea    0x0(%esi),%esi
        s = (char*)*ap;
    1040:	8b 45 d0             	mov    -0x30(%ebp),%eax
    1043:	8b 18                	mov    (%eax),%ebx
        ap++;
    1045:	83 c0 04             	add    $0x4,%eax
    1048:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    104b:	85 db                	test   %ebx,%ebx
    104d:	0f 84 9d 00 00 00    	je     10f0 <printf+0x1a0>
        while(*s != 0){
    1053:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
    1056:	31 d2                	xor    %edx,%edx
        while(*s != 0){
    1058:	84 c0                	test   %al,%al
    105a:	0f 84 3d ff ff ff    	je     f9d <printf+0x4d>
    1060:	8d 55 e7             	lea    -0x19(%ebp),%edx
    1063:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    1066:	89 de                	mov    %ebx,%esi
    1068:	89 d3                	mov    %edx,%ebx
    106a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    1070:	83 ec 04             	sub    $0x4,%esp
    1073:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
    1076:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    1079:	6a 01                	push   $0x1
    107b:	53                   	push   %ebx
    107c:	57                   	push   %edi
    107d:	e8 91 fd ff ff       	call   e13 <write>
        while(*s != 0){
    1082:	0f b6 06             	movzbl (%esi),%eax
    1085:	83 c4 10             	add    $0x10,%esp
    1088:	84 c0                	test   %al,%al
    108a:	75 e4                	jne    1070 <printf+0x120>
      state = 0;
    108c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
    108f:	31 d2                	xor    %edx,%edx
    1091:	e9 07 ff ff ff       	jmp    f9d <printf+0x4d>
    1096:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    109d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    10a0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    10a3:	83 ec 0c             	sub    $0xc,%esp
    10a6:	b9 0a 00 00 00       	mov    $0xa,%ecx
    10ab:	8b 13                	mov    (%ebx),%edx
    10ad:	6a 01                	push   $0x1
    10af:	e9 6b ff ff ff       	jmp    101f <printf+0xcf>
    10b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    10b8:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
    10bb:	83 ec 04             	sub    $0x4,%esp
    10be:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
    10c1:	8b 03                	mov    (%ebx),%eax
        ap++;
    10c3:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
    10c6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    10c9:	6a 01                	push   $0x1
    10cb:	52                   	push   %edx
    10cc:	57                   	push   %edi
    10cd:	e8 41 fd ff ff       	call   e13 <write>
        ap++;
    10d2:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    10d5:	83 c4 10             	add    $0x10,%esp
      state = 0;
    10d8:	31 d2                	xor    %edx,%edx
    10da:	e9 be fe ff ff       	jmp    f9d <printf+0x4d>
    10df:	90                   	nop
  write(fd, &c, 1);
    10e0:	83 ec 04             	sub    $0x4,%esp
    10e3:	88 5d e7             	mov    %bl,-0x19(%ebp)
    10e6:	8d 55 e7             	lea    -0x19(%ebp),%edx
    10e9:	6a 01                	push   $0x1
    10eb:	e9 11 ff ff ff       	jmp    1001 <printf+0xb1>
    10f0:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
    10f5:	bb 80 13 00 00       	mov    $0x1380,%ebx
    10fa:	e9 61 ff ff ff       	jmp    1060 <printf+0x110>
    10ff:	90                   	nop

00001100 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1100:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1101:	a1 24 1a 00 00       	mov    0x1a24,%eax
{
    1106:	89 e5                	mov    %esp,%ebp
    1108:	57                   	push   %edi
    1109:	56                   	push   %esi
    110a:	53                   	push   %ebx
    110b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    110e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1111:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1118:	89 c2                	mov    %eax,%edx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    111a:	8b 00                	mov    (%eax),%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    111c:	39 ca                	cmp    %ecx,%edx
    111e:	73 30                	jae    1150 <free+0x50>
    1120:	39 c1                	cmp    %eax,%ecx
    1122:	72 04                	jb     1128 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1124:	39 c2                	cmp    %eax,%edx
    1126:	72 f0                	jb     1118 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1128:	8b 73 fc             	mov    -0x4(%ebx),%esi
    112b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    112e:	39 f8                	cmp    %edi,%eax
    1130:	74 2e                	je     1160 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    1132:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    1135:	8b 42 04             	mov    0x4(%edx),%eax
    1138:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    113b:	39 f1                	cmp    %esi,%ecx
    113d:	74 38                	je     1177 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    113f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
    1141:	5b                   	pop    %ebx
  freep = p;
    1142:	89 15 24 1a 00 00    	mov    %edx,0x1a24
}
    1148:	5e                   	pop    %esi
    1149:	5f                   	pop    %edi
    114a:	5d                   	pop    %ebp
    114b:	c3                   	ret
    114c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1150:	39 c1                	cmp    %eax,%ecx
    1152:	72 d0                	jb     1124 <free+0x24>
    1154:	eb c2                	jmp    1118 <free+0x18>
    1156:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    115d:	8d 76 00             	lea    0x0(%esi),%esi
    bp->s.size += p->s.ptr->s.size;
    1160:	03 70 04             	add    0x4(%eax),%esi
    1163:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1166:	8b 02                	mov    (%edx),%eax
    1168:	8b 00                	mov    (%eax),%eax
    116a:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    116d:	8b 42 04             	mov    0x4(%edx),%eax
    1170:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    1173:	39 f1                	cmp    %esi,%ecx
    1175:	75 c8                	jne    113f <free+0x3f>
    p->s.size += bp->s.size;
    1177:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
    117a:	89 15 24 1a 00 00    	mov    %edx,0x1a24
    p->s.size += bp->s.size;
    1180:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
    1183:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    1186:	89 0a                	mov    %ecx,(%edx)
}
    1188:	5b                   	pop    %ebx
    1189:	5e                   	pop    %esi
    118a:	5f                   	pop    %edi
    118b:	5d                   	pop    %ebp
    118c:	c3                   	ret
    118d:	8d 76 00             	lea    0x0(%esi),%esi

00001190 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1190:	55                   	push   %ebp
    1191:	89 e5                	mov    %esp,%ebp
    1193:	57                   	push   %edi
    1194:	56                   	push   %esi
    1195:	53                   	push   %ebx
    1196:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1199:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    119c:	8b 15 24 1a 00 00    	mov    0x1a24,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    11a2:	8d 78 07             	lea    0x7(%eax),%edi
    11a5:	c1 ef 03             	shr    $0x3,%edi
    11a8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    11ab:	85 d2                	test   %edx,%edx
    11ad:	0f 84 8d 00 00 00    	je     1240 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    11b3:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    11b5:	8b 48 04             	mov    0x4(%eax),%ecx
    11b8:	39 f9                	cmp    %edi,%ecx
    11ba:	73 64                	jae    1220 <malloc+0x90>
  if(nu < 4096)
    11bc:	bb 00 10 00 00       	mov    $0x1000,%ebx
    11c1:	39 df                	cmp    %ebx,%edi
    11c3:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    11c6:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    11cd:	eb 0a                	jmp    11d9 <malloc+0x49>
    11cf:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    11d0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    11d2:	8b 48 04             	mov    0x4(%eax),%ecx
    11d5:	39 f9                	cmp    %edi,%ecx
    11d7:	73 47                	jae    1220 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    11d9:	89 c2                	mov    %eax,%edx
    11db:	39 05 24 1a 00 00    	cmp    %eax,0x1a24
    11e1:	75 ed                	jne    11d0 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
    11e3:	83 ec 0c             	sub    $0xc,%esp
    11e6:	56                   	push   %esi
    11e7:	e8 8f fc ff ff       	call   e7b <sbrk>
  if(p == (char*)-1)
    11ec:	83 c4 10             	add    $0x10,%esp
    11ef:	83 f8 ff             	cmp    $0xffffffff,%eax
    11f2:	74 1c                	je     1210 <malloc+0x80>
  hp->s.size = nu;
    11f4:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    11f7:	83 ec 0c             	sub    $0xc,%esp
    11fa:	83 c0 08             	add    $0x8,%eax
    11fd:	50                   	push   %eax
    11fe:	e8 fd fe ff ff       	call   1100 <free>
  return freep;
    1203:	8b 15 24 1a 00 00    	mov    0x1a24,%edx
      if((p = morecore(nunits)) == 0)
    1209:	83 c4 10             	add    $0x10,%esp
    120c:	85 d2                	test   %edx,%edx
    120e:	75 c0                	jne    11d0 <malloc+0x40>
        return 0;
  }
}
    1210:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    1213:	31 c0                	xor    %eax,%eax
}
    1215:	5b                   	pop    %ebx
    1216:	5e                   	pop    %esi
    1217:	5f                   	pop    %edi
    1218:	5d                   	pop    %ebp
    1219:	c3                   	ret
    121a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    1220:	39 cf                	cmp    %ecx,%edi
    1222:	74 4c                	je     1270 <malloc+0xe0>
        p->s.size -= nunits;
    1224:	29 f9                	sub    %edi,%ecx
    1226:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1229:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    122c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    122f:	89 15 24 1a 00 00    	mov    %edx,0x1a24
}
    1235:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    1238:	83 c0 08             	add    $0x8,%eax
}
    123b:	5b                   	pop    %ebx
    123c:	5e                   	pop    %esi
    123d:	5f                   	pop    %edi
    123e:	5d                   	pop    %ebp
    123f:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
    1240:	c7 05 24 1a 00 00 28 	movl   $0x1a28,0x1a24
    1247:	1a 00 00 
    base.s.size = 0;
    124a:	b8 28 1a 00 00       	mov    $0x1a28,%eax
    base.s.ptr = freep = prevp = &base;
    124f:	c7 05 28 1a 00 00 28 	movl   $0x1a28,0x1a28
    1256:	1a 00 00 
    base.s.size = 0;
    1259:	c7 05 2c 1a 00 00 00 	movl   $0x0,0x1a2c
    1260:	00 00 00 
    if(p->s.size >= nunits){
    1263:	e9 54 ff ff ff       	jmp    11bc <malloc+0x2c>
    1268:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    126f:	90                   	nop
        prevp->s.ptr = p->s.ptr;
    1270:	8b 08                	mov    (%eax),%ecx
    1272:	89 0a                	mov    %ecx,(%edx)
    1274:	eb b9                	jmp    122f <malloc+0x9f>
