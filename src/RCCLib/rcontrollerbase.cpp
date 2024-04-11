#include "rcontrollerbase.h"

#include <QNetworkInterface>

RControllerBase::RControllerBase(QObject *parent)
    : QObject{parent}
{
}

QHostAddress RControllerBase::findIPV4Address() const
{
    const QHostAddress localhost = QHostAddress(QHostAddress::LocalHost);
    for (const QHostAddress& address : QNetworkInterface::allAddresses())
    {
        if (address.protocol() == QAbstractSocket::IPv4Protocol && address != localhost)
        {
            return address;
        }
    }
    return QHostAddress();
}
