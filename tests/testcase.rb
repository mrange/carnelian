require 'carnelian_runtime'
require 'ostruct'
def HelperMethodY (x)
    puts "HelperY"
end
def HelperMethodX (x)
    HelperMethodY (x)
    puts "HelperX"
end
def generate_document (document)
    document.new_line
    document.new_line
    document.new_line
    document.write '// Whitespace lines should be preserved'
    document.new_line
    document.new_line
    document.new_line
    document.new_line
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
    document.write (iter)
    document.new_line
        end
    end
    document.new_line
    document.write '@@ testing '
    document.write ("Gargle")
    document.new_line
    document.new_line
end

document = CarnelianRuntime.create_document

generate_document document

document.get_lines
