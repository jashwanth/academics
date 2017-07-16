// Author -- Ics231 Tas 
// About -- 

// general libs to invoke sys calls 
#include<stdio.h> 
#include<stdlib.h> 
#include<unistd.h>
#include<sys/types.h>
#include<sys/ptrace.h>
#include<sys/stat.h> 
#include<signal.h>
#include <sys/wait.h>
#include<string.h>
#define DEF_PAGER   "/bin/more"     /* default pager program */

int main(int argc, char *argv[])
{
	int    n;
	int    fd[2];
	pid_t  pid;
	char   *pager, *argv0;
	char   line[100];
	FILE   *fp;
	if (argc != 2)
		perror("usage: a.out <pathname>");
	if ((fp = fopen(argv[1], "r")) == NULL)
		perror("can't open file");
	if (pipe(fd) < 0)
		perror("pipe error");
	if ((pid = fork()) < 0) {
		perror("fork error");
	} else if (pid > 0) {                              /* parent */
		close(fd[0]);       /* close read end */
		/* parent copies argv[1] to pipe */
		while (fgets(line, 100, fp) != NULL) {
			n = strlen(line);
			if (write(fd[1], line, n) != n)
				perror("write error to pipe");
		}
		if (ferror(fp))
			perror("fgets error");
		close(fd[1]);   /* close write end of pipe for reader */
		if (waitpid(pid, NULL, 0) < 0)
			perror("waitpid error");
		exit(0);
	} else {                                        /* child */
		close(fd[1]);   /* close write end */
		if (fd[0] != STDIN_FILENO) {
			if (dup2(fd[0], STDIN_FILENO) != STDIN_FILENO)
				perror("dup2 error to stdin");
			close(fd[0]);   /* don't need this after dup2 */
		}
		/* get arguments for execl() */
		if ((pager = getenv("PAGER")) == NULL)
			pager = DEF_PAGER;
		if ((argv0 = strrchr(pager, '/')) != NULL)
			argv0++;        /* step past rightmost slash */
		else
			argv0 = pager;  /* no slash in pager */
		if (execl(pager, argv0, (char *)0) < 0)
			perror("execl error ");
	}
	exit(0);
}
