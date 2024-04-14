#include "rcontrollerhttp.h"

#include <QNetworkReply>
#include <QPointer>
#include <QThread>

RControllerHTTP::RControllerHTTP(QObject *parent)
    : RControllerBase{parent}
{
    connect(&networkAccessManager, &QNetworkAccessManager::finished,
            this, [this](QNetworkReply* networkReply)
    {
        if (networkReply)
        {
            qDebug() << "Network reply is valid";
            QString result = networkReply->readAll();
            lastResult = result;
            qDebug() << "Result: " << result;
            emit onNewReply(lastResult);
        }
        else
        {
            qWarning() << "Network reply is invalid";
        }
    });
}

void RControllerHTTP::setAddress(const QString &newAddress)
{
    qDebug() << "RControllerHTTP::setAddress : " << newAddress;
    address = newAddress;
}

void RControllerHTTP::sendRequest(const QString &request, const QString &method)
{
    QNetworkRequest networkRequest;
    const QUrl url{address + request};
    qDebug() << "Url: " << url;
    networkRequest.setUrl(url);
    networkAccessManager.get(networkRequest);
}
