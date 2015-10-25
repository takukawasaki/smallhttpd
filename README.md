How to build smallhttpd
----------------------

Simply run make:
  $ make



How to run smallhttpd
--------------------

Serve /var/www/htdocs on the default port (80 if running as root, else 8080):
  $ ./smallhttpd /var/www/htdocs

Serve ~/public_html on port 8081:
  $ ./smallhttpd ~/public_html --port 8081

Only bind to one IP address (useful on multi-homed systems):
  $ ./smallhttpd ~/public_html --addr 192.168.0.1

Serve at most 4 simultaneous connections:
  $ ./smallhttpd ~/public_html --maxconn 4

Log accesses to a file:
  $ ./smallhttpd ~/public_html --log access.log

Chroot for extra security (you need root privs for chroot):
  $ ./smallhttpd /var/www/htdocs --chroot

Use default.htm instead of index.html:
  $ ./smallhttpd /var/www/htdocs --index default.htm

Add mimetypes - in this case, serve .dat files as text/plain:
  $ cat extramime
  text/plain  dat
  $ ./smallhttpd /var/www/htdocs --mimetypes extramime

Drop privileges:
  $ ./smallhttpd /var/www/htdocs --uid www --gid www

Use acceptfilter (FreeBSD only):
  $ kldload accf_http
  $ ./smallhttpd /var/www/htdocs --accf

Run in the background and create a pidfile:
  $ ./smallhttpd /var/www/htdocs --pidfile /var/run/httpd.pid --daemon

Web forward (301) requests for some hosts:
  $ ./smallhttpd /var/www/htdocs --forward example.com http://www.example.com \
    --forward secure.example.com https://www.example.com/secure

Web forward (301) requests for all hosts:
  $ ./smallhttpd /var/www/htdocs --forward example.com http://www.example.com \
    --forward-all http://catchall.example.com

Commandline options can be combined:
  $ ./smallhttpd ~/public_html --port 8080 --addr 127.0.0.1

To see a full list of commandline options,
run smallhttpd without any arguments:
  $ ./smallhttpd

vim:set ts=2 sw=2 et tw=80:
