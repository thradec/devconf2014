import ceylon.language.meta.model { ... }
import ceylon.language.meta.declaration { ... }


/*
 
 A little bit of terminology:
 
 A _declaration_ is the definition of a Ceylon construct, 
 such as a module, package, value, function or class.
 Declarations are singletons, there is only a single 
 instance of a given class declaration.  You can inspect declarations 
 to get information about how they were defined by their author.
 
 A _model_ is a Ceylon definition that represents a 
 declaration where all the type variables have been bound 
 to closed type values. You can query models for their 
 member models and you can directly invoke models.
 
 A _closed type_ is a type which does not 
 contain any unbound type variables.
 
 An _open type_ is a type which may contain 
 unbound type variables.
 
*/

void declarationLiterals() {
    
    value m = `module devconf`;
    
    value p = `package devconf`;
    
    value f = `function helloWorld`;
    
    value v = `value zero`;
    
    value c = `class Time`;
    
    value a = `value Time.minute`;
    
}

void modelLiterals() {
    
    value m1 = `helloWorld`;
    
    value m2 = `plus<Integer>`;
    
    value v = `zero`;
    
    value c = `Time`;
    
    value a = `Time.minute`;
    
}




/*
 
 Annotations
 
 An annotation is a toplevel function that returns 
 a subtype of Annotation. We call the function 
 an annotation constructor.
 
 */

shared annotation TestAnnotation test() => TestAnnotation();

shared annotation final class TestAnnotation() 
        satisfies OptionalAnnotation<TestAnnotation, FunctionDeclaration> {
}


test
void shouldTestSomething() {
    print("testing...");
}


void runTests() {
    value tests = `package devconf`.annotatedMembers<FunctionDeclaration, TestAnnotation>();
    for(test in tests) {
        test.invoke();
    }
}




/*
 
 TODO:
 
 Write a program that prints out all toplevel functions 
 inside ceylon.language package, which are annotated 
 with documentation annotation throws().
 
*/