#include <iostream>
#include <vector>

for(auto obj : myObjects){
    obj;    // this is a copy of element of vector, costly
}

for(auto& obj : myObjects) {
    obj;    // this is a reference to element of vector, inexpensive
}
