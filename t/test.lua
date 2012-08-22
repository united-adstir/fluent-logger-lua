local os = require('os')
local fluent = require('fluent.logger')

fluent.connect('127.0.0.1', 24224)
fluent.post('test.hoge', { hoge = 'aaa', foo = 'bbb' })
fluent.close()
