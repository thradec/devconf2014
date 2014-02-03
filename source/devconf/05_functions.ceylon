/*
 
 Terminology:
 
 First class function 
 - support means the ability to treat a function 
   as a value, assigning it to variables, 
   and passing it as an argument

 A higher order function
 - is a function that accepts other functions 
   as arguments, or returns another function
 
*/

/*
 
 What is the type of the function?
 
 We need a way to encode the return type and 
 parameter types of a function into the type system.
 
 In Ceylon, a single type Callable abstracts all functions.
 
*/

Callable<String, [String]> greetingRef = greeting;

// function returning void
Callable<Anything, []> runRef = run;

// function with variadic parameter
Callable<Integer, [Integer*]> sumRef = sum;




/*
 
 We can abbreviate Callable types 
 with a little syntax sugar: 
 
*/

String(String) greetingRef2 = greeting;

Anything() runRef2 = run;

Integer(Integer*) sumRef2 = sum;




/*
 
 Given a value with a function type, we can do
 almost everything we can do with the actual
 function.
 
 */

void demoFunctionRefs() {
    
    runRef();
    
    print(greetingRef("function reference"));
    
    print(sumRef(1, 2, 3));
    
}




/*
 
 It's even possible to write an "anonymous"
 function, inline, within an expression.
 
*/

Anything(String) printHeader = (String s) => print("<h1>``s``</h1>");




/*
 
 We've now started to see some pretty 
 complicated types. To make it easier to deal
 with types like these, we can give them names.
 
 */

alias Predicate<T> => Boolean(T);

void demoPredicates() {
    Predicate<String> lengthLessThan255 = (String s) => s.size < 255;
    Predicate<String> lowercaseOnly = (String s) => s == s.lowercased;
    
    assert(lengthLessThan255("foo"));
    assert(lowercaseOnly("bar"));
}