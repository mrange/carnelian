@@@ metaprogram
@@@ extension cout
@@@ include testcase_dependency.mp
@@@ require ostruct
@@@ inject_tokens @@= =@@

// Whitespace lines should be preserved




@@> for iter in 0..10
@@>     if iter % 2 == 0 then
    // This \n is 'a' test @@=iter=@@ of injects
    // This is a test of nothing special
    // This is a test @@=iter=@@ of two injects @@=iter=@@
@@>     end
@@> end

\@@ testing @@="Gargle"=@@

@@+ def HelperMethodX (x)
@@+     HelperMethodY (x)
@@+     puts "HelperX"
@@+ end