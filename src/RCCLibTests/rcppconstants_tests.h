#ifndef RCPPCONSTANTS_TESTS_H
#define RCPPCONSTANTS_TESTS_H

#include <QTest>

class RCPPConstatnsTests : public QObject
{
    Q_OBJECT

private slots:
    void isDebugBuild_test();
    void isSteamdeck_test();

};

#endif // RCPPCONSTANTS_TESTS_H
