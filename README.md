# flyspray
FlySpray Bug &amp; Issue Tracker - Docker Image

FlySpray is a web based Bug & Issue Tracking system written in the PHP language. And is released under the GNU [Lesser General Public License Version 2.1](http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html).

FlySpray Website: [http://flyspray.org/about](http://flyspray.org/about)

## Base Image
[library/PHP:5.6-apache](https://registry.hub.docker.com/_/php/)

Latest FlySpray from GitHub: [https://github.com/Flyspray/flyspray](https://github.com/Flyspray/flyspray)

## This version of the image is only configured to work with MySQLi

### Create a MySQL Container
Basic Setup

```
docker run --name mysql_db_container_name -h mysql_db_host_name -e MYSQL_ROOT_PASSWORD=secretpassword -d mysql
```

### Create the flyspray Container
Basic Setup

```
docker run --name flyspray_container_name -h flyspray_host_name --link mysql_db_container_name:mysql -P -d jgratton/flyspray
```

## Finally
Navigate to your installation in the web browser

**Example**
[http://192.168.59.103:49154](http://192.168.59.103:49154)

The top of the web page will look like:

(<img src="https://raw.githubusercontent.com/jgratton/flyspray/master/Setup_Screen_1_Top.png">)

The bottom of the page will look like:

(<img src="https://raw.githubusercontent.com/jgratton/flyspray/master/Setup_Screen_1_Bottom.png">)

Click the Next Button on the bottom of the page.

### Your setup according to the Conainers we made would be the following:
* Host Name: mysql
* Database User Name: root
* Database Password: secretpassword

Even though we set the HOST name in the MySQL container to mysql_db_host_name, the Host Name that Docker passes is the ALIAS we set via the link in the FlySpray container.  The **ALIAS**: mysql

The Docker [library/mysql](https://registry.hub.docker.com/_/mysql/) image requires the ALIAS, mysql.  There are likely ways to change this.  But that is not covered by this README.