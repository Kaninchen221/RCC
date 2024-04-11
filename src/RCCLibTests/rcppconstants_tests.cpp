#include "rcppconstants_tests.h"

#include "rcppconstants.h"

void RCPPConstatnsTests::isDebugBuild_test()
{
#ifdef QT_DEBUG
    QTEST_ASSERT(RCPPConstants::IsDebugBuild());
#else
    QTEST_ASSERT(!RCPPConstants::IsDebugBuild());
#endif
}

void RCPPConstatnsTests::isSteamdeck_test()
{
#ifdef STEAMDECK
    QTEST_ASSERT(RCPPConstants::IsSteamdeck());
#else
    QTEST_ASSERT(!RCPPConstants::IsSteamdeck());
#endif
}
