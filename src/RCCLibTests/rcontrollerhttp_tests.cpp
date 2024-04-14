#include "rcontrollerhttp_tests.h"

#include <QSignalSpy>

void RControllerHTTPTests::setGetAddress_test()
{
    const QString expectedAddress = "192.168.1.256";
    controllerHTTP.setAddress(expectedAddress);
    const QString& actualAddress = controllerHTTP.getAddress();
    QCOMPARE_EQ(expectedAddress, actualAddress);
}

void RControllerHTTPTests::sendRequest_test()
{
    const QString address = "http://google.com";
    controllerHTTP.setAddress(address);

    const QString request = "";
    const QString method = "GET";

    const auto& networkAccessManager = controllerHTTP.getNetworkAccessManager();
    QSignalSpy spy{&networkAccessManager, &QNetworkAccessManager::finished};

    controllerHTTP.sendRequest(request, method);

    //const QString& lastResult = controllerHTTP.getLastResult();
    //QTEST_ASSERT(!lastResult.isEmpty());
}
