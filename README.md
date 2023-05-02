# NGINX 

## File Mount
Mount a file containing index.html to render.
```aidl
// run nginx to render default welcome page
docker run -it -p 8080:80 --name web nginx

// mount drive to render your page
// note: /usr/share/nginx/html is the default location for static pages
docker run -it -p 8080:80 --name web -v ~/source/nginx:/usr/share/nginx/html  nginx
```
## Custom Image
Build custom image from NGINX base image and copy in index.html.
### Dockerfile
FROM NGINX:latest  
COPY ./index.html /usr/share/nginx/html/index.html
```aidl
$ docker build -t webserver .
$ docker run -it --rm -d -p:8080:80 --name web webserver
// test with header
$ curl http://localhost:8080/index.html --header "X-Test: hello"
```
This will produce output similar to the following:
```aidl
docker logs web
2023/05/02 08:47:58 [warn] 7#7: *1 [lua] access_by_lua(default.conf:26):4: Custom header val: dean-test-001, client: 172.17.0.1, server: =, request: "GET / HTTP/1.1", host: "localhost:8080"
2023/05/02 08:47:58 [warn] 7#7: *1 [lua] access_by_lua(default.conf:26):6: Finished Custom header value, client: 172.17.0.1, server: =, request: "GET / HTTP/1.1", host: "localhost:8080"
172.17.0.1 - - [02/May/2023:08:47:58 +0000] "GET / HTTP/1.1" 200 138 "curl/7.77.0" - "dean-test-001"
```
