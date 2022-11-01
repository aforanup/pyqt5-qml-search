import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow{
    visible: true
    height: 600
    width: 600
    color: "#252525"

    property QtObject backend
    property string file_list: "heyy"

    Connections {
        id:connectId
        target: backend
        
        function onDirPath(msg){
            file_list=msg;
            return
        }

        // function on file

    }

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
        TextField {
            // height: 28
            id: inputText
            height: parent.height
            width: parent.width
            
            color:"#5D5D5D"
            placeholderText: "enter directory"
            anchors {
                left: parent.left
                right: parent.right
                // leftMargin: 2
                // rightMargin: 2
            }
            
            font.pixelSize: 12
            cursorVisible: false
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
        TextField {
            // height: 28
            id: inputText1
            height: parent.height
            width: parent.width
            
            color:"#5D5D5D"
            placeholderText:"enter phrase"
            anchors {
                left: parent.left
                right: parent.right
                // leftMargin: 2
                // rightMargin: 2
            }
            
            font.pixelSize: 12
            cursorVisible: false
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
            topMargin: 3
            right: directoryRect1.right
        }

        Text{
            id: submitText
            text:"Submit"
            color: "white"
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }
        MouseArea{
            anchors.fill: parent
            onClicked:{
                console.log(inputText1.text)
                // connectId.onDirPath(inputText1.text)
                backend.findPhrase(inputText1.text)
            }
            // onEntered: {
            //     submitText.color="grey"
            // }
            // onExited: {submitText.color= "white"}
        }
    }

    Rectangle{
        anchors{
            top: inputRect1.bottom
            bottom: parent.bottom
            left: inputRect1.left
            right: inputRect1.right
            topMargin: 3
        }
        Text{
            text: file_list
            font.pixelSize: 18
            color: "black"
        }
    }
}