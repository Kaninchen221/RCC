#ifndef RCONTROLLERTCP_H
#define RCONTROLLERTCP_H

#include "qqmlintegration.h"
#include <QObject>
#include <QTcpServer>
#include <QTcpSocket>
#include <QPointer>

#include "rcontrollerbase.h"

class RControllerTCP : public RControllerBase
{
    Q_OBJECT
    QML_ELEMENT
    QML_SINGLETON
    Q_PROPERTY(bool isListening READ isListening CONSTANT)

public:
    explicit RControllerTCP(QObject *parent = nullptr);

    bool isListening() const { return tcpServer.isListening(); }

public slots:

    Q_INVOKABLE void startListening(const QString& address, const QString& port);

    Q_INVOKABLE void stopListening();

    Q_INVOKABLE void sendToAll(const QString& message);

signals:
    void onNewConnection(const QString& address, const quint16& port);
    void onConnectionDisconnected(const QString& address, const quint16& port);
    void onMessageReceived(const QString& message);
    void onMessageSent(const QString& message);

protected:

    void gatherConnections();
    void socketDisconnected();
    void socketHasSomeBytesToRead();

    QTcpServer tcpServer;
    QList<QPointer<QTcpSocket>> connections;

};

#endif // RCONTROLLERTCP_H
