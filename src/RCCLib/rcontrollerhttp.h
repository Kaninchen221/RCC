#ifndef RCONTROLLERHTTP_H
#define RCONTROLLERHTTP_H

#include "qqmlintegration.h"
#include <QNetworkAccessManager>
#include <QObject>

#include "rcontrollerbase.h"

class RControllerHTTP : public RControllerBase
{
    Q_OBJECT
    QML_ELEMENT
    QML_SINGLETON

public:
    explicit RControllerHTTP(QObject *parent = nullptr);

    const QNetworkAccessManager& getNetworkAccessManager() const { return networkAccessManager; }

public slots:

    Q_INVOKABLE void setAddress(const QString& newAddress);
    Q_INVOKABLE const QString& getAddress() const { return address; }

    Q_INVOKABLE void sendRequest(const QString& request = "", const QString& method = "");
    Q_INVOKABLE const QString& getLastResult() const { return lastResult; }

signals:

    void onNewReply(const QString& reply);

protected:

    QString address;
    QString lastResult;
    QNetworkAccessManager networkAccessManager;

};

#endif // RCONTROLLERHTTP_H
