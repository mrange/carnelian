require 'carnelian/runtime'
require 'ostruct'
 def HelperMethodY (x)
     puts "HelperY"
 end
 # embedded comment
 def HelperMethod (input)
     "Hello %s" % input
 end
def generate_document (document)
    document.new_line
    document.new_line
    document.new_line
    document.write '// Boolean values should be properly injected'
    document.new_line
    document.write '// Lines starting with inject token are ok'
    document.new_line
    document.write (false)
    document.write (true)
    document.new_line
    document.new_line
    document.write '// Lines starting with double @@'
    document.new_line
    document.write '@@  '
    document.write ("Testing")
    document.new_line
    document.write '@@+  '
    document.write ("Testing")
    document.new_line
    document.write '@@>  '
    document.write ("Testing")
    document.new_line
    document.new_line
    document.write '// Simple ruby expression tests'
    document.new_line
     for iter in 0..10
         if iter % 2 == 0 then
    document.write '    // This \\n is \'a\' test '
    document.write (iter)
    document.write ' of injects'
    document.new_line
    document.write '    // This is a test of nothing special'
    document.new_line
    document.write '    // This is a test '
    document.write (iter)
    document.write ' of two injects '
    document.write (HelperMethod "world")
    document.new_line
         end
     end
    document.new_line
    document.write '// A helper method'
    document.new_line
end

document = CarnelianRuntime.create_document

generate_document document

document.get_lines
