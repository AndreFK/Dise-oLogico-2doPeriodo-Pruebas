#define DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN

#include <iostream>
#include <chrono>
#include <random>
#include "doctest.h"
#include "VGCDMain.h"
#include "VGCDMain_GCDMain.h"
#include "VGCDMain_GCDFSM.h"
#include "VGCDMain_GPPM.h"
#include "VGCDMain_RegFile.h"

void reset(VGCDMain& m) {
    m.rst = 1;
    m.clk = 0;
    m.eval();
    m.clk = 1;
    m.eval();
    m.clk = 0;
    m.rst = 0;
    m.eval();
}

void clockPulse(VGCDMain& m) {
    m.clk = 1;
    m.eval();
    m.clk = 0;
    m.eval();
}

static const unsigned finalState = 7;

std::vector<std::tuple<unsigned, unsigned, unsigned>> tests = {
    {134, 567, 1},
    {132, 567, 3},
    {51492, 20636, 28},
    {53316, 33876, 36},
    {5416, 9236, 4},
    {5416, 9232, 8},
    {5406, 9231, 51},
    {5395, 9230, 65},
};

TEST_CASE("GCD test") {
    VGCDMain m;

    for (auto& p : tests) {
        reset(m);
        m.a = std::get<0>(p);
        m.b = std::get<1>(p);
        m.eval();
        while (m.GCDMain->fsm->cs != finalState) {
            clockPulse(m);
        }
        CHECK(m.result == std::get<2>(p));
    }
}
