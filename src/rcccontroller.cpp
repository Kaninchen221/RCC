#include "rcccontroller.h"

RCCController::RCCController(QObject *parent)
    : QObject{parent}
{}

void RCCController::startListening(const QString& address, const QString& port) {
    qInfo("Start listening");

    QHostAddress hostAddress(address);
    quint16 hostPort = port.toUInt();
    if (tcpServer.listen(hostAddress, hostPort))
    {
        qInfo("TcpServer started listening");
        connect(&tcpServer, &QTcpServer::newConnection, this,
                [this]() { gatherConnections(); });
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
        connections.push_back(connection);
        emit onNewConnection(connection->localAddress().toString(), connection->localPort());
    }
}
