#ifndef RCCCONTROLLER_TESTS_H
#define RCCCONTROLLER_TESTS_H

#include <QTest>

#include "rcccontroller.h"

class RCCControllerTests : public QObject
{
    Q_OBJECT

private slots:
    void findIPV4Address_test();

    void listening_test();

    void sendToAll_test();

private:

    RCCController controller;

};

#endif // RCCCONTROLLER_TESTS_H
