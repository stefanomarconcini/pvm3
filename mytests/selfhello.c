
#include <stdio.h>
#include <unistd.h>
#include <limits.h>
#include <time.h>
#include <unistd.h>
#include "pvm3.h"

int main(void)
{
    int tid = pvm_mytid();
	time_t start, current;

	char hostname[HOST_NAME_MAX + 1];
    if (gethostname(hostname, sizeof(hostname)) != 0) {
        perror("gethostname");
        return 1;
    }
	
	start = time(NULL);
	if (start == ((time_t)-1)){
		perror("time");
		return 1;
	}
	
	
    FILE *f = fopen("/tmp/pvm_selfhello.log", "a");
    if (f) {

		fprintf(f, "\n\n\nNew Session - Writing on .log: Hello from PVM %s task tid=0x%x pid=%d\n\n\n", hostname, tid, getpid());
		fprintf(f, "Hello from PVM %s task tid=0x%x pid=%d\n", hostname, tid, getpid());
		fprintf(f, "Start counting 3 seconds and printing TaskID... \n");

		do {
	        current = time(NULL);
	        if (current == ((time_t)-1)) {
	            perror("time");
	            return 1;
	        }

	    } while (difftime(current, start) < 3);

	    fprintf(f, "3 seconds have passed!\n\n\n");
		fprintf(f, "Goodbye from PVM %s task tid=0x%x pid=%d time=%d\n", hostname, tid, getpid(), (int)current);
		fprintf(f, "\n\n\n Task End!!! \n\n\n");
        fclose(f);
    }

    pvm_exit();
    return 0;
}

