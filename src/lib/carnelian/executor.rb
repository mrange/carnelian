# ----------------------------------------------------------------------------------------------
# Copyright (c) Mårten Rånge.
# ----------------------------------------------------------------------------------------------
# This source code is subject to terms and conditions of the Microsoft Public License. A
# copy of the license can be found in the License.html file at the root of this distribution.
# If you cannot locate the  Microsoft Public License, please send an email to
# dlr@microsoft.com. By using this source code in any fashion, you are agreeing to be bound
#  by the terms of the Microsoft Public License.
# ----------------------------------------------------------------------------------------------
# You must not remove this notice, or any other, from this software.
# ----------------------------------------------------------------------------------------------

require 'ostruct'

module CarnelianExecutor
    class CarnelianError < RuntimeError
    end

    module Details
        def self.make_match (match, &processor)
            os = OpenStruct.new
            os.match        = match
            os.processor    = processor
            return os
        end

        def self.make_template_write_line (lines, line, begin_tag, end_tag)

            length          = line.length
            if length > 0 then
                is_inside_tag   = false
                current_index   = 0
                next_index      = 0
                current_tag     = begin_tag

                while current_index < length
                    next_index = line.index current_tag, current_index

                    effective_index = next_index || length

                    if !is_inside_tag then
                        slice = line.slice current_index, (effective_index - current_index)
                        slice.gsub! /(\\|\')/, '\\\\\1'

                        if slice.length > 0 then
                            l = "document.write '"
                            l << slice
                            l << "'"
                            lines << l
                        end

                        current_index   = effective_index + begin_tag.length
                        current_tag     = end_tag
                    else
                        slice = line.slice current_index, (effective_index - current_index)
                        l = "document.write ("
                        l << slice
                        l << ")"
                        lines << l

                        current_index   = effective_index + end_tag.length
                        current_tag     = begin_tag
                    end

                    is_inside_tag   = !is_inside_tag
                end
            end

            lines << "document.new_line"
        end

        $match_metaprogram      = make_match (/^@@@ metaprogram\s*$/) \
                                    do |line_context, metaprogram|
                                        if line_context.line_no > 1 then
                                            failure = "%s(%d) : metaprogram line must appear at first line" %
                                                        [
                                                            line_context.file_name  ,
                                                            line_context.line_no    ,
                                                        ]
                                            metaprogram.failures <<  failure
                                        else
                                            line_context.is_metaprogram = true
                                        end
                                    end
        $match_include          = make_match (/^@@@ include\s+(?<file>\S+)\s*$/) \
                                    do |line_context, metaprogram|
                                        filename    = line_context.match_data["file"]
                                        seen_files  = line_context.seen_files
                                        read_metaprogram_impl filename,seen_files,metaprogram
                                    end
        $match_require          = make_match (/^@@@ require\s+(?<require>\S+)\s*$/) \
                                    do |line_context, metaprogram|
                                        metaprogram.requires   << line_context.match_data["require"]
                                    end
        $match_extension        = make_match (/^@@@ extension\s+(?<extension>\S+)\s*$/) \
                                    do |line_context, metaprogram|
                                        if (metaprogram.extension || "") == "" then
                                            metaprogram.extension = line_context.match_data["extension"]
                                        end
                                    end
        $match_inject_tokens    = make_match (/^@@@ inject_tokens\s+(?<begin_tag>\S+)\s+(?<end_tag>\S+)\s*$/) \
                                    do |line_context, metaprogram|
                                        line_context.begin_tag  = line_context.match_data["begin_tag"]
                                        line_context.end_tag    = line_context.match_data["end_tag"]
                                    end
        $match_template_line    = make_match (/^@@\>(?<line>.*)$/) \
                                    do |line_context, metaprogram|
                                        metaprogram.template_lines         << line_context.match_data["line"]
                                    end
        $match_program_line     = make_match (/^@@\+(?<line>.*)$/) \
                                    do |line_context, metaprogram|
                                        metaprogram.program_lines          << line_context.match_data["line"]
                                    end
        $match_escaped_line     = make_match (/^\\(?<line>@@.*)$/) \
                                    do |line_context, metaprogram|
                                        make_template_write_line metaprogram.template_lines, line_context.match_data["line"], line_context.begin_tag, line_context.end_tag
                                    end
        $match_normal_line      = make_match (/^(?<line>.*)$/) \
                                    do |line_context, metaprogram|
                                        make_template_write_line metaprogram.template_lines, line_context.match_data["line"], line_context.begin_tag, line_context.end_tag
                                    end
        $match_unmatched_line   = make_match (/.*/) \
                                    do |line_context, metaprogram|
                                        metaprogram.template_lines << "document.write 'UNMATCHED INPUT LINE'"
                                        metaprogram.template_lines << "document.new_line"
                                    end

        $matches =
                    [
                        $match_metaprogram      ,
                        $match_include          ,
                        $match_require          ,
                        $match_extension        ,
                        $match_inject_tokens    ,
                        $match_template_line    ,
                        $match_program_line     ,
                        $match_escaped_line     ,
                        $match_normal_line      ,
                        $match_unmatched_line   ,
                    ]

        def self.read_metaprogram_impl (filename, seen_files, metaprogram)

            realpath = File.realpath filename

            # Is this file already processed?
            return if seen_files.key? realpath

            seen_files.store realpath, true

            line_context                    = OpenStruct.new
            line_context.begin_tag          = "@@="
            line_context.end_tag            = "=@@"
            line_context.file_name          = realpath
            line_context.line_no            = 0
            line_context.is_metaprogram     = false
            line_context.seen_files         = seen_files
            line_context.match_data         = nil
            line_context.line               = ""


            lines = []

            File.open (realpath) do |file|
                lines = file.readlines
            end

            for line in lines

                line_context.line_no    += 1
                line_context.line       = line

                for match in $matches
                    line_context.match_data = match.match.match line
                    if line_context.match_data != nil then
                        match.processor.call line_context, metaprogram
                        break
                    end
                end

            end

            unless line_context.is_metaprogram then
                failure = "%s(1) : No metaprogram line discovered" %
                            [
                                line_context.file_name  ,
                            ]
                metaprogram.failures <<  failure
            end

            return
        end

        def self.read_metaprogram (filename)
            seen_files = {}

            metaprogram = OpenStruct.new
            metaprogram.extension          = ""
            metaprogram.template_lines     = []
            metaprogram.program_lines      = []
            metaprogram.requires           = ["carnelian/runtime"]
            metaprogram.failures           = []

            read_metaprogram_impl filename, seen_files, metaprogram

            metaprogram.requires.uniq!
            metaprogram.requires.sort!
            metaprogram.failures.uniq!

            return metaprogram
        end

        def self.build_metaprogram (filename)
            metaprogram = read_metaprogram filename

            if metaprogram.failures.length > 0 then
                raise CarnelianError, "Failures detected: " + metaprogram.failures.join(', ')
            end


            lines = []
            for req in metaprogram.requires
                line = 'require \''
                line << req
                line << '\''
                lines << line
            end

            for line in metaprogram.program_lines
                lines << line
            end

            lines << "def generate_document (document)"
                for line in metaprogram.template_lines
                    l = "    "
                    l << line
                    lines << l
                end
            lines << "end"

            lines << %q{
document = CarnelianRuntime.create_document

generate_document document

document.get_lines
}
            metaprogram.metaprogram = lines.join "\n"

            metaprogram
        end

        def self.execute_metaprogram (filename)
            metaprogram = build_metaprogram filename

            lines = TOPLEVEL_BINDING.eval metaprogram.metaprogram

            metaprogram.result = lines.join "\n"

            metaprogram
        end

    end

    def self.build_metaprogram (filename)
        metaprogram     = Details.build_metaprogram filename

        metaprogram.metaprogram
    end

    def self.build_metaprogram_to_file (filename,output_filename=nil)
        extension       = File.extname filename
        basename        = File.basename filename, extension

        metaprogram     = Details.build_metaprogram filename

        outname         = output_filename || ("%s.rb" % [basename])

        File.open outname, "w" do |file|
            file.write metaprogram.metaprogram
        end
    end

    def self.execute_metaprogram (filename)
        metaprogram     = Details.execute_metaprogram filename

        metaprogram.result
    end

    def self.execute_metaprogram_to_file (filename,output_filename=nil)
        extension       = File.extname filename
        basename        = File.basename filename, extension

        metaprogram     = Details.execute_metaprogram filename

        new_extension   = metaprogram.extension == "" ? "txt" : metaprogram.extension
        outname         = output_filename || ("%s.%s" % [basename, new_extension])

        File.open outname, "w" do |file|
            file.write metaprogram.result
        end
    end
end
