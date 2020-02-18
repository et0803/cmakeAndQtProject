#-------------------------------------------------
#
# Project created by QtCreator 2014-07-16T16:54:31
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = qtcam
TEMPLATE = app

QMAKE_CXXFLAGS_RELEASE = -DNDEBUG

SOURCES += main.cpp\
		mainwindow.cpp \
	previewdisplay.cpp

HEADERS  += mainwindow.h \
	previewdisplay.h \
	logutil.h


INCLUDEPATH += /usr/local/include \
                /usr/local/include/opencv \
                /usr/local/include/opencv2


LIBS += /usr/local/lib/libopencv_highgui.so \
        /usr/local/lib/libopencv_core.so    \
        /usr/local/lib/libopencv_imgproc.so \
        /usr/local/lib/libopencv_videoio.so \
        /usr/local/lib/libopencv_imgcodecs.so



FORMS    += mainwindow.ui

OTHER_FILES += \
	qtcam.pro.user \
	README
