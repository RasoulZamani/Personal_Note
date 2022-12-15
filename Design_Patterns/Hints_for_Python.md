# Hints for Python

In this document I review some hints for programming by python that wwas used in this course and maybe junior programmer has no idea about them!

-  **eval** can be used for evaluate. e.g: `my_obj = eval("StringNameOfClass")()
-  __str__ can be used for define optput of print for class obj.`

- when we say `a=b` reference asignment happens and if a changes, b will change too. instead we should use copy.copy (for shallow) or copy.deepcopy()

- when you need class that returns list, you can inherits from list and then no need for return! each instance will be a list. for e.g.:
```
class ListOfSth(list):
  def __init__(self,n):
    super().__init__()
    for i in range(n):
      self.append(i)
```


## super()
The super() function returns an object that represents the parent class.

The super() function is used to give access to methods and properties of a parent or sibling class.
e.g:
```
class Square(Rectangle):
    def __init__(self, length):
        super().__init__(length, length)
```
super() can also take two parameters: subclass, an object that is an instance of that subclass. e.g : `super(Square, self).__init__(length, length)`


## metaclass
A metaclass is a class whose instances are classes.
**type** is a default metaclass for classes and controls creation of classes.you can use it directly by declaring name of class, tuple of parents and dict of atributes :
`MyClass = type('MyClass', (object,), {})`

 The **__call__** method enables Python programmers to write classes where the instances behave like functions and can be called like a function. object() is shorthand for object.__call__(). for creation of class this method invokes, __call__ use two other methods: __new__ (for creation new instance of class) and __init__ (for initialization)

## iterable obj
for converting scalar output to iterable obj so that you can use `for i in obj: ...` just add this to its class:
```
def __iter__(self):
   yield self
```
