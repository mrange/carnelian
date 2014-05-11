@@@ metaprogram
@@@ extension cs
// ----------------------------------------------------------------------------------------------
// Copyright (c) Mårten Rånge.
// ----------------------------------------------------------------------------------------------
// This source code is subject to terms and conditions of the Microsoft Public License. A
// copy of the license can be found in the License.html file at the root of this distribution.
// If you cannot locate the  Microsoft Public License, please send an email to
// dlr@microsoft.com. By using this source code in any fashion, you are agreeing to be bound
//  by the terms of the Microsoft Public License.
// ----------------------------------------------------------------------------------------------
// You must not remove this notice, or any other, from this software.
// ----------------------------------------------------------------------------------------------

namespace @@=$namespace=@@
{
    using System;


    static partial class NumericalExtensions
    {
@@> int_types   = $number_types.get :int_like   , []
@@> float_types = $number_types.get :float_like , []
@@> all_types   = int_types + float_types
@@> for number_type in all_types
        public static @@=number_type=@@ Min (this @@=number_type=@@ left, @@=number_type=@@ right)
        {
            if (left < right)
            {
                return left;
            }

            return right;
        }


        public static @@=number_type=@@ Max (this @@=number_type=@@ left, @@=number_type=@@ right)
        {
            if (left < right)
            {
                return right;
            }

            return left;
        }


        public static @@=number_type=@@ Clamp (this @@=number_type=@@ value, @@=number_type=@@ inclusiveMin, @@=number_type=@@ inclusiveMax)
        {
            if (value < inclusiveMin)
            {
                return inclusiveMin;
            }

            if (value > inclusiveMax)
            {
                return inclusiveMax;
            }


            return value;
        }


        public static bool IsBetween (this @@=number_type=@@ value, @@=number_type=@@ inclusiveMin, @@=number_type=@@ inclusiveMax)
        {
            if (value < inclusiveMin)
            {
                return false;
            }

            if (value > inclusiveMax)
            {
                return false;
            }


            return true;
        }
@@> end
@@> for number_type in int_types
        public static bool IsAnyOn (this @@=number_type=@@ value, @@=number_type=@@ test)
        {
            return (value & test) != 0;
        }

        public static bool IsAnyOff (this @@=number_type=@@ value, @@=number_type=@@ test)
        {
            return (value & test) != test;
        }

        public static bool IsAllOn (this @@=number_type=@@ value, @@=number_type=@@ test)
        {
            return (value & test) == test;
        }

        public static bool IsAllOff (this @@=number_type=@@ value, @@=number_type=@@ test)
        {
            return (value & test) == 0;
        }
@@> end
@@> for number_type in float_types
        public static @@=number_type=@@ Lerp (
            this @@=number_type=@@ t,
            @@=number_type=@@ from,
            @@=number_type=@@ to
            )
        {
            return t.Clamp (0,1) * (to - from) + from;
        }
@@> end
    }
}

@@+ class Hash
@@+     def get (key, defaultValue=nil)
@@+         value = self[key]
@@+         return value unless value == nil
@@+         return defaultValue || ("KEY_'%s'_NOT_FOUND" % key.to_s)
@@+     end
@@+ end

