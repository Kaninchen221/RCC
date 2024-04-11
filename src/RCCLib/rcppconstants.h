#ifndef RCPPCONSTANTS_H
#define RCPPCONSTANTS_H

#include <QObject>

class RCPPConstants : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool IsDebugBuild READ IsDebugBuild CONSTANT)
    Q_PROPERTY(bool IsSteamdeck READ IsSteamdeck CONSTANT)

public:
    explicit RCPPConstants(QObject *parent = nullptr);

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

#endif // RCPPCONSTANTS_H
