# web

##Notes

Adding this section to the nginx configuration will route requests to the uWSGI server using a unix socket.

```
location /web {                                                                                                           
    uwsgi_pass unix:///tmp/web-uwsgi.sock;                                                                                
    include uwsgi_params;                                                                                                 
}
```

## Dependencies

uWSGI - an application server that implements WSGI
nginx - a web server

## Glossary

WSGI - Web Server Gateway Interface. Defines a common interface between web servers (e.g. nginx) and python web applications/frameworks (e.g. Django). Defined in PEP 3333
