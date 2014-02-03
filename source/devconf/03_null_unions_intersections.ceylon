/*
 
 A union type represents a choice between types. 
 A union type is written A|B for any types A and B.
 
*/

void printDouble(String|Integer|Float val) {
    String|Integer|Float double;
    switch(val)
        case(is String) { double = val+val; }
        case(is Integer) { double = 2*val; }
        case(is Float) { double = 2.0*val; }
    print("double ``val`` is ``double``");
}

void testPrintDouble() {
    printDouble("hello");
    printDouble(111);
    printDouble(0.111);
}




/*
 
 We deal with missing or "null" values using
 union types. The class Null has a single 
 instance named null, which represents a 
 missing value. 
 
 Therefore, a possibly-null string is represented 
 by the type String|Null and we can use special 
 syntactic abbreviation String?.
 
*/

void helloArguments() {
    String? name = process.arguments[0];
    if (is String name) {
        print("Hello " + name);
    }
    else {
        print("Hello World");
    }
}

/*
 
 We usually use the "exists" operator instead
 of "is String" in code like this. Change the
 program above to use exists. More syntactic
 sugar!
 
 HINT
 1. use exists operator
 2. use exists operator with declaring new value
 3. use else operator
 
*/




/*
 
 An intersection represents the combination of
 two types. An intersection type is written 
 A&B for any types A and B.
 
 Intersection types often arise as a result of
 type narrowing.
 
 Note: the syntax {T*} means an iterable 
 sequence of values of type T. It's syntactic
 sugar for the interface Iterable.
 
*/

T? getThirdItem<T>({T*} iterable) {
    if (is Correspondence<Integer, T> iterable) {
        // hover over iterable to see its narrowed type within this block!
        return iterable[2];
    }
    else {
        value iterator = iterable.iterator();
        iterator.next();
        iterator.next();
        if (is T third = iterator.next()) {
            return third;
        }
        else {
            return null;
        }
    }
}

void testThird() {
    assert(exists thrd = getThirdItem("12345"), 
           thrd =='3');
}




/*
 
 The special type Nothing is the "bottom" type, a type with no instances.
 The special type Nothing represents:
     - the intersection of all types, or, equivalently
     - the empty set
 Nothing is assignable to all other types.

  
 Examples how typechecker works:
 
     Integer&Object = Integer
 
     Integer&String = Nothing
 
     String|Nothing = String
 
     String? = String|Null
 
     <String?>&Object = <String|Null>&Object = <String&Object>|<Null&Object> = String|Nothing = String 
 
*/

/*
 
 The useful coalesce() function also demonstrates a 
 nice application of intersection.
 
*/

void demoCoalesce() {
    value stringsAndNulls = {"hello", null, "world", null};
    
    value strings = coalesce(stringsAndNulls);
    
    assert(strings.sequence == {"hello", "world"});
}

/*
 
 There's a special trick we can do with union
 types that help us give functions like max()
 and min() the correct type.
 
 The problem is that when we have "zero or 
 more things", max() can return null. But when 
 we have "one or more" things, it can't. And 
 when we have exactly zero things, max() 
 always returns null. How can we capture this
 within the type system?
 
 */

void demoMax() {
    Null max1 = max({});
    
    {Integer+} oneOrMore = {1, 2};
    Integer max2 = max(oneOrMore);
    
    {Integer*} zeroOrMore = {1, 2};
    Integer? max3 = max(zeroOrMore);
}




/*
 
 TODO:
 
 Check out the definitions of coalesce() or max() function
 and figure out how this works!
 
 The solution involves Nothing ;-)
 
*/