#AutoGhost.sh

![](http://evil7.net/content/images/2015/11/AutoGhostLogo.jpg)

*More Awesome things in my blog ! >> [[ evil7's Blog ]](http://evil7.net)* :p（原图来自火熊CG网）

#Start install

**Tips :**

1. Use a new OS. that's better !

2. It will download and build a **NEW GhostBlog** at `/srv/ghost` !

3. So if you are already have one in `/srv/ghost` don't forget to **BACKUP** your Database and Themes and any important files at first !

4. If you need check it first ! → <a href="https://raw.githubusercontent.com/evil7/AutoGhost.sh/master/AutoGhost.sh" target="blank">Code</a>

**Make everything clear and run :**

```
wget https://raw.githubusercontent.com/evil7/AutoGhost.sh/master/AutoGhost.sh

sudo sh AutoGhost.sh
```

**Input your domain for your blog when you see this :**

```
please input your domain :
http://
```

( It will take 1-2 mins. Depend on your internet. )

#Useful info

About GhostBlog : [ghost.org (en)](http://ghost.org) / [ghostchina.com (cn)](http://ghostchina.com)

Support OS : `Ubuntu` / `Debian` / `Kali`

Will install : `curl` / `unzip` / `Nodejs` / `npm` / `SQLite3` / `Nginx` / `forever` / `watchdog`

All blog-files install in : `/srv/ghost`

Config file for Nginx save in : `/etc/nginx/sites-available/ghost.config`

Need help please check here : [Mail_Me](mailto:ljokerp@foxmail.com?subject=AutoGhost_feedback)

More Awesome things please check my blog ! >> [[ evil7's Blog ]](http://evil7.net)

#Update history

* ( 2015/11/04 ) v1.0 ---- Coding AutoGhost.sh and fixed some bugs. It can't used in `curl -sL xxx | sh -` to do install. It will skip the `read -p` when running.
* ( 2015/11/10 ) v1.1 ---- Fix a little bug and now ghost suppost nodejs-0.12 so let's use 0.12. ( 11:27 Happy 1111 day! )
* ( 2015/12/10 ) v1.2 ---- Change to install nodejs 4.x for ghostblog. Fix a mistake and some commands.
