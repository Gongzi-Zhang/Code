# Process in Linux
			init
			  |
			  |
+-------+  +-------+  +--------+  +--------+ +-------+  +-------+
|deamon1|  |deamon2|  |session1|  |session1| |deamon3|  |deamon4|
+-------+  +-------+  +--------+  +--------+ +-------+  +-------+
                          |
			  |
+----------+ +----------+ +----------+ +----------+ +----------+ 
|fg process| |bg process| |bg process| |fg process| |fg process| 
+----------+ +----------+ +----------+ +----------+ +----------+ 


## commands
bg 
fg
jobs
disown	: remove a job from a session
screen  : terminal multiplexer
tmux	: same as screen, but more powerful

## background process
In Linux, a backround process will inherit **stdout** and **stderr** from
its parent process, so its output will still be shown in the console;
but it doesn't inherit the **stdin**, so you can't input anything for it.

When the session is closed, it will send *SIGHUP* signal to all its child
process to its fg process. Depending on the option huponexit 
(shopt | grep huponexit), if set on, it will also sent *SIGHUP* signal
to bg processes; if set off, then not, so bg process will keep running.
