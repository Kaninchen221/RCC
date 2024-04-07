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

void RCCController::sendToAll(const QString& message)
{
    for (auto& connection : connections)
    {
        if (!connection)
            continue;

        if (!connection->isValid() || !connection->isOpen())
            continue;

        std::string stdString = message.toStdString();
        connection->write(stdString.c_str());
    }

    emit onMessageSent(message);
}

void RCCController::gatherConnections() {
    qInfo("Gather Connections");

    if (tcpServer.hasPendingConnections())
    {
        QTcpSocket* connection = tcpServer.nextPendingConnection();

        connect(connection, &QTcpSocket::disconnected, this, &RCCController::socketDisconnected);
        connect(connection, &QTcpSocket::readyRead, this, &RCCController::socketHasSomeBytesToRead);

        connections.push_back(connection);
        emit onNewConnection(connection->localAddress().toString(), connection->localPort());
    }
}

void RCCController::socketDisconnected()
{
    QTcpSocket* senderObject = qobject_cast<QTcpSocket*>(sender());
    qsizetype index = 0;
    for (auto& connection : connections) {
        if (connection == senderObject)
            break;
        ++index;
    }
    if (index >= connections.size())
        return;

    connections.removeAt(index);
    emit onConnectionDisconnected(senderObject->localAddress().toString(), senderObject->localPort());
}

void RCCController::socketHasSomeBytesToRead()
{
    QTcpSocket* connection = qobject_cast<QTcpSocket*>(sender());
    QString message{connection->readAll()};

    emit onMessageReceived(message);
}
