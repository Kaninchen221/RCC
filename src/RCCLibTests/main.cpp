#include "rcccontroller_tests.h"
#include "rcccppconstants_tests.h"

int main(int argc, char *argv[])
{
    int status = 0;

    // Put under this comments your tests
    // This boilerplate code is needed for working "Test Results"
    // We shouldn't do that but it's good enough for us at this moment
    // See https://doc.qt.io/qt-6/qtest.html#qExec
    status |= QTest::qExec(new RCCControllerTests, argc, argv);
    status |= QTest::qExec(new RCCCPPConstatnsTests, argc, argv);

    return status;
}
