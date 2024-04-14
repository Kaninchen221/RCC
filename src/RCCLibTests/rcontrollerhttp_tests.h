#ifndef RCCCONTROLLERHTTP_TESTS_H
#define RCCCONTROLLERHTTP_TESTS_H

#include <QTest>

#include "rcontrollerhttp.h"

class RControllerHTTPTests : public QObject
{
    Q_OBJECT

private slots:

    void setGetAddress_test();

    void sendRequest_test();

private:

    RControllerHTTP controllerHTTP;

};

#endif // RCCCONTROLLERTCP_TESTS_H
