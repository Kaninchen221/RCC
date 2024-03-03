#ifndef RCCCONTROLLER_H
#define RCCCONTROLLER_H

#include "qqmlintegration.h"
#include <QObject>

class RCCController : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    QML_SINGLETON

public:
    explicit RCCController(QObject *parent = nullptr);

public slots:

    Q_INVOKABLE void startListening() {
        qInfo("Start listening");
    }

    Q_INVOKABLE void stopListening() {
        qInfo("Stop listening");
    }

signals:
};

#endif // RCCCONTROLLER_H
