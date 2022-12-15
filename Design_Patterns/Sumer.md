# Design Pattern
## Content
My note and implemented codes of **Design Pattern** course

## Course Information
Name: Udemy - Design Patterns in Python 2020-2
creator: Dimitry
Note: unfortunatly it course used python 2.7
************************************************************

# Introduction
  ## Definition
Design patter is **common architectural approach**
- Gang of Four book(1994) in C++
- some of them internalized in language like decorators
- there is some library for creating them
- some times you used them without know name!

## main categories
- creational
- structural
- behavioral

![design pattern category](pics/category.png)

********
# SOLID design principle
introduced by Robert C Martin (uncle Bob!)

## SRP or SOC
Single Response Principle or Seperation of Conserrns
don't overload your object with too many responsibility
it's anti pattern is God obj! contains every things!
the class shoould only have one reason to change!

## OCP
Open Closed Principle
open for extention, closed for modification
for example you can use Specification pattern for this principle

## LSP
Liskov Substitution Principle
interfsce of base class should work corectly in derived class

## ISP
Interface Segregation Principle
use simple interface and seperate diferent functionality.
e.g: instead of creating general class with many method,
for each functionality create seperate class and use them in desired combination
YAGNI: You Aint Going to Need It (so dont implement it!)

## DIP
Dependency Inversion Principle
high level module should not depond on low level (implemented) modules
instead, they can depond on  abstractions (interfaces)
because for example maybe you want change data storage mecanism in low level module,
it can break code if this principle not obeyed

**************************************************************
# Gamma Categorization
(names after Erick Gamma one of GoF authers)
## 1. Creational Patterns
 explicit (constructor) vs. implicit(DI, Reflection)
 wholesale(singke statement) vs. piecewise(step by step)

## 2. Structural Patterns
 wrapper
 good API

## 3. Behavioral Patterns 
 no centeral theme!

**************************************************************
# Builder
when construction gets bit too complicated (say you need 10 initial value)
So, builder provides an API for constructing an object step by step for e.g: [Builder for html page](implementations/builder.py)
Hint: to make a fluent builder (i.e use different methods on obj by dot) just use: `return self`
sometimes builder is complicated, so you can use two or more builder, for e.g.: [two Builder and Base Builder](implementations/builder-facets.py)
for Open/close principle, we can use multiple chain like inheritance like this: [inheritanced builders](implementations/builder-inheritance.py)

**************************************************************
# Factories
when obj creation logic is too convluted
also for solving " __init__ is not descreiptive ( its name is not informative)" we can use Factory 
and handling of optional and default value is hard 
Unlike Builder, Factory is wholesale (not picewise) obj creation 
it can be factory mathod, class or abstraction

## factory method
e.g: create points in different cordinates:
```
class Point():
  def __init__(self, x, y)
    self.x = x
    self.y = y

  @staticmethod
  def new_cartesian_point(x, y):
      return Point(x, y)

  @staticmethod
  def new_polar_point(rho, theta):
      return Point(rho * sin(theta), rho * cos(theta))
```
as you see, Open/close satisified, names are informative and whenever you want, you can add another cordinate to initializer

## factory class
based on Single Responsibility, we can gather all factory method in one class. Also you can make it inner class(by one tab!) of main class, or change static method by class method.

## factory abstraction
when you have a hierarchey of types, you can have a corrosponding hierarchey of factories by abs. you can see e.g in [abs-factory](implementations/abstract-factory.py)

Hint: **eval** can be used for evaluate. e.g: `my_obj = eval("StringNameOfClass")()
Hint2: __str__ can be used for define optput of print for class obj.`

**************************************************************
# Prototype
prototype = an existing (partially or fully constructed) designed obj 
we can simply copy (clone) it! (but by `new_obj = copy.deepcopy(obj)`) and then customize it.Making cloning convenient(e.g factory) is an option too.

Hint: when we say `a=b` reference asignment happens and if a changes, b will change too. instead we should use copy.copy (for shallow) or copy.deepcopy()

**************************************************************
# Singlton
instantiate only once 
why? -> maby init is expensive or you wnat protect code from aditional copies or lazy inits
(some people love to hate it!! even GoF authers said it was close to drop out Singlton from design patterns!)
there is some implementtion for it. decorator, metaclass(recomended) or monostate. you can see them in [singlton](implementations/singlton.py) 

**************************************************************
# Adapter
A construct witch adapts existing interface to conform to the required interface. 
it is an in-between componet. like electric adapter

adaptor create many temporary objects, for avoiding duplicate coputions, you can use cashe. see [adaptor_with_cache](implementations/adaptor_with_cache.py)

