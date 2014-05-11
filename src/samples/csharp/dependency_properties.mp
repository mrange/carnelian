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
    using System.Collections;
    using System.Collections.ObjectModel;
    using System.Collections.Specialized;


    using System.Windows;
    using System.Windows.Media;

@@> for cls in $classes

    // ------------------------------------------------------------------------
    // @@=cls.get :name=@@
    // ------------------------------------------------------------------------
    partial class @@=cls.get :name=@@
    {
        #region Uninteresting generated code
@@>     for prop in cls.get :properties, []
        public static readonly DependencyProperty @@=prop.get :name=@@Property = DependencyProperty.Register (
            "@@=prop.get :name=@@",
            typeof (@@=prop.get :type=@@),
            typeof (@@=cls.get :name=@@),
            new FrameworkPropertyMetadata (
                @@=prop.get :default_value, ("default (%s)" % prop.get(:type))=@@,
                FrameworkPropertyMetadataOptions.None,
                Changed_@@=prop.get :name=@@,
                Coerce_@@=prop.get :name=@@
            ));

        static void Changed_@@=prop.get :name=@@ (DependencyObject dependencyObject, DependencyPropertyChangedEventArgs eventArgs)
        {
            var instance = dependencyObject as @@=cls.get :name=@@;
            if (instance != null)
            {
                var oldValue = (@@=prop.get :type=@@)eventArgs.OldValue;
                var newValue = (@@=prop.get :type=@@)eventArgs.NewValue;
                instance.Changed_@@=prop.get :name=@@ (oldValue, newValue);
            }
        }

        static object Coerce_@@=prop.get :name=@@ (DependencyObject dependencyObject, object basevalue)
        {
            var instance = dependencyObject as @@=cls.get :name=@@;
            if (instance == null)
            {
                return basevalue;
            }

            var value = (@@=prop.get :type=@@)basevalue;
            instance.Coerce_@@=prop.get :name=@@ (ref value);

            return value;
        }
@@>     end
        #endregion

        // --------------------------------------------------------------------
        @@=cls.get :name=@@ ()
        {
            CoerceAllProperties ();
            Constructed_@@=cls.get :name=@@ ();
        }
        // --------------------------------------------------------------------
        partial Constructed_@@=cls.get :name=@@ ();
        // --------------------------------------------------------------------
        void CoerceAllProperties ()
        {
@@>     for prop in cls.get :properties, []
            CoerceValue (@@=prop.get :name=@@Property);
@@>     end
        }
        // --------------------------------------------------------------------

        // --------------------------------------------------------------------
        // Properties
        // --------------------------------------------------------------------

@@>     for prop in cls.get :properties, []
        // --------------------------------------------------------------------
        // Property @@=prop.get :name=@@
        // --------------------------------------------------------------------
        public @@=prop.get :type=@@ @@=prop.get :name=@@
        {
            get
            {
                return (@@=prop.get :type=@@)GetValue (@@=prop.get :name=@@Property);
            }
            set
            {
                if (@@=prop.get :name=@@ != value)
                {
                    SetValue (@@=prop.get :name=@@Property, value);
                }
            }
        }
        // --------------------------------------------------------------------
        partial void Changed_@@=prop.get :name=@@ (@@=prop.get :type=@@ oldValue, @@=prop.get :type=@@ newValue);
        partial void Coerce_@@=prop.get :name=@@ (ref @@=prop.get :type=@@ coercedValue);
        // --------------------------------------------------------------------

@@>     end
    }

@@> end
}

@@+ class Hash
@@+     def get (key, defaultValue=nil)
@@+         value = self[key]
@@+         return value unless value == nil
@@+         return defaultValue || ("KEY_'%s'_NOT_FOUND" % key.to_s)
@@+     end
@@+ end

