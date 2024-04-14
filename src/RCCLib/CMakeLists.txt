qt_add_library(RCCLib STATIC
    rcontrollerbase.h
    rcontrollerbase.cpp
    rcontrollertcp.h
    rcontrollertcp.cpp
    rcontrollerhttp.h
    rcontrollerhttp.cpp
    rcppconstants.h
    rcppconstants.cpp
)

target_link_libraries(RCCLib PUBLIC
    Qt6::Core
    Qt6::Gui
    Qt6::Qml
    Qt6::Quick
)