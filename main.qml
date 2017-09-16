import QtQuick 2.4
import Material 0.2
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.3 as Controls
import Material.ListItems 0.1 as ListItem

ApplicationWindow {
    id: demo
    width:1024
    height:768
    title: "userManager"

    // Necessary when loading the window from C++
    visible: true

    theme {
        primaryColor: "#259ce9"
        accentColor: "red"
        tabHighlightColor: "white"
    }
    property  bool isSure: false
    property string addLabelFont: "dialog"
    property int index1
    property var userListHeadStyle: "title"
    property var userListHeadFontColor: "white"

    initialPage: Page {
        id: page
        title: "用户管理"
        View{
            id: outerView
            width: parent.width-50
            height: parent.height-100
            anchors.centerIn: parent
            elevation: 1
            border.color: Qt.rgba(0,0,0,0.1)
            radius: 5

            RowLayout {
                id: rowloyout
                anchors.fill: parent
                //                 左边：用户列表模块
                Item {
                    id: userListBox
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.leftMargin: Units.dp(30)
                    Layout.rightMargin: Units.dp(30)
                    Layout.topMargin: Units.dp(50)
                    Layout.bottomMargin: Units.dp(50)

                    ColumnLayout {
                        anchors.fill: parent

                        //                        用户查询

                        RowLayout {
                            Label {
                                id:queryLabel
                                anchors.bottom: parent.bottom
                                style: "dialog"
                                text: "用户查询："
                            }
                            TextField {
                                id: filter
                                Layout.alignment: Qt.AlignLeft
                                Layout.preferredWidth: parent.width
                                placeholderText: "过滤条件"
                                color: theme.primaryColor
                            }
                        }


                        //                        用户列表Title
                        Label {
                            Layout.leftMargin: Units.dp(27)
                            Layout.topMargin: Units.dp(27)
                            Layout.bottomMargin: Units.dp(10)
                            text: "用户列表"
                            style: "title"
                        }

                        //                        表格头部
                        Item {
                            Layout.fillWidth: true
                            Layout.leftMargin: Units.dp(30)
                            Layout.rightMargin: Units.dp(30)
                            clip: true
                            height: Units.dp(60)

                            //                            listheader视图
                            ListView {
                                id:userListTitleView
                                anchors.fill: parent
                                model: listHeaderModel
                                delegate: userListHeader
                            }

                            //                            listheader数据
                            ListModel {
                                id:listHeaderModel
                                ListElement {
                                    //                                    userName:"用户名";
                                    //                                    jobNumber:"工号";
                                    userMsg: "用户信息"
                                    section:"科室";
                                    deptName:"职称";
//                                    passWord:"用户密码";
                                    userStatus:"用户状态";
                                    remark:"备注";
//                                    fingerprint:"指纹编号";
//                                    anotherFingerprint:"备用指纹"
                                }
                            }
                            //                           listheader模板
                            Component {
                                id: userListHeader
                                Item {
                                    width: ListView.view.width
                                    height: Units.dp(60)
                                    Rectangle{
                                        color: theme.primaryColor
                                        anchors.fill: parent
                                    }
                                    RowLayout {
                                        anchors.fill: parent
                                        anchors.leftMargin: anchors.rightMargin
                                        anchors.rightMargin: Units.dp(20)
                                        spacing: Units.dp(5)
                                        IconButton {
                                            id: addBtn1
                                            Layout.preferredWidth: Units.dp(50)
                                            iconName: "content/add"
                                            color: userListHeadFontColor
                                        }

                                        Label {
                                            Layout.preferredWidth: Units.dp(180)
                                            id: headLabel1
                                            style: userListHeadStyle
                                            text: userMsg
                                            color: userListHeadFontColor

                                        }

                                        Label {
                                            Layout.preferredWidth: Units.dp(150)
                                            style: userListHeadStyle
                                            text: section
                                            color: userListHeadFontColor
                                        }
                                        Label {
                                            Layout.preferredWidth: Units.dp(150)
                                            text: deptName
                                            style: userListHeadStyle
                                            color: userListHeadFontColor
                                        }
                                        Label {
                                            Layout.preferredWidth: Units.dp(180)
                                            text: userStatus
                                            style: userListHeadStyle
                                            color: userListHeadFontColor
                                        }
                                        Label {
                                            Layout.preferredWidth: Units.dp(180)
                                            text: remark
                                            style: userListHeadStyle
                                            color: userListHeadFontColor
                                        }
                                        Label {
                                            Layout.preferredWidth: Units.dp(180)
                                            text: "操作"
                                            style: userListHeadStyle
                                            color: userListHeadFontColor
                                        }
                                    }

                                }

                            }
                        }

                        //                        表格内容
                        Rectangle{
                            id: user
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            Layout.leftMargin: Units.dp(30)
                            Layout.rightMargin: Units.dp(30)
                            Layout.bottomMargin: Units.dp(30)
                            Layout.topMargin: Units.dp(-41)
                            border.color: "#e5e5e5"
                            clip: true

                            ListView {
                                //                                property int currentindex: -1
                                id:userListView
                                anchors.fill: parent
                                clip: true
                                model: userContentModel
                                delegate: userContent
                            }
                            ListModel {
                                id: userContentModel
                                ListElement {
                                    userName: "张兰3";
                                    jobNumber: "工号:1024";
                                    section: "科室:血液内科";
                                    deptName: "教授";
                                    passWord: "1234";
                                    userStatus: "激活";
                                    fingerprint: "PN_1232";
                                    anotherFingerprint: "PN_3241"
                                    remark:"33"
                                }
                                ListElement {
                                    userName: "张兰1";
                                    jobNumber: "1024";
                                    section: "科室:血液内科";
                                    deptName: "教授";
                                    passWord: "1234";
                                    userStatus: "激活";
                                    fingerprint: "PN_1232";
                                    anotherFingerprint: "PN_3241"
                                    remark:"sdff"
                                }
                                ListElement {
                                    userName: "张兰23";
                                    jobNumber: "1024";
                                    section: "科室:血液内科";
                                    deptName: "教授";
                                    passWord: "1234";
                                    userStatus: "激活";
                                    fingerprint: "PN_1232";
                                    anotherFingerprint: "PN_3241"
                                    remark:"dzxhgx"
                                }
                            }
                            Component {
                                id: userContent
                                Item{
                                    width: ListView.view.width
                                    height: Units.dp(50)
                                    Rectangle{
                                        anchors.fill: parent
                                        color: index%2==0?"white":"#e0e0e0"
                                    }
                                    Ink{
                                        anchors.fill: parent
                                        RowLayout{
                                            anchors.fill: parent
                                            anchors.margins: Units.dp(4)
                                            anchors.leftMargin: anchors.rightMargin
                                            anchors.rightMargin: Units.dp(20)
                                            spacing: Units.dp(5)
                                            ColumnLayout{
                                                Layout.preferredWidth: Units.dp(120)
                                                Label{
                                                    style: "dialog"
                                                    text: userName
                                                }
                                                Label{
                                                    style: "dialog"
                                                    text: jobNumber
                                                }
                                            }
                                            Label{
                                                Layout.preferredWidth: Units.dp(120)
                                                text: section
                                                style: addLabelFont
                                            }
                                            Label{
                                                Layout.preferredWidth: Units.dp(120)
                                                text: deptName
                                                style: addLabelFont
                                            }
//                                            Label{
//                                                Layout.preferredWidth: Units.dp(120)
//                                                text: fingerprint
//                                                style: addLabelFont
//                                            }
//                                            Label{
//                                                Layout.preferredWidth: Units.dp(120)
//                                                text: anotherFingerprint
//                                            }
                                            Label{
                                                Layout.preferredWidth: Units.dp(120)
                                                text: remark
                                                style: addLabelFont
                                            }
                                            Button {
                                                Layout.preferredWidth: Units.dp(50)
//                                                iconName: "editor/border_color"
//                                                size: Units.dp(27)
                                                backgroundColor: theme.primaryColor
                                                text: "编辑"
                                                onClicked: {
                                                    index1 = model.index
                                                    console.log(model.index)
                                                    addUserTitle.text = "编辑用户"
                                                    addBtn.text = "确定"
                                                    //                                                    userListView.currentIndex = model.index
                                                    add_username.text = userName
                                                    add_jobnumber.text = jobNumber
                                                    add_deptname.text = deptName
                                                    add_password.text = passWord
                                                    add_sectiono.text = section
                                                    add_userstatus.text = userStatus
//                                                    add_fingerprinto.text = fingerprint
//                                                    add_anotherfingerprint.text = anotherFingerprint
                                                    add_remarko.text = remark

                                                }
                                            }
                                            Button {
                                                Layout.preferredWidth: Units.dp(50)
//                                                iconName: "content/clear"
                                                backgroundColor: theme.primaryColor
                                                text: "删除"
//                                                color: theme.primaryColor
//                                                size: Units.dp(35)
                                                onClicked: {
                                                    alertNoTitleBar.show()
                                                }
                                            }
                                            Dialog {
                                                id: alertNoTitleBar
                                                width: Units.dp(300)
                                                text: "是否删除?"
                                                hasActions: true
                                                positiveButtonText: "确定"
                                                negativeButtonText: "取消"
                                                onAccepted: {
                                                    userContentModel.remove(index,1)
                                                }
                                            }

                                        }
                                    }
                                }
                            }

                        }

                    }

                }

                Component {
                    Repeater {
                        model:[userName,jobNumber,section,deptName,passWord,userStatusfingerprint,anotherFingerprint]
                        Item {
                            width: userRow.width * 0.1
                            height: parent.height
                            Label {
                                anchors.centerIn: parent
                                style: userListHeadStyle
                                text: modelData
                            }
                        }
                    }
                }

                //                 中间：分界线
                Rectangle {
                    id:divideLine
                    width: 1
                    Layout.fillHeight: true
                    Layout.topMargin: 10
                    Layout.bottomMargin: 10
                    color: Qt.rgba(0,0,0,0.1)
                }

                //                 右边：用户增加编辑模块
                Rectangle {
                    id:userEditBox
                    width:180
                    Layout.fillHeight: true
                    border.color: Qt.rgba(0,0,0,0.1)
                    Layout.leftMargin: Units.dp(30)
                    Layout.rightMargin: Units.dp(30)
                    Layout.topMargin: Units.dp(150)
                    Layout.bottomMargin: Units.dp(150)


                    //                    右边
                    ColumnLayout{
                        anchors.fill: parent
                        Label {
                            Layout.topMargin: Units.dp(30)
                            id: addUserTitle
                            anchors {
                                left: parent.left
                                right: parent.right
                                margins: Units.dp(16)
                            }
                            style: "title"
                            text: "添加用户"
                        }
                        ListItem.Standard {
                            width: parent.width
                            action:Label {
                                anchors.bottom: parent.bottom
                                style:addLabelFont
                                text: "用户名："
                            }
                            content: TextField {
                                id: add_username
                                anchors.centerIn: parent
                                width: parent.width
                                color: theme.primaryColor
                                font.pixelSize: 10
                            }
                        }

                        ListItem.Standard {
                            width: parent.width
                            action:Label {
                                anchors.bottom: parent.bottom
                                style:addLabelFont
                                text: "工号"
                            }
                            content: TextField {
                                id: add_jobnumber
                                anchors.centerIn: parent
                                width: parent.width
                                color: theme.primaryColor
                                font.pixelSize: 10
                            }

                        }
                        ListItem.Standard {
                            width: parent.width
                            action:Label {
                                anchors.bottom: parent.bottom
                                style:addLabelFont
                                text: "职称："
                            }
                            content: TextField {
                                id: add_deptname
                                anchors.centerIn: parent
                                width: parent.width
                                color: theme.primaryColor
                                font.pixelSize: 10
                            }
                        }
                        ListItem.Standard {
                            width: parent.width
                            action:Label {
                                anchors.bottom: parent.bottom
                                style:addLabelFont
                                text: "科室"
                            }
                            content: TextField {
                                id: add_sectiono
                                anchors.centerIn: parent
                                width: parent.width
                                color: theme.primaryColor
                                font.pixelSize: 10
                            }
                        }
                        ListItem.Standard {
                            width: parent.width
                            action:Label {
                                anchors.bottom: parent.bottom
                                style:addLabelFont
                                text: "密码:"
                            }
                            content: TextField {
                                id: add_password
                                anchors.centerIn: parent
                                width: parent.width
                                color: theme.primaryColor
                                font.pixelSize: 10
                            }
                        }
                        ListItem.Standard {
                            width: parent.width
                            action:Label {
                                anchors.bottom: parent.bottom
                                style:addLabelFont
                                text: "状态:"

                            }
                            content: TextField {
                                id: add_userstatus
                                width: parent.width
                                anchors.centerIn: parent
                                color: theme.primaryColor
                                font.pixelSize: 10
                            }
                        }
                        ListItem.Standard {
                            width: parent.width
                            Button{
                                width: parent.width*0.9
                                backgroundColor: theme.primaryColor
                                anchors.centerIn: parent
                                text:"录入指纹"
                                onClicked: {
                                    zhiwen.show()
                                }
                            }
                        }


                        ListItem.Standard {
                            width: parent.width
                            action:Label {
                                anchors.bottom: parent.bottom
                                style:addLabelFont
                                text:"备注："
                                //                                {
                                //                               XMLHttpRequest
                                //                                    "备注："
                                //                                }
                            }
                            content: TextField {
                                id: add_remarko
                                anchors.centerIn: parent
                                width: parent.width
                                color: theme.primaryColor
                                font.pixelSize: 10
                            }
                        }

                        Button {
                            id: addBtn
                            Layout.alignment: Qt.AlignCenter
                            text: "添加"
                            textColor: "white"
                            backgroundColor: Theme.primaryColor
                            Layout.bottomMargin: 10
                            elevation: 1
                            onClicked: {
                                if (addBtn.text == "确定"){
                                    addAlertBox.text = "是否修改？"
                                    addBtn.text = "添加"
                                    addUserTitle.text = "新增用户"

                                    userListView.currentIndex = index1
                                    userContentModel.set(userListView.currentIndex,{userName:add_username.text,jobNumber:add_jobnumber.text,
                                                             deptName:add_deptname.text,passWord:add_password.text,section:add_sectiono.text,
                                                             remark:add_remarko.text})

                                }
                                else{
                                    addAlertBox.text = "是否添加？"
                                    userContentModel.append({userName:add_username.text,jobNumber:add_jobnumber.text,
                                                                deptName:add_deptname.text,passWord:add_password.text,section:add_sectiono.text,userStatus:add_userstatus.text,
//                                                                fingerprint:add_fingerprinto.text,anotherFingerprint:add_anotherfingerprint.text,
                                                                remark:add_remarko.text})


                                }
                            }
                        }
                        //                        录入指纹弹出窗口
                        Dialog {
                            id: zhiwen
                            width: Units.dp(300)
                            text: "是否录入指纹?"
                            hasActions: true
                            positiveButtonText: "确定"
                            negativeButtonText: "取消"
                            onAccepted: {

                            }
                        }

                    }
                }

            }

        }


    }
}
