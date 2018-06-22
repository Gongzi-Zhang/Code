//     for a container of const type, you can only traval through it with const_iterator. 
    void Method(const vector<int> vInt){
	vector<int>::const_iterator iter;
    }
/1 e.g.
vector<int> ivec;
vector<int>::const_iterator citer1 = ivec.begin();
const vector<int>::iterator citer2 = ivec.begin();
*citer1 = 1; // error
*citer2 = 1; // right
++citer1;  // right
++citer2;  // error

// 所有的标准库容器都定义了相应的迭代器类型。迭代器对所有的容器都适用，现代 C++ 程序更倾向于使用迭代器而不是下标操作访问容器元素。
// C++为每种容器类型定义了一种名为const_iterator的类型，该类型只能用于读取容器内的元素，但不能改变其值。对const_iterator类型解引用，得到的是一个指向const对象的引用。


// erase a element of a vector within a loop
// error
vector<type> v;
for(vector<type>::const_iterator it = v.begin(); it != v.end(); ++it){
    if ((*it).property == value) v.erase(it);
}
// this will cause error, the problem is if it is a pointer point to the last element and it is erased, then ++it will cause it overflow of memory

// correct
for(vector<type>::const_iterator it = v.begin(); it != v.end(); ){
    if ((*it).property ==  value) v.erase(it);
    else ++it;
}
