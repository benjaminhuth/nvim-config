#include <iostream>
#include <vector>
#include <algorithm>

#include "test.hpp"



int main() {
    std::vector<int> v = {1, 2, 3, 4, 5};
    std::for_each(v.begin(), v.end(), [](int i) { std::cout << i << std::endl; });
    
    MyClass a;

    // fill a vector with random floats
    std::vector<float> vec(10);
    std::generate(vec.begin(), vec.end(), []() { return rand() % 100; });

    // print the vector
    std::for_each(vec.begin(), vec.end(), [](float f) { std::cout << f << std::endl; });
}
