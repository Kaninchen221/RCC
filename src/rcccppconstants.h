#ifndef RCCCPPCONSTANTS_H
#define RCCCPPCONSTANTS_H

#include <QObject>

class RCCCPPConstants : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool IsDebugBuild READ isDebugBuild CONSTANT)

public:
    explicit RCCCPPConstants(QObject *parent = nullptr);

    bool isDebugBuild() const { return bIsDebugBuild; }

private:

#ifdef QT_DEBUG
    bool bIsDebugBuild = true;
#else
    bool bIsDebugBuild = false;
#endif

};

#endif // RCCCPPCONSTANTS_H
