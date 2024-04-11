#include "rcontrollerbase_tests.h"

void RControllerBaseTests::findIPV4Address_test()
{
    QHostAddress ipV4Address = controller.findIPV4Address();
    QCOMPARE_NE(ipV4Address, QHostAddress{});
}
