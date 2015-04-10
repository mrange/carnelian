carnelian - a ruby code generator tool
======================================

"Become what you are... a meta programmer"

Carnelian is inspired by T4 (http://en.wikipedia.org/wiki/Text_Template_Transformation_Toolkit)

Carnelian wants to be
  1. Simple
  2. Agnostic
  3. Powerful
  4. Lightweight
  5. Free

By simple we mean that Carnelian should be understandable by almost anyone.

By agnostic we mean that Carnelian should be able to generate code for any text-based

By powerful we mean that Carnelian should be able to solve a big class of problems

By lightweight we mean that Carnelian should be able to execute from the command-line without the need of an IDE

By free we mean that Carnelian should be free to use and abuse with no strings attached

Using Carnelian
---------------

Carnelian is a ruby gem that requires ruby/1.9.3+
```
gem install --user carnelian
```

A silly example
----------------

Create a file named `silly.mp` containing:
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
Then create a file named `run.rb` containing:
```
require 'carnelian/executor'

CarnelianExecutor.execute_metaprogram_to_file "simple.mp"
```

Execute the carnelian meta program by executing in a shell `ruby run.rb`

This will produce a file named `silly.cs` containing
```
class SomeClass
{
    public int X0 {get; set; }
    public int X1 {get; set; }
    public int X2 {get; set; }
    public int X3 {get; set; }
    public int X4 {get; set; }
    public int X5 {get; set; }
    public int X6 {get; set; }
    public int X7 {get; set; }
    public int X8 {get; set; }
    public int X9 {get; set; }
    public int X10 {get; set; }
}
```

Although simple silly as Carnelian is based on ruby it can generate code from XML, Database schemas, JSON giving the user power and flexibility.

We have used T4 and Carnelian to generate: TSQL, C#, C++, Java, XML

For more interesting samples see: https://github.com/mrange/carnelian/tree/master/src/samples/csharp
