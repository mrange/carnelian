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

namespace MyNamespace
{
    using System;


    static partial class NumericalExtensions
    {
        public static int Min (this int left, int right)
        {
            if (left < right)
            {
                return left;
            }

            return right;
        }


        public static int Max (this int left, int right)
        {
            if (left < right)
            {
                return right;
            }

            return left;
        }


        public static int Clamp (this int value, int inclusiveMin, int inclusiveMax)
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


        public static bool IsBetween (this int value, int inclusiveMin, int inclusiveMax)
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
        public static long Min (this long left, long right)
        {
            if (left < right)
            {
                return left;
            }

            return right;
        }


        public static long Max (this long left, long right)
        {
            if (left < right)
            {
                return right;
            }

            return left;
        }


        public static long Clamp (this long value, long inclusiveMin, long inclusiveMax)
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


        public static bool IsBetween (this long value, long inclusiveMin, long inclusiveMax)
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
        public static double Min (this double left, double right)
        {
            if (left < right)
            {
                return left;
            }

            return right;
        }


        public static double Max (this double left, double right)
        {
            if (left < right)
            {
                return right;
            }

            return left;
        }


        public static double Clamp (this double value, double inclusiveMin, double inclusiveMax)
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


        public static bool IsBetween (this double value, double inclusiveMin, double inclusiveMax)
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
        public static decimal Min (this decimal left, decimal right)
        {
            if (left < right)
            {
                return left;
            }

            return right;
        }


        public static decimal Max (this decimal left, decimal right)
        {
            if (left < right)
            {
                return right;
            }

            return left;
        }


        public static decimal Clamp (this decimal value, decimal inclusiveMin, decimal inclusiveMax)
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


        public static bool IsBetween (this decimal value, decimal inclusiveMin, decimal inclusiveMax)
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
        public static bool IsAnyOn (this int value, int test)
        {
            return (value & test) != 0;
        }

        public static bool IsAnyOff (this int value, int test)
        {
            return (value & test) != test;
        }

        public static bool IsAllOn (this int value, int test)
        {
            return (value & test) == test;
        }

        public static bool IsAllOff (this int value, int test)
        {
            return (value & test) == 0;
        }
        public static bool IsAnyOn (this long value, long test)
        {
            return (value & test) != 0;
        }

        public static bool IsAnyOff (this long value, long test)
        {
            return (value & test) != test;
        }

        public static bool IsAllOn (this long value, long test)
        {
            return (value & test) == test;
        }

        public static bool IsAllOff (this long value, long test)
        {
            return (value & test) == 0;
        }
        public static double Lerp (
            this double t,
            double from,
            double to
            )
        {
            return t.Clamp (0,1) * (to - from) + from;
        }
        public static decimal Lerp (
            this decimal t,
            decimal from,
            decimal to
            )
        {
            return t.Clamp (0,1) * (to - from) + from;
        }
    }
}

