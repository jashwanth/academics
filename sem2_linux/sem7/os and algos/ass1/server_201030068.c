/*****************************************************************************
 *** Program explaining the client-server model
 ***
 *** This is the server program
 ***
 *** developed by Ashok Kumar Das, CSE Department, IIT Kharagpur
 ***
 ***
 ***
 *****************************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include<string.h>
#include<math.h>
#include<stdlib.h>
#include<time.h>
#include <netdb.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/wait.h>
#include <netinet/in.h>
/* Global constants */
#define SERVICE_PORT 41041
#define Q_SIZE 5
#define MAX_LEN 1024
#define DEFAULT_SERVER "127.0.0.1"
#define REQ 10
#define ACK 20
/* A request message */
/* An acknowledgement */
/* Define the header of a message structure */
typedef struct {
  int opcode;
  int src_addr;
  int dest_addr;
} Hdr;
/* Define the body of a message */
typedef struct {
  Hdr hdr;
  char buf[MAX_LEN];
  int a[MAX_LEN]; /* contains the MAX_LEN integers */
  int n; /* Number of elements in the array a[] */
  int type_of_sort; /* type of sorting algo to be employes */
  int inc_dec; /* ascending or descending  */
} Msg;
void heap(int a[],int n)
{
  int *dummy;
  dummy = (int*)(malloc((n+3)*sizeof(int)));
  int heap_size=n,i,j,temp,min;
  for(i=1;i<=n;i++)
    dummy[i]=a[i-1];
  for(i=2;i<=n;i++)
  {
    j = i;
    temp = dummy[i];
    while(j>1 && dummy[j/2]>temp)
    {
      dummy[j] = dummy[j/2];
      j = j/2;
    }
    dummy[j] = temp;
  }
/*  printf("forming heap gives:\n");
  for(i=1;i<=n;i++)
    printf("%d%c",dummy[i],i==n?'\n':' ');*/
  for(i=1;i<=n;i++)
  {
    temp = dummy[1];
    dummy[1] = dummy[heap_size];
    dummy[heap_size] = temp;
    temp = dummy[1];
    j = 1;
    heap_size--;
    if(heap_size>=3)
      min = (dummy[2*j] > dummy[2*j+1]) ? 2*j+1:2*j;
    else if(heap_size==2)
    {
      min = (dummy[1]>dummy[2])?2:1;
      temp = dummy[1];
      dummy[1] = dummy[min];
      dummy[min] = temp;
    }
    while(2*j+1 <= heap_size && dummy[min]<temp)
    {
      temp = dummy[j];
      dummy[j] = dummy[min];
      dummy[min] = temp;
      j = min;
      //       for(k=1;k<=n;k++)
      //        printf("%d%c",a[k],k==n?'\n':' ');
      if(2*j+1<=heap_size)
	min = (dummy[2*j] > dummy[2*j+1]) ? 2*j+1:2*j;
    }
  }
  i=1;
  while(i<=n)
  {
   a[i-1] = dummy[n-i+1];
   i++;
  }
  free(dummy);
}
void selection(int a[],int n)
{
  int i,j,index,temp,flag=1;
  for(i=0;i<n;i++)
  {
    flag = 0;
    temp = a[i];
    for(j=i+1;j<n;j++)
    {
      if(temp>a[j])
      {
	flag = 1;
	 index=j;
	 temp = a[j];
      }
    }
    if(flag==1){
    temp = a[i];
    a[i] = a[index];
    a[index] = temp;
    }
  }
}
void bubble(int a[],int n)
{
 int i,j,temp;
 for(j=n-1;j>=0;j--)
 {
  for(i=0;i<j;i++)
  {
    if(a[i]>a[i+1])
    {
      temp = a[i];
      a[i] = a[i+1];
      a[i+1] = temp;
    }
  }
 }
}
void insertion(int a[],int n)
{
 int i,j,temp;
 for(i=0;i<n;i++)
 {
   temp = a[i];
   j = i;
   while(j-1>=0 && temp<a[j-1])
   {
     a[j] = a[j-1];
     j--;
   }
   a[j] = temp;
 }
}
void merge(int a[],int temp[],int left,int center,int right)
{
  int no_ele = right-left+1;
  int i=0,lstr = left,rstr=center+1;
  while(lstr <= center && rstr<=right)
  {
    if(a[lstr] <= a[rstr])
      temp[i++] = a[lstr++];
    else if(a[rstr] < a[lstr])
      temp[i++] = a[rstr++];
  }
  while(lstr<=center)
    temp[i++] = a[lstr++];
  while(rstr<=right)
    temp[i++] = a[rstr++];
  for(i=0;i<no_ele;i++)
    a[left++] = temp[i];
}
void msort(int a[],int temp[],int left,int right)
{
  int center;
  if(left < right)
  {
    center = left + ((right-left)/2);
    msort(a,temp,left,center);
    msort(a,temp,center+1,right);
    merge(a,temp,left,center,right);
  }
}
void merge_sort(int a[],int n)
{
  int *dummy;
  dummy = (int*)malloc(n*sizeof(int));
  msort(a,dummy,0,n-1);
}
/* Function prototypes */
int startServer ( );
void serverLoop ( int );
void Talk_to_client ( int );
/* Start the server: socket(), bind() and listen() */
int startServer ()
{
  int sfd;
  /* for listening to port PORT_NUMBER */
  struct sockaddr_in saddr;
  /* address of server */
  int status;
  /* Request for a socket descriptor */
  sfd = socket(AF_INET, SOCK_STREAM, 0);
  if (sfd == -1) {
    fprintf(stderr, "*** Server error: unable to get socket descriptor\n");
    exit(1);
  }
  /* Set the fields of server's internet address structure */
     saddr.sin_family = AF_INET;
     saddr.sin_port = htons(SERVICE_PORT);
     saddr.sin_addr.s_addr = INADDR_ANY;
  /* Default value for most applications */
  /* Service port in network byte order */
  /* Server's local address: 0.0.0.0 (htons not necessary) */
  bzero(&(saddr.sin_zero),8);
  /* zero the rest of the structure */
  /* Bind the socket to SERVICE_PORT for listening */
  status = bind(sfd, (struct sockaddr *)&saddr, sizeof(struct sockaddr));
  if (status == -1) {
    fprintf(stderr, "*** Server error: unable to bind to port %d\n", SERVICE_PORT);
    exit(2);
  }
  /* Now listen to the service port */
  status = listen(sfd,Q_SIZE);
  if (status == -1) {
    fprintf(stderr, "*** Server error: unable to listen\n");
    exit(3);
  }
  fprintf(stderr, "+++ Server successfully started, listening to port %hd\n", SERVICE_PORT);
  return sfd;
}
/* Accept connections from clients, spawn a child process for each request */
void serverLoop ( int sfd )
{
  int cfd;
  /* for communication with clients */
  struct sockaddr_in caddr;
  /* address of client */
  int size;
  while (1) {
    /* accept connection from clients */
    cfd = accept(sfd, (struct sockaddr *)&caddr, &size);
    if (cfd == -1) {
      fprintf(stderr, "*** Server error: unable to accept request\n");
      continue;
    }
    fprintf(stderr, "**** Connected with %s\n", inet_ntoa(caddr.sin_addr));
    /* fork a child to process request from client */
    if (!fork()) {
      Talk_to_client (cfd);
      fprintf(stderr, "**** Closed connection with %s\n", inet_ntoa(caddr.sin_addr));
      close(cfd);
      exit(0);
    }
    /* parent (server) does not talk with clients */
    close(cfd);
    /* parent waits for termination of child processes */
    while (waitpid(-1,NULL,WNOHANG) > 0);
  }
}
/* Interaction of the child process with the client */
void Talk_to_client ( int cfd )
{
  char buffer[MAX_LEN];
  int nbytes, status,temp;
  int src_addr, dest_addr;
  int i = 0,j;
  Msg send_msg;
  Msg recv_msg;
  dest_addr = inet_addr("DEFAULT_SERVER");
  src_addr = inet_addr("DEFAULT_SERVER");
  /* Wait for responses from the client */
  while ( 1 ) {
    /* receive messages from server */
    nbytes = recv(cfd, &recv_msg, sizeof(Msg), 0);
    if (nbytes == -1) {
      fprintf(stderr, "*** Server error: unable to receive\n");
    }
    sleep(5);
    switch ( recv_msg.hdr.opcode ) {
      case REQ : /* Request message */
	printf("REQ message from the client: Received integers are: \n");
	for (i=0; i<recv_msg.n; i++)
	  printf("%6d", recv_msg.a[i]);
	printf("\n");
	char str[10],str2[10];
//	printf("1.bubble 2.merge 3.selection 4.heap 5.insertion\n");
	if(recv_msg.type_of_sort==1)
	  strcpy(str,"bubble");
	if(recv_msg.type_of_sort==2)
	  strcpy(str,"merge");
        if(recv_msg.type_of_sort==3)
	  strcpy(str,"selection");
	if(recv_msg.type_of_sort==4)
	  strcpy(str,"heap");
	if(recv_msg.type_of_sort==5)
	  strcpy(str,"insertion");
	if(recv_msg.inc_dec==1)
	  strcpy(str2,"ascending");
	if(recv_msg.inc_dec==2)
	  strcpy(str2,"descending");
	printf("type of sort client needs is %s sort\n",str);
	printf("in %s order\n",str2);
//	printf("sorted num are:\n");
	switch(recv_msg.type_of_sort)
	{
	  case 1:
	    bubble(recv_msg.a,recv_msg.n);
	    break;
	  case 2:
	    merge_sort(recv_msg.a,recv_msg.n);
	    break;
	  case 3:
	    selection(recv_msg.a,recv_msg.n);
	    break;
	  case 4:
	    heap(recv_msg.a,recv_msg.n);
	    break;
	  case 5:
	    insertion(recv_msg.a,recv_msg.n);
	    break;
	}
	/* Send an acknowlegement message to the cliet */
	if(recv_msg.inc_dec==2)
	{
	  i = 0;j=recv_msg.n-1;
	  while(i<j){
	    temp=recv_msg.a[i];
	    recv_msg.a[i]=recv_msg.a[j];
	    recv_msg.a[j]=temp;
	    i++;j--;
	  }
	}
	for(i=0;i<recv_msg.n;i++)
            printf("%d%c",recv_msg.a[i],(i==recv_msg.n-1)?'\n':' ');
	printf("Sending the request message to the client \n");
	send_msg.hdr.opcode = REQ;
	send_msg.hdr.src_addr = src_addr;
	send_msg.hdr.dest_addr = dest_addr;
	send_msg.inc_dec = recv_msg.inc_dec;
	strcpy(send_msg.buf,"request message from the server\n");
	for(i=0;i<recv_msg.n;i++)
	  send_msg.a[i] = recv_msg.a[i];
	send_msg.n = recv_msg.n;
	send_msg.type_of_sort = recv_msg.type_of_sort;
	/* send the request message to the client */
	status = send(cfd, &send_msg, sizeof(Msg), 0);
	if (status == -1) {
	  fprintf(stderr, "*** Server error: unable to send\n");
	  return;
	}
	break;
      case ACK: /* Acknowlegement message from the client */
	printf("%s\n", recv_msg.buf);
	break;
      default: /* Erroneous message received */
	printf("Invalid message received from the client\n");
	exit(0);
    }
  }
}
int main ()
{
  int sfd;
  printf("******* This is the server side demo program for implementing communication in Client-Server Systems *****\n\n");
  sfd = startServer();
  serverLoop(sfd);
}
/*** End of server.c ***/

