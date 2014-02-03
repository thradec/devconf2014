/*
 
 A program is just a toplevel function with no parameters. 
 To run the program, select the function name and go to: 
 
     Run > Run As > Ceylon Java Application
 
*/

void run() {
    print("Hello DevConf!");
}




/*
 
 A parameter may have a default value.
 
*/

String greeting(String name = "World") {
    // interpolated expressions are enclosed in double-backticks within a string
    return "Hello, ``name``!";
}




/*
 
 When a function just returns an expression,
 we can abbreviate it using a fat arrow. 
 
*/

void helloWorld() => print(greeting());

void helloCeylon() => print(greeting("Ceylon"));





/*
 
 A parameter may be variadic, meaning it accepts multiple values.
 
*/

Integer sum(Integer* numbers) {
    variable value sum = 0; // assignable values must be annotated variable
    for (n in numbers) {
        sum += n;
    }
    return sum;
}

void calculateSums() {
    // the sum of no numbers
    print(sum());
    
    // the sum of three numbers
    print(sum(1, 2, 3));
    
    // the sum of all the numbers from 0 to 10 inclusive,
    // using the range operator .. and the spread operator *
    print(sum(*(0..10)));
    
    // just to whet your appetite, 
    // the sum of all the square numbers from 0 to 100!
    print(sum(for (n in 0..100) n^2));
}




/*

 A value may be a constant (within a certain scope), a variable, or a getter.
 
*/

// a toplevel constant
Integer zero = 0; 

// a variable with initial value
variable Integer number = zero;

// a getter defined using a fat arrow
Integer numberSquared => number^2;

// a getter defined using a block
Integer numberFactorial {
    variable value f = 1;
    for (i in 1..number) {
        f *= i;
    }
    return f;
}




/*
 
 Documentations...
 
*/

doc("Documentation annotations are processed by `ceylon doc` tool.
     For formating is used markdown syntax.
     Since the doc annotation is ubiquitous, its name and parentheses may be left out.")
by("Tomas")
deprecated("Well, this is not a very useful program. Try [[helloCeylon]] instead.")
throws(`class Exception`)
see(`function helloWorld`)
void ouch() {
    throw Exception("ouch!");
}




/*
 
 TODO:
 
 Write a program that prints out all the prime numbers between 1 and 100. 
 Remember to properly document your work!
 
*/