**************************************************************
# Bridge
- conecting component through abstraction
how? simply by providing one hierarchy as an argument to init of another
- prevent cartesian product explosion! i.e: 
assume you have two kind of drawing and two shapes,
do you want reate 4 IF? if shapes go to 5, 10 IF?
- decouples an interface/abstraction (hierarchy) from an implementation (hierarchy). strong form of encapsulation.
- unfortunatly it violates Open/close principle!
you can see example of Bridge in [bridge](implementations/bridge.py)

**************************************************************
# Composite
treat individual (single/scalar) and agregate (group/composition) of obj's in uniform fasion (identical IF)
Hint: for converting scalar output to iterable obj so that you can use `for i in obj: ...` just add this to its class:
```
def __iter__(self):
   yield self
```
example in neural net: [composite](implementations/composite_NN.py)

**************************************************************
# decorator
adding behaviour without altering and inherite class
when you want augment an obj for more functionality, and also you want take care of OpenClose and Single Res principles, usually you have two options: inherit class, decorator

you can see e.g in [functional decorator](implementations/functional-decorators.py)

**************************************************************
# Fasade
provide a simple easy to undrestand/use interface (API) over a complicated code.

**************************************************************
# Flyweight
space optimization technique ,use less memory by storing externally the data asociated(by index or pointer) with simillar data

**************************************************************
# Proxy
a class which functions as an interface to a particular resource and that resource can be remote, expensive to construct or it may require logging or some other added functionality
the way that the proxy adds it is such that your interface is typically unchanged.

proxy provides identical inteface but decorator enhanced IF.

we have different type of proxy:comminucation, logging, cache , ... for example you can see [virtual proxy](implementations/virtual-proxy.py)

**************************************************************
# Chain of Responsibility
sequence of handlers processing an event one after another

Chain of Responsibility method is Behavioral design pattern and it is the object-oriented version of if … elif … elif … else and make us capable to rearrange the condition-action blocks dynamically at the run-time. It allows us to pass the requests along the chain of handlers. The processing is simple, whenever any handler received the request it has two choices either to process it or pass it to the next handler in the chain. 
This pattern aims to decouple the senders of a request from its receivers by allowing the request to move through chained receivers until it is handled. 

## CQS
command = asking for an action/change like set val
query   = asking for information like get val
cqs     = having seperate means of sending command and query

you can see eg of broker event chain in [chainOfResponsibility](implementations/chain_of_resp.py)

**************************************************************
# Command
when you want to obj represent an operatipn.
e.g: having log of account
used in: GUI, undo/redo, macro recording 
implementation: [command_acount](implementations/command.py)

**************************************************************
# Interpreter
 - behavioral design pattern. 
 - used to defines a grammatical representation for a language

lexer make tokens from input
parser evaluate tokens

eg: undrestanding "2+1" and returning 3

**************************************************************
# Iterator
An obj that facilitate traversal of a data structure
iterator protocol requires:
- __iter__()
- __next__()
- StopIteration

**************************************************************
# Mediator
mediator is a component which facilitates communication between other components without them necessarily being aware of each other or having any kind of references to one another.

create Mediator and have each obj refer to it
mediator hav funcs that component can call and vice versa (bidirectional comminucation)

eg: [chat room](implementations/meditor_chatroom.py)
also it can use events implementation

**************************************************************
# Memento
memento itself is a token or some sort of handle class for representing the system state at a particular point in time.
it lets us roll back to the state when the token was actually generated.
Now the token typically does not expose the actual state information but in some cases it might.

**************************************************************
# Observer
- one of most common D.P.
- we need to be informed when sth happen and maybe do wth based on it.
- we want to listen to events, and unsubscribe from it if we're no longer intrested 
- Observer is the object that wishes to be informed about something else happening in the system
- the entity which actually generates those events which we want to observe is typically called an observable.
  
## Events
list of function witch need to be invoked when event happen.
we call subscribers in list:
```
class Event(list):
    def __call__(self, *args, **kwargs):
        for item in self:
            item(*args, **kwargs)
```
eg: [observer - events](implementations/observer_events.py)

**************************************************************
# State
So these state design pattern is basically a pattern where the object's behavior is determined by its state
an object can also transition from one state to another and something needs to trigger that transition.
formalized construct which actually manages state and transitions from one state to another is called a state machine.

eg: [state  machine for tel](implementations/state_tel.py)

**************************************************************
# Strategy
strategy design pattern is all about decomposing Those two parts: low level (more specified detailes) and high level ( can be reused for another loww level)

enables the exact behavior of a system to be selected at runtime (at runtime you specify the actual details)

**************************************************************
# Template
A high level blue print for alghorithm to be complited by inheritance 
it is very simillar to strategy D.P.

**************************************************************
# Visitor
allows to adding  extra behaviors to entire hierarchies of classes.
when we need to define a new ope on an entire class hierarchy without modifying every class
visitor knows how to traverse a data structure composed of (possibly realted) types
