#include <iostream>
#include <vector>
#include <algorithm>

#include "test.hpp"



int main() {
    std::vector<int> v = {1, 2, 3, 4, 5};
    std::for_each(v.begin(), v.end(), [](int i) { std::cout << i << std::endl; });
    
    MyClass a;
    a.myVeryLongMethodName();
}
