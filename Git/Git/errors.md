# Some errors about Git and problem-shooting 

## crontab
* git push doesn't work in crontab becuase of *permission denied (publickey)*
> > you need to set **SSH_AUTH_SOCK** variable for cron deamon.
