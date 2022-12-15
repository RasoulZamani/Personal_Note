## singlton by decorator:

def singleton(class_):
    instances = {}
    def get_instance(*args, **kwargs):
        if class_ not in instances:
            instances[class_] = class_(*args, **kwargs)
        return instances[class_]
    return get_instance

@singleton
class Database:
    def __init__(self):
        print('Loading database')


## singlton by metaclass:

class Singleton(type):
    """ Metaclass that creates a Singleton base type when called. """
    _instances = {}
    def __call__(cls, *args, **kwargs):
        if cls not in cls._instances:
            cls._instances[cls] = super(Singleton, cls)\
                .__call__(*args, **kwargs)
        return cls._instances[cls]

class Database(metaclass=Singleton):
    def __init__(self):
        print('Loading database')


## monostate
#monostate is a variation of singleton that you put all state of object in static var.
# people can create new obj by altering this var.
# it is not recomended 

class Monostate:
    _shared_state = {}

    def __new__(cls, *args, **kwargs):
        obj = super(Monostate, cls).__new__(cls, *args, **kwargs)
        obj.__dict__ = cls._shared_state
        return obj


class MyCls(Monostate):
    pass #....
