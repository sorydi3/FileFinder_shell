#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/wait.h>
#include <fcntl.h>

 int main(int argc, char *argv[])
 {
	 int fd = open ("sortidaA", O_CREAT| O_WRONLY | O_TRUNC);
if (fd == -1){
	printf("error while opening the file\n");
	exit(1);
}
	 int pipe1[2],pipe2[2];
	 pid_t pid1,pid2,pid3;
     pipe(pipe2);
    if(pipe(pipe2)==-1){
	   perror("pipe2");
	  exit(EXIT_FAILURE);
    }
   pid3 = fork();//PARE
   if (pid3 < 0) {
       fprintf(stderr, "fork3");
        exit(1);
    } 
 
    if (pid3 == 0) {// SEGOND FILL
	      pipe(pipe1);
	      if(pipe(pipe1)==-1){
	          perror("pipe1");
	          exit(EXIT_FAILURE);
           }
         pid1 = fork();
        if (pid1 < 0) {
             fprintf(stderr, "fork3");
             exit(1);
        } 
     if(pid1==0){//SEGON FILL
	 close(1);
	 dup(pipe1[1]);
	 close(pipe1[1]);
	 close(pipe1[0]);
	 close(pipe2[1]);
	 close(pipe2[0]);
	 close(fd);
     execl ("/bin/cat", "cat", "/proc/21164/status",(char *)0 ); 
  }
  wait(NULL);
  close(0);
  dup(pipe1[0]);
  close(1);
  dup(pipe2[1]);
 close(pipe1[1]);
 close(pipe1[0]);
 close(pipe2[1]);
 close(pipe2[0]);
 close(fd);
 execl ("/bin/grep", "grep", "Vm",(char *)0); 
}
wait(NULL);
 close(0);
 dup(pipe2[0]);
 close(1);
 dup(fd);
 close(fd);
 close(pipe2[1]);
 close(pipe2[0]);
 execl ("/bin/sort","sort","-nrk2",(char *)0);
return 0;
}
