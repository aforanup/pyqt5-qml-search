import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow{
    visible: true
    height: 600
    width: 600
    color: "#252525"

    Rectangle{
        height: 28
        id: directoryRect
        width: 65
        color: "transparent"
        anchors.top: parent.top
        anchors.topMargin: 3

        Text{
            text:"Directory: "
            color:"white"
            font.pixelSize: 14
            
            anchors.verticalCenter: parent.verticalCenter
            
        }
    }
    Rectangle{
        // width: parent.width-40
        id: inputRect
        height: directoryRect.height
        anchors.left: directoryRect.right
        anchors.right: parent.right
        anchors.rightMargin: 5
        anchors.leftMargin: 5
        anchors.top: parent.top
        anchors.topMargin: 3
        color: "#F6F8F9"
        TextInput {
            // height: 28
            id: inputText
            
            color:"#B3B3B3"
            text: "enter directory"
            anchors {
                left: parent.left
                right: parent.right
                leftMargin: 2
                rightMargin: 2
            }
            
            font.pixelSize: 12
            cursorVisible: true
            anchors.verticalCenter: parent.verticalCenter

            // mouse area for changing color and clearing the input area
            // MouseArea{
            //     anchors.fill: parent
            //     onClicked:{
            //         parent.color= "#5D5D5D"
            //         parent.clear()
            //         console.log("clicked")
            //     }
            // }
        }

        // mouse area for changing color and clearing the input area

        // MouseArea{
        //         anchors.fill: inputRect
        //         onClicked:{
        //             // inputText.color= "#5D5D5D"
        //             // inputText.clear()
        //             console.log("clicked")
        //         }
        //     }
    }

    // to get phrase
    Rectangle{
        height: 28
        id: directoryRect1
        anchors{
            top: directoryRect.bottom
            topMargin: 3
        }
        width: 65
        color: "transparent"
        Text{
            text:"Phrase: "
            color:"white"
            font.pixelSize: 14
            anchors.verticalCenter: parent.verticalCenter
            
        }
    }
    Rectangle{
        // width: parent.width-40
        id: inputRect1
        height: 28
        anchors.left: directoryRect1.right
        anchors.right: parent.right
        anchors.top: inputRect.bottom
        anchors.topMargin: 3
        anchors.rightMargin: 5
        anchors.leftMargin: 5
        color: "#F6F8F9"
        TextInput {
            // height: 28
            id: inputText1
            
            color:"#B3B3B3"
            text: "enter phrase"
            anchors {
                left: parent.left
                right: parent.right
                leftMargin: 2
                rightMargin: 2
            }
            
            font.pixelSize: 12
            cursorVisible: true
            anchors.verticalCenter: parent.verticalCenter
        }
    }


    // FOR BUTTON
    Rectangle{

        color: "#52743D"
        height:30
        width: 75
        anchors{
            top: directoryRect1.bottom
            left: parent.left
        }

        Text{
            text:"Submit"
            color: "white"
        }
        MouseArea{
            onClick:{

            }
        }
    }

}