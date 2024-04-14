#include "rcontrollerbase_tests.h"
#include "rcontrollerhttp_tests.h"
#include "rcontrollertcp_tests.h"
#include "rcppconstants_tests.h"

int main(int argc, char *argv[])
{
    int status = 0;

    // Put under this comments your tests
    // This boilerplate code is needed for working "Test Results"
    // We shouldn't do that but it's good enough for us at this moment
    // See https://doc.qt.io/qt-6/qtest.html#qExec
    status |= QTest::qExec(new RControllerBaseTests, argc, argv);
    status |= QTest::qExec(new RControllerTCPTests, argc, argv);
    status |= QTest::qExec(new RControllerHTTPTests, argc, argv);
    status |= QTest::qExec(new RCPPConstatnsTests, argc, argv);

    return status;
}
