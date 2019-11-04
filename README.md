PHP in Docker
=============

An all-in-one PHP Docker image that comes preconfigured with a large range of extensions; and can be configured using
environment variables. Supports PHP 7.2 & 7.3.

See the [list of available extensions](#available-extensions) to see whether the extension you need is included.

## Table of contents

* [Using images](#using-images)
* [Configuration](#configuration)
    * [PHP](#php)
    * [FPM](#fpm)
    * [New Relic](#new-relic)
    * [XDebug](#xdebug)
* [Available extensions](#available-extensions)
* [Changelog](#changelog)

## Using images

Docker images are available on Docker Hub, and can be pulled using the following command:

    docker pull garbetjie/php:7.3

Additional images can be found at https://hub.docker.com/r/garbetjie/php.

## Configuration

### FPM

| Name              | FPM INI equivalent                                                                                                 | Default     |
|-------------------|--------------------------------------------------------------------------------------------------------------------|-------------|
| PM                | [pm](https://www.php.net/manual/en/install.fpm.configuration.php#pm)                                               | "static"    |
| MAX_CHILDREN      | [pm.max_children](https://www.php.net/manual/en/install.fpm.configuration.php#pm.max-children)                     | 0           |
| MIN_SPARE_SERVERS | [pm.min_spare_servers](https://www.php.net/manual/en/install.fpm.configuration.php#pm.min-spare-servers)           | 1           |
| MAX_SPARE_SERVERS | [pm.max_spare_servers](https://www.php.net/manual/en/install.fpm.configuration.php#pm.max-spare-servers)           | 3           |
| MAX_REQUESTS      | [pm.max_requests](https://www.php.net/manual/en/install.fpm.configuration.php#pm.max-requests)                     | 10000       |
| STATUS_PATH       | [pm.status_path](https://www.php.net/manual/en/install.fpm.configuration.php#pm.status-path)                       | "/_/status" |
| TIMEOUT           | [request_terminate_timeout](https://www.php.net/manual/en/install.fpm.configuration.php#request-terminate-timeout) | 60          |

### PHP

The environment variables below control the behaviour of PHP itself, and are enforced regardless of whether the FPM or
CLI SAPI is used:

| Name                 | INI equivalent                                                                                           | Default                             |
|----------------------|----------------------------------------------------------------------------------------------------------|-------------------------------------|
| DISPLAY_ERRORS       | [display_errors](https://www.php.net/manual/en/errorfunc.configuration.php#ini.display-errors)           | "Off"                               |
| ERROR_REPORTING      | [error_reporting](https://www.php.net/manual/en/errorfunc.configuration.php#ini.error-reporting)         | "E_ALL & ~E_DEPRECATED & ~E_STRICT" |
| HTML_ERRORS          | [html_errors](https://www.php.net/manual/en/errorfunc.configuration.php#ini.html-errors)                 | "Off"                               |
| MAX_EXECUTION_TIME   | [max_execution_time](https://www.php.net/manual/en/info.configuration.php#ini.max-execution-time)        | 30                                  |
| MAX_INPUT_TIME       | [max_input_time](https://www.php.net/manual/en/info.configuration.php#ini.max-input-time)                | 30                                  |
| MAX_REQUEST_SIZE     | [post_max_size](https://www.php.net/manual/en/ini.core.php#ini.post-max-size)                            | "8M"                                |
| MEMORY_LIMIT         | [memory_limit](https://www.php.net/manual/en/ini.core.php#ini.memory-limit)                              | "64M"                               |
| SESSION_SAVE_HANDLER | [session.save_handler](https://www.php.net/manual/en/session.configuration.php#ini.session.save-handler) | "files"                             |
| SESSION_SAVE_PATH    | [session.save_path](https://www.php.net/manual/en/session.configuration.php#ini.session.save-path)       | "/tmp/sessions"                     |
| TIMEZONE             | [date.timezone](https://www.php.net/manual/en/datetime.configuration.php#ini.date.timezone)              | "Etc/UTC"                           |
| UPLOAD_MAX_FILESIZE  | [upload_max_filesize](https://www.php.net/manual/en/ini.core.php#ini.upload-max-filesize)                | "8M"                                |

### New Relic

| Name                     | New Relic INI equivalent                                                                                                                            | Default            |
|--------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|--------------------|
| NEWRELIC_ENABLED         | N/A (Used to enable/disable the New Relic extension)                                                                                                | false              |
| NEWRELIC_APP_NAME        | [newrelic.appname](https://docs.newrelic.com/docs/agents/php-agent/configuration/php-agent-configuration#inivar-appname)                            | ""                 |
| NEWRELIC_AUTORUM_ENABLED | [newrelic.browser_monitoring.auto_instrument](https://docs.newrelic.com/docs/agents/php-agent/configuration/php-agent-configuration#inivar-autorum) | 0                  |
| NEWRELIC_DAEMON_PORT     | [newrelic.daemon.port](https://docs.newrelic.com/docs/agents/php-agent/configuration/php-agent-configuration#inivar-daemon-port)                    | "@newrelic-daemon" |
| NEWRELIC_DAEMON_WAIT     | N/A (Number of seconds to wait for New Relic daemon to start up)                                                                                    | 5                  |
| NEWRELIC_LABELS          | [newrelic.labels](https://docs.newrelic.com/docs/agents/php-agent/configuration/php-agent-configuration#inivar-labels)                              | ""                 |
| NEWRELIC_LICENCE         | [newrelic.license](https://docs.newrelic.com/docs/agents/php-agent/configuration/php-agent-configuration#inivar-license)                            | ""                 |
| NEWRELIC_RECORD_SQL      | [newrelic.transaction_tracer.record_sql](https://docs.newrelic.com/docs/agents/php-agent/configuration/php-agent-configuration#inivar-tt-sql)       | "obfuscated"       |

### XDebug

| Name                    | INI equivalent                                                                   | Default        |
|-------------------------|----------------------------------------------------------------------------------|----------------|
| XDEBUG_ENABLED          | N/A (Used to enable/disable the XDebug extension)                                | false          |
| XDEBUG_IDE_KEY          | [xdebug.idekey](https://xdebug.org/docs/all_settings#idekey)                     | "IDEKEY"       |
| XDEBUG_REMOTE_AUTOSTART | [xdebug.remote_autostart](https://xdebug.org/docs/all_settings#remote_autostart) | 0              |
| XDEBUG_REMOTE_HOST      | [xdebug.remote_host](https://xdebug.org/docs/all_settings#remote_host)           | "192.168.99.1" |
| XDEBUG_REMOTE_PORT      | [xdebug.remote_port](https://xdebug.org/docs/all_settings#remote_port)           | 9000           |

## Available extensions

The following extensions are available:

```
[PHP Modules]
amqp
bcmath
bz2
Core
ctype
curl
date
dom
exif
fileinfo
filter
ftp
gd
gettext
gmp
hash
iconv
igbinary
imap
intl
json
libxml
mbstring
memcached
msgpack
mysqlnd
newrelic
opencensus
openssl
pcntl
pcre
PDO
pdo_mysql
pdo_sqlite
Phar
posix
readline
redis
Reflection
session
SimpleXML
soap
sockets
sodium
SPL
sqlite3
standard
tokenizer
xdebug
xml
xmlreader
xmlwriter
Zend OPcache
zip
zlib

[Zend Modules]
Xdebug
Zend OPcache
```


## Changelog

* **2019-11-04**
    * Update the README to include configuration of various SAPIs, as well as New Relic and XDebug extensions.
    * The New Relic daemon is now started manually (ie: outside of PHP). The container's command will now wait `$NEWRELIC_DAEMON_WAIT`
      seconds for the daemon to start before being executed.
    * Remove unused `$XDEBUG_SERVER_NAME` configuration variable.
    * Update composer version to 1.9.1.
