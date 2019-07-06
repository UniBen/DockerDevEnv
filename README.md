Docker Dev Env
==

Allow for any docker-compose project to be accessible via a https host.

## Connecting to the database

### Connection to the proxy-wide database within the container

* Host: `parallax-db`
* Port: `3306`
* Username: `root`
* Password: `parallax`

### Connection to the database from outside the container

You may connect to the database using `localhost` or if you prefer `database.parallax.local.dev`

Username, password and port are the same as the ones you use to connect with from within a container.

## Known issues

* There is a max file size upload which is controlled by the proxy. More can be found here: 
    * https://github.com/jwilder/nginx-proxy/issues/318
    * https://github.com/jwilder/nginx-proxy/issues/981
* Specifying services that do not use the http protocol will not work.

All of the issues above can be remedied with custom nginx files.

## References

* https://docker-hy.github.io/part1/
* https://docker-hy.github.io/part2/
* https://docker-hy.github.io/part3/
