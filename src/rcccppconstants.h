#ifndef RCCCPPCONSTANTS_H
#define RCCCPPCONSTANTS_H

#include <QObject>

class RCCCPPConstants : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool IsDebugBuild READ isDebugBuild CONSTANT)
    Q_PROPERTY(bool IsSteamdeck READ isSteamdeck CONSTANT)

public:
    explicit RCCCPPConstants(QObject *parent = nullptr);

    bool isDebugBuild() const { return bIsDebugBuild; }
    bool isSteamdeck() const { return bIsSteamdeck; }

private:

#ifdef QT_DEBUG
    bool bIsDebugBuild = true;
#else
    bool bIsDebugBuild = false;
#endif

#ifdef STEAMDECK
    bool bIsSteamdeck = true;
#else
    bool bIsSteamdeck = false;
#endif

};

#endif // RCCCPPCONSTANTS_H
