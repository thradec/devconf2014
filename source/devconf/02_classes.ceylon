/*
 
 Every value is an instance of a class. The
 simplest classes just package together some
 related state into attributes.
 
 Classes have members:
     - parameters,
     - methods (member functions),
     - attributes (member values), and
     - member classes/interfaces
 
 Any member annotated shared forms part of the 
 API of the class and may be accessed from 
 outside the class.
 
 For simple classes, we usually need to refine
 members string, equals(), and hash that are
 inherited from the default supertype Basic.
 
 A member annotated actual refines a member of
 a supertype of the class.
 
*/

shared class Time(hour, minute) {
    
    assert(0 <= hour <= 23,
           0 <= minute <= 59);
    
    shared Integer hour;
    shared Integer minute;
    
    shared Integer secondsSinceMidnight => 
            hour*60*60 + minute*60;
    
    shared actual Integer hash => 
            secondsSinceMidnight;
    
    shared actual Boolean equals(Object that) {
        // the "is Time" construct tests and narrows the type of a value
        if (is Time that) {
            return secondsSinceMidnight == that.secondsSinceMidnight;
        }
        else {
            return false;
        }
    }
    
    // if writing "shared actual Type" gets too boring, you can use this shortcut syntax 
    string => "``hour``:``minute``";
    
}

void testTime() {
    Time t1 = Time(8, 30);
    Time t2 = Time(10, 15);
    
    print(t1);
    print(t2);
    print(t1==t2);
}




/*
 
 An anonymous class declaration defines an instance. 
 It's a combination value and class declaration.
 
 */

object midnight extends Time(0, 0) {
    // TODO: uncomment and fix the error
    // string => "midnight";
}