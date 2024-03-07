#include "rcccontroller.h"

RCCController::RCCController(QObject *parent)
    : QObject{parent}
{
    connect(&tcpServer, &QTcpServer::newConnection, this,
            [this]() { gatherConnections(); });
}

void RCCController::startListening(const QString& address, const QString& port) {
    qInfo("Start listening");

    QHostAddress hostAddress(address);
    quint16 hostPort = port.toUInt();
    if (tcpServer.listen(hostAddress, hostPort))
    {
        qInfo("TcpServer started listening");
    }
    else
    {
        qWarning("TcpServer failed start listen");
    }
}

void RCCController::stopListening() {
    qInfo("Stop listening");

    tcpServer.close();
}

void RCCController::sendToAll(const QString &message)
{
    for (QTcpSocket* socket : connections)
    {
        if (!socket->isValid() || !socket->isOpen())
            continue;

        std::string stdString = message.toStdString();
        socket->write(stdString.c_str());
    }
}

void RCCController::gatherConnections() {
    qInfo("Gather Connections");

    if (tcpServer.hasPendingConnections())
    {
        QTcpSocket* connection = tcpServer.nextPendingConnection();

        connect(connection, &QTcpSocket::disconnected, this, [this]() { socketDisconnected(); });

        connections.push_back(connection);
        emit onNewConnection(connection->localAddress().toString(), connection->localPort());
    }
}

void RCCController::socketDisconnected()
{
    QTcpSocket* senderObject = qobject_cast<QTcpSocket*>(sender());
    qsizetype index = 0;
    for (QTcpSocket* socket : connections) {
        if (socket == senderObject)
            break;
        ++index;
    }
    connections.removeAt(index);

    emit onConnectionDisconnected(senderObject->localAddress().toString(), senderObject->localPort());
}
