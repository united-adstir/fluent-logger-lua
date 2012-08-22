local os = require('os')
local socket = require('socket')
local msgpack = require('msgpack')

module('fluent.logger')

local fluent

function connect(host, port) 
    fluent = socket.connect(host or '127.0.0.1', port or 24224)
end

function post(tag, data) 
    local msg = msgpack.pack({tag, os.time(), data}) 
    fluent:send(msg)
end

function close() 
    fluent:close()
end
