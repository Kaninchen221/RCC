#include "rcccppconstants_tests.h"

#include "rcccppconstants.h"

void RCCCPPConstatnsTests::isDebugBuild_test()
{
#ifdef QT_DEBUG
    QTEST_ASSERT(RCCCPPConstants::IsDebugBuild());
#else
    QTEST_ASSERT(!RCCCPPConstants::IsDebugBuild());
#endif
}

void RCCCPPConstatnsTests::isSteamdeck_test()
{
#ifdef STEAMDECK
    QTEST_ASSERT(RCCCPPConstants::IsSteamdeck());
#else
    QTEST_ASSERT(!RCCCPPConstants::IsSteamdeck());
#endif
}
