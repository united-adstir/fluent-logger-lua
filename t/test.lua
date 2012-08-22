local fluent = require('fluent.logger')

local rs_connect, err_connect = fluent.connect('127.0.0.1', 24224)
if err_connect then
    error(err_connect)
end

local rs_post, err_post = fluent.post('test.hoge', { hoge = 'aaa', foo = 'bbb' })
if err_post then
    error(err_post)
else
    print(rs_post)
end

local rs_close = fluent.close()
print(rs_close)
