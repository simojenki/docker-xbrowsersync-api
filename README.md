# docker-xbrowsersync-api

Container with xbrowsersync-api featuring:

 * easy user mappings (PGID, PUID)
 * imaged based on s6 overlay
 * external mongodb process

## Prerequisites
This image assumes that you have a running mongodb somewhere with the xbrowsersync database created as per [here](https://github.com/xbrowsersync/api#3-configure-mongodb-databases)

## Usage

### CLI
```
docker create \
    --name=xbs-api \
    -e PUID=1000 \
    -e PGID=1000 \
    -e XBROWSERSYNC_DB_HOST=... \
    -e XBROWSERSYNC_DB_PORT=... \
    -e XBROWSERSYNC_DB_USER=... \
    -e XBROWSERSYNC_DB_PWD=... \
    -p 8080 \
    simojenki/xbrowsersync-api
```

## Parameters
 * `-e PUID` User ID
 * `-e PGID` Group ID
 * `-e XBROWSERSYNC_DB_HOST` mongodb host, defaults to 127.0.0.1
 * `-e XBROWSERSYNC_DB_PORT` mongodb port, defaults to 27017
 * `-e XBROWSERSYNC_DB_USER` mongodb database user, defaults to xbrowsersyncdb
 * `-e XBROWSERSYNC_DB_PWD` mongodb database password, defaults to password




