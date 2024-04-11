#ifndef RCCCONTROLLER_TESTS_H
#define RCCCONTROLLER_TESTS_H

#include <QTest>

#include "rcontrollerbase.h"

class RControllerBaseTests : public QObject
{
    Q_OBJECT

private slots:
    void findIPV4Address_test();

private:

    RControllerBase controller;

};

#endif // RCCCONTROLLER_TESTS_H
