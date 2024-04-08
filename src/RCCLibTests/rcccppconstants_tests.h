#ifndef RCCCPPCONSTANTS_TESTS_H
#define RCCCPPCONSTANTS_TESTS_H

#include <QTest>

class RCCCPPConstatnsTests : public QObject
{
    Q_OBJECT

private slots:
    void isDebugBuild_test();
    void isSteamdeck_test();

};

#endif // RCCCPPCONSTANTS_TESTS_H
