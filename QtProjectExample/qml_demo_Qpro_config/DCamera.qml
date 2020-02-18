import QtQuick 2.0
import QtQuick.Controls 1.4
import QtMultimedia 5.4
import QtQuick.Particles 2.0
Rectangle {
    id:cameraPage;
    anchors.fill: parent;
    property bool bVideo: false;
    property real bFlashmode:0; //0:auto  1:on 2:off
    color:"lightblue";
    Camera
    {
        id:camera;
        position:Camera.FrontFace;
    }
    VideoOutput
    {
        id:viewfinder;
        visible: false;
        anchors.fill: parent;
        fillMode: VideoOutput.PreserveAspectCrop;
        source:camera;
        autoOrientation:true;
    }
    Timer
    {
        id:cameraHelper;
        running: false;
        interval: 100;
        onTriggered:
        {
            cameraHelper.running=false;
            js_changeFace();
            viewfinder.visible=true;
        }
    }
    Component.onCompleted:
    {
        cameraPage.state="capture"
        cameraHelper.running=true;
    }
    states:[
        State
        {
            name:"capture"
            PropertyChanges
            {
                target: bottom_frame_capture;
                visible:true;
            }
            PropertyChanges
            {
                target:camera;
                captureMode:Camera.CaptureStillImage;
            }
            PropertyChanges
            {
                target:cameraPage;
                bVideo:false;
            }
            PropertyChanges {
                target: topMenu;
                visible:true;
            }
        },
        State
        {
            name:"record"
            PropertyChanges
            {
                target: bottom_frame_record;
                visible:true;
            }
            PropertyChanges
            {
                target:camera;
                captureMode:Camera.CaptureVideo;
            }
            PropertyChanges
            {
                target:cameraPage;
                bVideo:true;
            }
            PropertyChanges {
                target: topMenu;
                visible:true;
            }
        }
    ]
    function js_changeFace()
    {
        if(camera.position === Camera.FrontFace)
            camera.position = Camera.BackFace;
        else if(camera.position === Camera.BackFace)
            camera.position = Camera.FrontFace;
    }
    function js_changeMode()
    {
        if(cameraPage.state === "capture")
        {
            changeMode.text="record";
            cameraPage.state = "record";
        }
        else if(cameraPage.state === "record")
        {
            changeMode.text="capture"
            cameraPage.state = "capture";
        }
    }
    Text
    {
        id:changeMode;
        anchors.right: parent.right;
        anchors.rightMargin: changeMode.width/2;
        anchors.top: parent.top;
        font.pixelSize: 35;
        color:"#ff00ff";
        text:"capture";
        MouseArea
        {
            anchors.fill: parent;
            onClicked: {js_changeMode();bVideo=!bVideo;}
        }
    }
    Slider {
        id:zoomSlider;
        anchors.left: parent.left;
        anchors.top:topMenu.bottom;
        height: (parent.height-topMenu.height)*3/4;
        width: parent.width/8;
        maximumValue :100;
        minimumValue: 0;
        value: 50;
        orientation: Qt.Vertical;
        stepSize:1.0;
        onValueChanged:
        {
            camera.digitalZoom=Math.max(1,4*value/100);
        }
    }
    Row
    {
        id:topMenu;
        anchors.left: parent.left;
        anchors.top: parent.top;
        width: parent.width-2*changeMode.width;
        height:changeMode.height*1.5;
        Item
        {
            width: parent.width/3;
            height: parent.height;
            Item
            {
                anchors.centerIn: parent;
                width: parent.width/2;
                height: parent.height*3/4;
                Text
                {
                    anchors.fill: parent;
                    font.pixelSize: 30;
                    color:"#ff00ff";
                    text:"Front/Back";
                }
                MouseArea
                {
                    anchors.fill: parent;
                    onClicked:
                    {
                        viewfinder.visible=false;
                        cameraHelper.running=true;
                    }
                }
            }
        }
        Item
        {
            width: parent.width/3;
            height: parent.height;
            Item
            {
                anchors.centerIn: parent;
                width: parent.width/2;
                height: parent.height*3/4;
                Text
                {
                    id:flashtxt;
                    anchors.fill: parent;
                    font.pixelSize: 30;
                    color:"#ff00ff";
                    text:"Flash";
                }
                MouseArea
                {
                    anchors.fill: parent;
                    onClicked:
                    {
                        bFlashmode++;
                        bFlashmode=bFlashmode%3;

                        switch(bFlashmode)
                        {
                        case 0:
                            flashtxt.text="autoFlash";
                            break;
                        case 1:
                            flashtxt.text="FlashOn";
                            camera.flash.mode=Camera.FlashVideoLight;
                            break;
                        case 2:
                            flashtxt.text="FlashOff";
                            break;
                        }
                        if(bVideo)
                        {
                            switch(bFlashmode)
                            {
                            case 0:
                                camera.flash.mode=Camera.FlashAuto;
                                break;
                            case 1:
                                camera.flash.mode=Camera.FlashVideoLight;
                                break;
                            case 2:
                                camera.flash.mode=Camera.FlashOff;
                                break;
                            }
                        }
                        else
                        {
                            switch(bFlashmode)
                            {
                            case 0:
                                camera.flash.mode=Camera.FlashAuto;
                                break;
                            case 1:
                                camera.flash.mode=Camera.FlashOn;
                                break;
                            case 2:
                                camera.flash.mode=Camera.FlashOff;
                                break;
                            }
                        }
                    }
                }
            }
        }
        Item
        {
            width: parent.width/3;
            height: parent.height;
            Item
            {
                anchors.centerIn: parent;
                width: parent.width/2;
                height: parent.height*3/4;
                Text
                {
                    anchors.fill: parent;
                    font.pixelSize: 30;
                    color:"#ff00ff";
                    text:"Focus";
                }
                MouseArea
                {
                    anchors.fill: parent;
                    onClicked:
                    {
                    }
                }
            }
        }
    }
    Rectangle
    {
        id:bottom_frame_capture;
        anchors.bottom: parent.bottom;
        anchors.horizontalCenter: parent.horizontalCenter;
        width: parent.width/2;
        height: parent.height/8;
        visible: false;
        color:"transparent";
        Row
        {
            anchors.fill: parent;
            Item
            {
                width: bottom_frame_capture.width/2;
                height: bottom_frame_capture.height;
                Rectangle
                {
                    anchors.centerIn: parent;
                    width: parent.width/2;
                    height: parent.height*5/6;
                    color:"green";
                    Text
                    {
                        anchors.centerIn: parent;
                        text:"Capture"
                    }
                }
                MouseArea
                {
                    anchors.fill: parent;
                    onClicked: camera.imageCapture.capture();
                }
            }
            Item
            {
                width: bottom_frame_capture.width/2;
                height: bottom_frame_capture.height;
                Rectangle
                {
                    anchors.centerIn: parent;
                    width: parent.width/2;
                    height: parent.height*5/6;
                    color:"green";
                    Text
                    {
                        anchors.centerIn: parent;
                        text:"Preview"
                    }
                }
                MouseArea
                {
                    anchors.fill: parent;
//                    onClicked: camera.imageCapture.capture();
                }
            }
        }
    }
    Rectangle
    {
        id:bottom_frame_record;
        anchors.bottom: parent.bottom;
        anchors.horizontalCenter: parent.horizontalCenter;
        width: parent.width/2;
        height: parent.height/8;
        visible: false;
        color:"transparent";
        Row
        {
            anchors.fill: parent;
            Item
            {
                id:recordbut;
                width: bottom_frame_record.width/2;
                height: bottom_frame_record.height;
                Rectangle
                {
                    anchors.centerIn: parent;
                    width: parent.width/2;
                    height: parent.height*5/6;
                    color:"red";
                    Text
                    {
                        anchors.centerIn: parent;
                        text:"Record"
                    }
                }
                MouseArea
                {
                    anchors.fill: parent;
                    onClicked:
                    {
                        changeMode.enabled=false;
                        recordbut.enabled=false;
                        stopbut.enabled=true;
                        camera.videoRecorder.record();
                    }
                }
            }
            Item
            {
                id:stopbut;
                width: bottom_frame_record.width/2;
                height: bottom_frame_record.height;
                Rectangle
                {
                    anchors.centerIn: parent;
                    width: parent.width/2;
                    height: parent.height*5/6;
                    color:"red";
                    Text
                    {
                        anchors.centerIn: parent;
                        text:"Stop"
                    }
                }
                MouseArea
                {
                    anchors.fill: parent;
                    onClicked:
                    {
                        stopbut.enabled=false;
                        recordbut.enabled=true;
                        camera.videoRecorder.stop();
                        changeMode.enabled=true;
                    }
                }
            }
        }
    }
}
