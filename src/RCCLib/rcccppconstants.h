#ifndef RCCCPPCONSTANTS_H
#define RCCCPPCONSTANTS_H

#include <QObject>

class RCCCPPConstants : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool IsDebugBuild READ IsDebugBuild CONSTANT)
    Q_PROPERTY(bool IsSteamdeck READ IsSteamdeck CONSTANT)

public:
    explicit RCCCPPConstants(QObject *parent = nullptr);

    static bool IsDebugBuild() { return bIsDebugBuild; }
    static bool IsSteamdeck() { return bIsSteamdeck; }

private:

#ifdef QT_DEBUG
    inline static bool bIsDebugBuild = true;
#else
    inline static bool bIsDebugBuild = false;
#endif

#ifdef STEAMDECK
    inline static bool bIsSteamdeck = true;
#else
    inline static bool bIsSteamdeck = false;
#endif

};

#endif // RCCCPPCONSTANTS_H
