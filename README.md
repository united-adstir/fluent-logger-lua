# Fluent Logger for Lua

## Requirements
- Lua >= 5.1
- https://github.com/kengonakajima/lua-msgpack
- http://luaforge.net/projects/luasocket/ 

## Install
- copy lib/fluent to lua libraty path.

## Quickstart

    local fluent = require('fluent.logger')
    local rs_connect = fluent.connect('127.0.0.1', 24224)
    local rs_post = fluent.post('test.hoge', { hoge = 'aaa', foo = 'bbb' })
    local rs_close = fluent.close()

## License
Apache License, Version 2.0
