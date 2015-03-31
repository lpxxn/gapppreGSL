message("Gsl Libs")
message($$THIRDPARTYINCLUDE)
message($$INCLUDEPATH)

DEFINES +=QT_BUILD_GSL_LIB


win32-g++:contains(QMAKE_HOST.arch, x86): {
    #LIBS += -L$$SIMCUBE_SOURCE_TREE/lib/Gsl/win32/gcc -l$$qtLibraryName(libgsl)
    #FILES_COPY_SRC = $$SIMCUBE_SOURCE_TREE/lib/Gsl/win32/gcc/$$qtLibraryName(libgsl).dll
    LIBS += -L$$SIMCUBE_SOURCE_TREE/lib/Gsl/win32/gcc -llibgsl
    FILES_COPY_SRC = $$SIMCUBE_SOURCE_TREE/lib/Gsl/win32/gcc/libgsl.dll
    message("Enter 3")
}

message($$LIBS)

message($$FILES_COPY_SRC)

#拷贝依赖的动态链接库到app路径下
$$copyFile($$FILES_COPY_SRC, $$SIMCUBE_APP_PATH)

win32-g++:contains(QMAKE_HOST.arch, x86): {
    #LIBS += -L$$SIMCUBE_SOURCE_TREE/lib/Gsl/win32/gcc -l$$qtLibraryName(libgsl)
    #FILES_COPY_SRC = $$SIMCUBE_SOURCE_TREE/lib/Gsl/win32/gcc/$$qtLibraryName(libgsl).dll
    LIBS += -L$$SIMCUBE_SOURCE_TREE/lib/Gsl/win32/gcc -llibgslcblas
    FILES_COPY_SRC = $$SIMCUBE_SOURCE_TREE/lib/Gsl/win32/gcc/libgslcblas.dll
    message("Enter 3")
}

message($$LIBS)

message($$FILES_COPY_SRC)

#拷贝依赖的动态链接库到app路径下
$$copyFile($$FILES_COPY_SRC, $$SIMCUBE_APP_PATH)
