#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>

/**
 * infinite_while - Runs an infinite loop to keep the program running
 * Return: 0 on success
 */
int infinite_while(void)
{
	while (1)
	{
		sleep(1);
	}
	return (0);
}

/**
 * main - Creates 5 zombie processes.
 * Return: 0 on success
 */
int main(void)
{
	pid_t pid;
	int i;

	for (i = 0; i < 5; i++)
	{
		pid = fork();
		if (pid > 0)
		{
			printf("Zombie process created, PID: %d\n", pid);
			sleep(1);
		}
		else if (pid == 0)
		{
			exit(0);
		}
		else
		{
			perror("fork");
			return (EXIT_FAILURE);
		}
	}

	infinite_while();

	return (EXIT_SUCCESS);
}
