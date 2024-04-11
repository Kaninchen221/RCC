#ifndef RCONTROLLERBASE_H
#define RCONTROLLERBASE_H

#include "qqmlintegration.h"
#include <QHostAddress>
#include <QObject>

class RControllerBase : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    QML_SINGLETON

public:
    explicit RControllerBase(QObject *parent = nullptr);

    QHostAddress findIPV4Address() const;

public slots:

signals:

protected:

};

#endif // RCONTROLLERBASE_H
