-----------------------------------------------------------------------------
-- Fluent Logger for Lua
-- Author: Tatsuya Fukata 
-- Version: v0.0.2
-----------------------------------------------------------------------------

local os = require('os')
local socket = require('socket')
local msgpack = require('msgpack')

module('fluent.logger')

local fluent

function connect(host, port)
    local err; 
    fluent, err = socket.connect(host or '127.0.0.1', port or 24224)
    return fluent, err
end

function post(tag, data)
    local connected, err = is_connect()
    if err then
        return nil, err
    end

    local msg = msgpack.pack({tag, os.time(), data})
    return fluent:send(msg)
end

function close()
    local connected, err = is_connect()
    if err then
        return nil, err
    end

    return fluent:close()
end

function is_connect()
    if fluent then
        return 1 
    else
        return nil, "socket is nil" 
    end
end
