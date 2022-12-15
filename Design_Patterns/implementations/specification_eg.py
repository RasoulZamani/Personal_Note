""" example for Specification pattern
for Open Closed Principle
"""

from enum import Enum

class Color(Enum):
    RED   = 1
    BLUE  = 2
    GREEN = 3


class Size(Enum):
    SMALL  = 1
    MEDUIM = 2
    LARGE  = 3


class Product():
    def __init__(self, name, color, size):
        self.name  = name
        self.color = color
        self.size  = size


class Specification():
    def is_saticified(item):
        pass # will be overwritten
    def __and__(self, other):
       return AndSpec(self, other) 
        
class Filter():
    def filter(self, items, spec):
        pass # will be overwritten


class ColorSpec(Specification):
    def __init__(self, color):
        self.color = color
    
    def is_saticified(self, item):
        return self.color == item.color


class SizeSpec(Specification):
    def __init__(self, size):
        self.size = size
    
    def is_saticified(self, item):
        return self.size == item.size


class AndSpec(Specification):
    def __init__(self, *args):
        self.args = args
        
    def is_saticified(self, item):
        return all( map(
            lambda spec: spec.is_saticified(item), self.args
        ))

class BetterFilter(Filter):
    def filter(self, items , spec):
        for item in items:
            if spec.is_saticified(item):
                yield item   

# ____________________________________________________________
if __name__ == "__main__" :
    apple = Product('APPLE', Color.RED, Size.SMALL)
    tree  = Product('TREE', Color.GREEN, Size.LARGE)    
    house = Product('HOUSE', Color.BLUE, Size.LARGE)
    products = [apple, tree, house]
    
    green = ColorSpec(Color.GREEN)
    small = SizeSpec(Size.SMALL)
    large_blue = ColorSpec(Color.BLUE) & SizeSpec(Size.LARGE)
    bf = BetterFilter()
    
    for p in bf.filter(products, green):
        print(f" - {p.name} is green ")
    
    for p in bf.filter(products, small):
        print(f" - {p.name} is small")
        
    for p in bf.filter(products, large_blue):
        print(f" - {p.name} is large and blue")
        
    
