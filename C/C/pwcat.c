/*
 * pwcat.c
 *
 * Generate a printable version of the password database
 *
 */
#include <stdio.h>
#include <pwd.h>
#include <grp.h>

int main(argc, argv)
int argc;
char **argv;
{
    struct passwd *p;
    struct group  *g;

    while ( (p = getpwent()) != NULL)
    {
	printf("%s:%s:%d:%d:%s:%s:%s\n",
		p->pw_name, p->pw_passwd, p->pw_uid,
		p->pw_gid, p->pw_gecos, p->pw_dir, p->pw_shell);
    }
    endpwent();
    printf("\n\n\n");
    while ( (g = getgrent()) != NULL)
    {
	printf("%s:%s:%d:", g->gr_name, g->gr_passwd, g->gr_gid);
	for(int i=0; g->gr_mem[i] != NULL; i++)
	{
	    printf("%s", g->gr_mem[i]);
	    if (g->gr_mem[i+1] != NULL)
		putchar(",");
	}
	putchar("\n");
    }
    endgrent();
    exit(0);
}
