#include <iostream>
#include <verilated.h>
#include "Vnumber_of_digits.h"
#include "Vnumber_of_digits_number_of_digits.h"

void reset(Vnumber_of_digits& vdigits);
void clkPulse(Vnumber_of_digits& vdigits);

int main(){
    Vnumber_of_digits vdigits;
    vdigits.clk = 0;
    int i = 10000;
    reset(vdigits);
    vdigits.n = i
    vdigits.eval();
    while (vdigits.number_of_digits->cs != 2) {
        clkPulse(vdigits);
        //std::cout << "cs = " << static_cast<int>(vmult.Factorial->cs) << '\n';
    }
    if (vdigits.count != 5 {
        std::cout << "\x1b[31mERROR:\x1b[0m Unexpected result: " << vdigits.count
            << ", expected 5" << '\n';
    }
}

void clkPulse(Vnumber_of_digits& vdigits)
{
    vdigits.clk = 1;
    vmult.eval();
    vmult.clk = 0;
    vmult.eval();
}
 
void reset(Vnumber_of_digits& vdigits)
{
    vdigits.rst = 1;
    clkPulse(vmult);
    vdigits.rst = 0;
}