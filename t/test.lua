local os = require('os')
local fluent = require('fluent.logger')

local rs_connect = fluent.connect('127.0.0.1', 24224)
local rs_post = fluent.post('test.hoge', { hoge = 'aaa', foo = 'bbb' })
local rs_close = fluent.close()

print(rs_connect) 
print(rs_post) 
print(rs_close) 
