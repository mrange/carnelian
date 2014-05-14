require 'carnelian_runtime'
def generate_document (document)
    document.write 'class SomeClass'
    document.new_line
    document.write '{'
    document.new_line
     for iter in 0..10
    document.write '    public int X'
    document.write (iter)
    document.write ' {get; set; }'
    document.new_line
     end
    document.write '}'
    document.new_line
end

document = CarnelianRuntime.create_document

generate_document document

document.get_lines
