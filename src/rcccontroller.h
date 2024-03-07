#ifndef RCCCONTROLLER_H
#define RCCCONTROLLER_H

#include "qqmlintegration.h"
#include <QObject>
#include <QTcpServer>
#include <QTcpSocket>

class RCCController : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    QML_SINGLETON
    Q_PROPERTY(bool isListening READ isListening CONSTANT)

public:
    explicit RCCController(QObject *parent = nullptr);

    bool isListening() const { return tcpServer.isListening(); }

public slots:

    Q_INVOKABLE void startListening(const QString& address, const QString& port);

    Q_INVOKABLE void stopListening();

    Q_INVOKABLE void sendToAll(const QString& message);

signals:
    void onNewConnection(const QString& address, const quint16& port);
    void onConnectionDisconnected(const QString& address, const quint16& port);

protected:

    void gatherConnections();
    void socketDisconnected();

    QTcpServer tcpServer;
    QList<QTcpSocket*> connections;

};

#endif // RCCCONTROLLER_H
