@@@ metaprogram
@@@ extension cout
@@@ include testcase_dependency.mp
@@@ require ostruct
@@@ inject_tokens @@= =@@

// Boolean values should be properly injected
// Lines starting with inject token are ok
@@=false=@@@@=true=@@

// Lines starting with double @@
\@@  @@="Testing"=@@
\@@+  @@="Testing"=@@
\@@-  @@="Testing"=@@
\@@>  @@="Testing"=@@

// Simple ruby expression tests
@@> for iter in 0..10
@@>     if iter % 2 == 0 then
    // This \n is 'a' test @@=iter=@@ of injects
    // This is a test of nothing special
    // This is a test @@=iter=@@ of two injects @@=HelperMethod "world"=@@
@@>     end
@@> end

@@> WriteSomething document,3

// A helper method
@@+ # embedded comment
@@+ def HelperMethod (input)
@@+     "Hello %s" % input
@@+ end

@@+ def WriteSomething(document, sz)
@@+     for iter in 0..sz
@@- // Something @@=iter=@@
@@+     end
@@+ end