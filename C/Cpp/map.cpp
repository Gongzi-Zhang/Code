#include <iostream>
#include <map>
#include <string>

/* In this small code segments, I want to test that for map<string, T>
 * vector, when you loop through it using iterator, the content in
 * the map is shown in the order of alphabetical order of the string
 * rather than the order they are stored in the map.
 */
using namespace std;
int main(){
    map<string, string> Var;
    Var["muon"]="muon";
    Var["ele"]="electron";
    Var["jet"]="Jet";

    map<string, string>::iterator it;
    for (it=Var.begin(); it!=Var.end(); it++){
	string par = (*it).first;
	cout << Var[par] << endl;
    }

    return 1;
}
