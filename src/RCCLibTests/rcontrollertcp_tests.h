#ifndef RCCCONTROLLERTCP_TESTS_H
#define RCCCONTROLLERTCP_TESTS_H

#include <QTest>

#include "rcontrollertcp.h"

class RControllerTCPTests : public QObject
{
    Q_OBJECT

private slots:

    void listening_test();

    void sendToAll_test();

private:

    RControllerTCP controllerTCP;

};

#endif // RCCCONTROLLERTCP_TESTS_H
