qt_add_executable(RCCLibTests
	main.cpp
    rcontrollerbase_tests.h
    rcontrollerbase_tests.cpp
    rcontrollertcp_tests.h
    rcontrollertcp_tests.cpp
    rcppconstants_tests.h
    rcppconstants_tests.cpp
)

target_link_libraries(RCCLibTests PUBLIC
    Qt6::Core
    Qt6::Gui
    Qt6::Test
    RCCLib
)

target_include_directories(RCCLibTests PUBLIC
    ../RCCLib
)
