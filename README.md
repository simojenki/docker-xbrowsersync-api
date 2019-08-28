# docker-xbrowsersync-api

Container with xbrowsersync-api featuring:

* easy user mappings (PGID, PUID)
* imaged based on s6 overlay

## Prerequisites
This image assumes that you have a running mongodb somewhere with the xbrowsersync database created as per [here](https://github.com/xbrowsersync/api#3-configure-mongodb-databases)

## Usage

```
docker run \
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





