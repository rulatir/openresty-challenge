require('mobdebug.mobdebug').start('172.17.0.1')
print "Hello from CLI"
print "Hello again from cli"

function whatevs()
  print "Hello from a function! Are we actually standing on a breakpoint?"
end

whatevs()
