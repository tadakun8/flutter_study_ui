## json-server

This directory is for "json-server(npm module)" to be as mock server.

"db.json" file is the response value.

### Usage

```
$ npx json-server --watch --port 3030 db.json
```

### Caution

The method of setting up a local mock server like json-server to check communication is only available when debugging on the web.

When debugging ios and android, emulators are used, but "localhost:3030" is the local host in the emulator, because the mock server is not running there.