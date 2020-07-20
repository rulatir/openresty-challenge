require('mobdebug').start('172.17.0.1') --host interface
local name = ngx.var.arg_name or "Anonymous"
ngx.say("Hello, ", name, "!")
ngx.say("Done debugging.")
require('mobdebug').done()

