import ceylon.html { ... }


/*
 
 When a function has many parameters, it's
 better to list its arguments by name. Named
 argument lists are enclosed in braces, and
 individual arguments are separated by 
 semicolons.
 
*/

void namedArgLists() {
    value i1 = parseInteger { string = "1000101"; radix = 2; };
    value i2 = parseInteger { radix = 16; string = "1000101"; };
}




/*
 
 Even within a named argument list, we're 
 allowed to list the first arguments 
 positionally. (The reason for this will 
 become clear below.)
 
 */

void namedArgListsWithPositionalArgs() {
    value i1 = parseInteger { "1000101"; radix = 2; };
    value i2 = parseInteger { "1000101"; 16; };
}



/*
 
 At the end of a named argument list, we may
 list additional arguments, separated by
 commas, which are interpreted as arguments
 to the first parameter of type Iterable
 which does not already have an argument.
 
 This is the usual syntax we use for 
 instantiating container types with an 
 initially fixed list of elements.
 
 */

void namedArgListsWithIterableArgs() {
    value hello = String { 'H', 'e', 'l', 'l', 'o' };
    value set = LazySet { 0, 1, -1 };
}




/*
 
 All this seems like a lot of new syntax! But
 there's a deeper purpose behind it: named 
 argument lists provide us with a very
 flexible syntax for defining tree-like 
 structures. This has many applications, from
 build scripts to user interfaces.
 
*/

/*

 The platform module ceylon.html is a library 
 for writing HTML templates in Ceylon. A fragment 
 of static HTML looks something like this. 
 
*/

Html page = Html {
    doctype = html5;
    Head {
        title = "Ceylon: home page";
        Link {
            rel = stylesheet;
            type = css;
            href = "/styles/screen.css";
            id = "stylesheet";
        }
    };
    Body {
        H2 ( "Welcome to Ceylon ``language.version``!" ),
        P ( "Now get your code on :)" )
    };
};

void renderPage() {
    print(page.string);
}
