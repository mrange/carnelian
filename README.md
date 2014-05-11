carnelian - a ruby code generator tool
======================================

The most transformative event for me as developer was when
I got introduced to T4 in Visual Studio.

T4 is a simple, inelegant and yet extremely powerful code-generation
in Visual Studio. Basically...

T4 is ASP/PHP for code
----------------------

I no longer do professional development in Visual Studio, I find the
only thing I truly miss from VS stack is T4.

carnelian is like T4 but in ruby
--------------------------------

```
@@@ metaprogram
@@@ extension cs
class SomeClass
{
@@> for iter in 0..10
    public int X@@=iter=@@ {get; set; }
@@> end
}
```

Line by line:

1. ```@@@ metaprogram```
   * A preprocessor tag setting the output extension to cs (C#)
2. ```class SomeClass```
   * This line is injected into the output file
4. ```{```
   * This line is injected into the output file
5. ```@@> for iter in 0..10```
   * Template ruby code repeating the text in the loop 10 times
6. ```public int X@@=iter=@@ {get; set; }```
   * Text to be repeated, @@=iter=@@ injects the iter variable into the output text
7. ```@@> end```
   * Ends the loop
8. ```}```
   * This line is injected into the output file

This example covers 90% what there is to know about T4 and carnelian.

It's so simple that it's hard to see the use.
However, I have used T4 generate lots and lots of text-artifacts, saving myself from going insane.

For instance:

1. SQL
2. C#
3. C++
4. XML
5. C
