````@eval
using Markdown
Markdown.parse("""
$(read("../../README.md",String))
""")
````
## Copyright information

This is the copyright information of the original Triangle code.

```
These programs may be freely redistributed under the condition that the
copyright notices (including the copy of this notice in the code comments
and the copyright notice printed when the `-h' switch is selected) are
not removed, and no compensation is received.  Private, research, and
institutional use is free.  You may distribute modified versions of this
code UNDER THE CONDITION THAT THIS CODE AND ANY MODIFICATIONS MADE TO IT
IN THE SAME FILE REMAIN UNDER COPYRIGHT OF THE ORIGINAL AUTHOR, BOTH
SOURCE AND OBJECT CODE ARE MADE FREELY AVAILABLE WITHOUT CHARGE, AND
CLEAR NOTICE IS GIVEN OF THE MODIFICATIONS.  Distribution of this code as
part of a commercial system is permissible ONLY BY DIRECT ARRANGEMENT
WITH THE AUTHOR.  (If you are not directly supplying this code to a
customer, and you are instead telling them how they can obtain it for
free, then you are not required to make any arrangement with me.)
```

## [`triangle -h` output](triangle-h.md)




## Structures and methods

Significant parts of the documentation text has been taken from the documentation
of Triangle.

```@autodocs
Modules = [Triangulate]
Pages = [ "triangulateio.jl", "plot.jl"]
```
