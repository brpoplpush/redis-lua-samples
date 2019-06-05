# Redis lua samples

The purpose of this repo is to provide some examples of
using lua with redis.

## Redis lua debugger

<https://redis.io/topics/ldb>
```sh
$ redis-cli --ldb --eval scripts/debug.lua
```

## Redis lua and json

<https://www.kyne.com.au/~mark/software/lua-cjson-manual.html>

```sh
$ redis-cli --eval scripts/json.lua
1) "[1]"
2) "{\"a\":\"oof\"}"
3) "a"
```

The limitations of `cjson` within the redis should discourage
you from using it for redis lua scripting.
