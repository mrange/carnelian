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
    using System.Collections;
    using System.Collections.ObjectModel;
    using System.Collections.Specialized;


    using System.Windows;
    using System.Windows.Media;


    // ------------------------------------------------------------------------
    // MyClass
    // ------------------------------------------------------------------------
    partial class MyClass
    {
        #region Uninteresting generated code
        public static readonly DependencyProperty MyPropertyProperty = DependencyProperty.Register (
            "MyProperty",
            typeof (double),
            typeof (MyClass),
            new FrameworkPropertyMetadata (
                32.0,
                FrameworkPropertyMetadataOptions.None,
                Changed_MyProperty,
                Coerce_MyProperty
            ));

        static void Changed_MyProperty (DependencyObject dependencyObject, DependencyPropertyChangedEventArgs eventArgs)
        {
            var instance = dependencyObject as MyClass;
            if (instance != null)
            {
                var oldValue = (double)eventArgs.OldValue;
                var newValue = (double)eventArgs.NewValue;
                instance.Changed_MyProperty (oldValue, newValue);
            }
        }

        static object Coerce_MyProperty (DependencyObject dependencyObject, object basevalue)
        {
            var instance = dependencyObject as MyClass;
            if (instance == null)
            {
                return basevalue;
            }

            var value = (double)basevalue;
            instance.Coerce_MyProperty (ref value);

            return value;
        }
        public static readonly DependencyProperty MyOtherPropertyProperty = DependencyProperty.Register (
            "MyOtherProperty",
            typeof (string),
            typeof (MyClass),
            new FrameworkPropertyMetadata (
                "",
                FrameworkPropertyMetadataOptions.None,
                Changed_MyOtherProperty,
                Coerce_MyOtherProperty
            ));

        static void Changed_MyOtherProperty (DependencyObject dependencyObject, DependencyPropertyChangedEventArgs eventArgs)
        {
            var instance = dependencyObject as MyClass;
            if (instance != null)
            {
                var oldValue = (string)eventArgs.OldValue;
                var newValue = (string)eventArgs.NewValue;
                instance.Changed_MyOtherProperty (oldValue, newValue);
            }
        }

        static object Coerce_MyOtherProperty (DependencyObject dependencyObject, object basevalue)
        {
            var instance = dependencyObject as MyClass;
            if (instance == null)
            {
                return basevalue;
            }

            var value = (string)basevalue;
            instance.Coerce_MyOtherProperty (ref value);

            return value;
        }
        #endregion

        // --------------------------------------------------------------------
        MyClass ()
        {
            CoerceAllProperties ();
            Constructed_MyClass ();
        }
        // --------------------------------------------------------------------
        partial Constructed_MyClass ();
        // --------------------------------------------------------------------
        void CoerceAllProperties ()
        {
            CoerceValue (MyPropertyProperty);
            CoerceValue (MyOtherPropertyProperty);
        }
        // --------------------------------------------------------------------

        // --------------------------------------------------------------------
        // Properties
        // --------------------------------------------------------------------

        // --------------------------------------------------------------------
        // Property MyProperty
        // --------------------------------------------------------------------
        public double MyProperty
        {
            get
            {
                return (double)GetValue (MyPropertyProperty);
            }
            set
            {
                if (MyProperty != value)
                {
                    SetValue (MyPropertyProperty, value);
                }
            }
        }
        // --------------------------------------------------------------------
        partial void Changed_MyProperty (double oldValue, double newValue);
        partial void Coerce_MyProperty (ref double coercedValue);
        // --------------------------------------------------------------------

        // --------------------------------------------------------------------
        // Property MyOtherProperty
        // --------------------------------------------------------------------
        public string MyOtherProperty
        {
            get
            {
                return (string)GetValue (MyOtherPropertyProperty);
            }
            set
            {
                if (MyOtherProperty != value)
                {
                    SetValue (MyOtherPropertyProperty, value);
                }
            }
        }
        // --------------------------------------------------------------------
        partial void Changed_MyOtherProperty (string oldValue, string newValue);
        partial void Coerce_MyOtherProperty (ref string coercedValue);
        // --------------------------------------------------------------------

    }


    // ------------------------------------------------------------------------
    // MyOtherClass
    // ------------------------------------------------------------------------
    partial class MyOtherClass
    {
        #region Uninteresting generated code
        public static readonly DependencyProperty MyPropertyProperty = DependencyProperty.Register (
            "MyProperty",
            typeof (string),
            typeof (MyOtherClass),
            new FrameworkPropertyMetadata (
                default (string),
                FrameworkPropertyMetadataOptions.None,
                Changed_MyProperty,
                Coerce_MyProperty
            ));

        static void Changed_MyProperty (DependencyObject dependencyObject, DependencyPropertyChangedEventArgs eventArgs)
        {
            var instance = dependencyObject as MyOtherClass;
            if (instance != null)
            {
                var oldValue = (string)eventArgs.OldValue;
                var newValue = (string)eventArgs.NewValue;
                instance.Changed_MyProperty (oldValue, newValue);
            }
        }

        static object Coerce_MyProperty (DependencyObject dependencyObject, object basevalue)
        {
            var instance = dependencyObject as MyOtherClass;
            if (instance == null)
            {
                return basevalue;
            }

            var value = (string)basevalue;
            instance.Coerce_MyProperty (ref value);

            return value;
        }
        public static readonly DependencyProperty MyOtherPropertyProperty = DependencyProperty.Register (
            "MyOtherProperty",
            typeof (string),
            typeof (MyOtherClass),
            new FrameworkPropertyMetadata (
                default (string),
                FrameworkPropertyMetadataOptions.None,
                Changed_MyOtherProperty,
                Coerce_MyOtherProperty
            ));

        static void Changed_MyOtherProperty (DependencyObject dependencyObject, DependencyPropertyChangedEventArgs eventArgs)
        {
            var instance = dependencyObject as MyOtherClass;
            if (instance != null)
            {
                var oldValue = (string)eventArgs.OldValue;
                var newValue = (string)eventArgs.NewValue;
                instance.Changed_MyOtherProperty (oldValue, newValue);
            }
        }

        static object Coerce_MyOtherProperty (DependencyObject dependencyObject, object basevalue)
        {
            var instance = dependencyObject as MyOtherClass;
            if (instance == null)
            {
                return basevalue;
            }

            var value = (string)basevalue;
            instance.Coerce_MyOtherProperty (ref value);

            return value;
        }
        #endregion

        // --------------------------------------------------------------------
        MyOtherClass ()
        {
            CoerceAllProperties ();
            Constructed_MyOtherClass ();
        }
        // --------------------------------------------------------------------
        partial Constructed_MyOtherClass ();
        // --------------------------------------------------------------------
        void CoerceAllProperties ()
        {
            CoerceValue (MyPropertyProperty);
            CoerceValue (MyOtherPropertyProperty);
        }
        // --------------------------------------------------------------------

        // --------------------------------------------------------------------
        // Properties
        // --------------------------------------------------------------------

        // --------------------------------------------------------------------
        // Property MyProperty
        // --------------------------------------------------------------------
        public string MyProperty
        {
            get
            {
                return (string)GetValue (MyPropertyProperty);
            }
            set
            {
                if (MyProperty != value)
                {
                    SetValue (MyPropertyProperty, value);
                }
            }
        }
        // --------------------------------------------------------------------
        partial void Changed_MyProperty (string oldValue, string newValue);
        partial void Coerce_MyProperty (ref string coercedValue);
        // --------------------------------------------------------------------

        // --------------------------------------------------------------------
        // Property MyOtherProperty
        // --------------------------------------------------------------------
        public string MyOtherProperty
        {
            get
            {
                return (string)GetValue (MyOtherPropertyProperty);
            }
            set
            {
                if (MyOtherProperty != value)
                {
                    SetValue (MyOtherPropertyProperty, value);
                }
            }
        }
        // --------------------------------------------------------------------
        partial void Changed_MyOtherProperty (string oldValue, string newValue);
        partial void Coerce_MyOtherProperty (ref string coercedValue);
        // --------------------------------------------------------------------

    }

}

