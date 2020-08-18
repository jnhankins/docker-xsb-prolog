# XSB Prolog - Docker Image

This is the Git repo of the Docker image [jnhankins/xsb-prolog](https://hub.docker.com/r/jnhankins/xsb-prolog) hosted on [Docker Hub](https://hub.docker.com/). 

[XSB](http://xsb.sourceforge.net/) is a Logic Programming and Deductive Database system for Unix and Windows.

<pre>
<b>docker pull jnhankins/xsb-prolog</b>
<b>docker run -it jnhankins/xsb-prolog</b>
[xsb_configuration loaded]
[sysinitrc loaded]
[xsbbrat loaded]

XSB Version 3.8.0 (Three-Buck Chuck) of October 28, 2017
[x86_64-unknown-linux-gnu 64 bits; mode: optimal; engine: slg-wam; scheduling: local]
[Build date: 2020-08-18]

| ?- <b>[user].</b>
[Compiling user]
<b>edge(1,2).
edge(2,3).
edge(2,4).
reachable(X,Y) :- edge(X,Y).
reachable(X,Y) :- edge(X,Z), reachable(Z,Y).
    <i>ctrl+d</i></b>
[user compiled, cpu time used: 0.0050 seconds]
[user loaded]

yes
| ?- <b>reachable(1,4).</b>

yes
| ?- <b>reachable(4,1).</b>

no
| ?- <b>halt.</b>

End XSB (cputime 0.02 secs, elapsetime 121.66 secs)
</pre>

[XSB Tutorial: Basic Command Line Examples](https://www.isi.edu/~argos/matthew/xsb_command_line_tutorial.html)
