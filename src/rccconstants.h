#ifndef RCCCONSTANTS_H
#define RCCCONSTANTS_H

#include <QObject>

class RCCConstants : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool IsDebugBuild READ isDebugBuild CONSTANT)

public:
    explicit RCCConstants(QObject *parent = nullptr);

    bool isDebugBuild() const { return bIsDebugBuild; }

private:

#ifdef QT_DEBUG
    bool bIsDebugBuild = true;
#else
    bool bIsDebugBuild = false;
#endif

};

#endif // RCCCONSTANTS_H
