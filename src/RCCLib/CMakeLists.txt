qt_add_library(RCCLib STATIC
    rcccontroller.h
    rcccontroller.cpp
    rcccppconstants.h
    rcccppconstants.cpp
)

target_link_libraries(RCCLib PUBLIC
    Qt6::Core
    Qt6::Gui
    Qt6::Qml
    Qt6::Quick
)