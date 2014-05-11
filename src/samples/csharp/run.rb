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

require 'carnelian_executor'

$namespace  = "MyNamespace"
$classes    =
    [
        {
            name:   "MyClass"                                   ,
            properties:
                [
                    {
                        type:           "double"                ,
                        name:           "MyProperty"            ,
                        default_value:  '32.0'                  ,
                    }                                           ,
                    {
                        type:           "string"                ,
                        name:           "MyOtherProperty"       ,
                        default_value:  '""'                    ,
                    }                                           ,
                ]                                               ,
        }                                                       ,
        {
            name:   "MyOtherClass"                              ,
            properties:
                [
                    {
                        type:   "string"                        ,
                        name:   "MyProperty"                    ,
                    }                                           ,
                    {
                        type:   "string"                        ,
                        name:   "MyOtherProperty"               ,
                    }                                           ,
                ]                                               ,
        }                                                       ,
    ]

CarnelianExecutor.execute_metaprogram_to_file "dependency_properties.mp", "generated_properties.cs"

$number_types   =
    {
        int_like:   ["int", "long"]                             ,
        float_like: ["double", "decimal"]                       ,
    }

CarnelianExecutor.execute_metaprogram_to_file "numerical_extensions.mp", "generated_extensions.cs"
