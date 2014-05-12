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

module CarnelianRuntime
    class Document
        def initialize ()
            @current_line   = ""
            @lines          = []
        end

        def write (value)
            @current_line << value.to_s
        end

        def new_line ()
            @lines << @current_line
            @current_line = ""
        end

        def get_lines ()
            return @lines
        end
    end

    def self.create_document
        Document.new
    end

end