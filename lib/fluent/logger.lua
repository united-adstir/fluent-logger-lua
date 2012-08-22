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
    if is_connect() then
        return nil
    end

    local msg = msgpack.pack({tag, os.time(), data})
    return fluent:send(msg)
end

function close()
    if is_connect() then
        return nil
    end

    return fluent:close()
end

function is_connect()
    return fluent == nil
end
