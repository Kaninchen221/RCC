#include "rcontrollertcp_tests.h"

#include <QTest>

void RControllerTCPTests::listening_test()
{
    const QHostAddress address = controllerTCP.findIPV4Address();
    const QString port = "5000";

    controllerTCP.startListening(address.toString(), port);
    QTEST_ASSERT(controllerTCP.isListening());
    controllerTCP.stopListening();
    QTEST_ASSERT(!controllerTCP.isListening());
}

void RControllerTCPTests::sendToAll_test()
{
    const QHostAddress address = controllerTCP.findIPV4Address();
    qDebug() << "Address: " << address;
    const QString port = "5000";
    const int waitMs = 5000;

    controllerTCP.startListening(address.toString(), port);
    QTEST_ASSERT(controllerTCP.isListening());

    QTcpSocket tcpSocket;

    // waitForConnected return true but in server doesn't have any new connection
    //tcpSocket.connectToHost(address, port.toUInt());
    //QTEST_ASSERT(tcpSocket.waitForConnected(waitMs));

    const QString message = "Hello";
    controllerTCP.sendToAll(message);

    //tcpSocket.waitForReadyRead(waitMs);
    //const QByteArray readAllResult = tcpSocket.readAll();
    //QTEST_ASSERT(!readAllResult.isEmpty());
    //QCOMPARE_EQ(readAllResult, message);
}
