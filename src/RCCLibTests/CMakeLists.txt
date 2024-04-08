qt_add_executable(RCCLibTests
	main.cpp
    rcccontroller_tests.h
    rcccontroller_tests.cpp
    rcccppconstants_tests.h
    rcccppconstants_tests.cpp
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
