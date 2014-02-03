/*
 
 A tuple is a linked list which 
 captures the static type of each 
 individual element in the list. 
 
*/

void demoTuple() {
    
    value nameAgeWeight = ["John", 28, 80.5];
    
    value name = nameAgeWeight[0];
    value age = nameAgeWeight[1];
    value weight = nameAgeWeight[2];
    value rest = nameAgeWeight[3];
    
}




/*
 
 How it works?
 
 A tuple is a linked list where each link in the 
 list encodes the static type of the element. 
 Without syntax sugar, we can write...
 
 */

void desugaredTuple() {
    // desugared constructor
    value t1 = Tuple("John", Tuple(28, Tuple(80.5, [])));
    
    // desugared type
    Tuple<String|Integer|Float, String, Tuple<Integer|Float, Integer, Tuple<Float, Float, Empty>>> t2 = t1;
    
    // phew! we never see this type, because we use abbreviated form
}