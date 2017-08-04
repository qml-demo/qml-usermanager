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
                            Layout.leftMargin: Units.dp(27)
                            Label {
                                id:queryLabel
                                anchors.bottom: parent.bottom
                                style: "title"
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
                            Layout.topMargin: Units.dp(50)
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
                                    userMsg: "用户信息"
                                    section:"科室";
                                    deptName:"职称";
                                    userStatus:"用户状态";
                                    remark:"备注";
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
                                        Label {
                                            Layout.preferredWidth: Units.dp(120)
                                            id: headLabel1
                                            style: userListHeadStyle
                                            text: userMsg
                                            color: userListHeadFontColor
                                        }

                                        Label {
                                            Layout.preferredWidth: Units.dp(120)
                                            style: userListHeadStyle
                                            text: section
                                            color: userListHeadFontColor
                                        }
                                        Label {
                                            Layout.preferredWidth: Units.dp(120)
                                            text: deptName
                                            style: userListHeadStyle
                                            color: userListHeadFontColor
                                        }
                                        Label {
                                            Layout.preferredWidth: Units.dp(80)
                                            text: userStatus
                                            style: userListHeadStyle
                                            color: userListHeadFontColor
                                        }
                                        Label {
                                            Layout.fillWidth: true
                                            Layout.leftMargin: Units.dp(120)
                                            Layout.preferredWidth: Units.dp(150)
                                            text: remark
                                            style: userListHeadStyle
                                            color: userListHeadFontColor
                                        }
                                        Label {
                                            Layout.preferredWidth: Units.dp(85)
                                            text: "操作"
                                            style: userListHeadStyle
                                            color: userListHeadFontColor
                                        }
                                    }
                                }
                            }
                        }

                        //                        表格内容
                        View{
                            id: user
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            Layout.leftMargin: Units.dp(30)
                            Layout.rightMargin: Units.dp(30)
                            Layout.bottomMargin: Units.dp(30)
                            Layout.topMargin: Units.dp(-41)
                            border.color: "#e5e5e5"
//                            clip: true
                            elevation: 1

                            ListView {
                                id:userListView
                                width: parent.width-2
                                anchors.centerIn: parent
                                height: parent.height
                                clip: true
                                model: userContentModel
                                delegate: userContent
                            }
                            ListModel {
                                id: userContentModel
                                ListElement {
                                    userName: "张兰3";
                                    jobNumber: "1024";
                                    section: "血液内科";
                                    deptName: "教授";
                                    passWord: "1234";
                                    userStatus: "激活";
                                    remark:"资深技术骨干"
                                }
                                ListElement {
                                    userName: "张兰1";
                                    jobNumber: "1024";
                                    section: "血液内科";
                                    deptName: "教授";
                                    passWord: "1234";
                                    userStatus: "激活";
                                    remark: "医术高超，经验丰富"
                                }
                                ListElement {
                                    userName: "张兰23";
                                    jobNumber: "1024";
                                    section: "血液内科";
                                    deptName: "教授";
                                    passWord: "1234";
                                    userStatus: "注销";
                                    remark:"临床经验丰富，为人亲和"
                                }
                            }
                            Component {
                                id: userContent
                                Item{
                                    width: ListView.view.width
                                    height: Units.dp(70)
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
                                                anchors.verticalCenter: parent.verticalCenter
                                                Label{
                                                    style: "dialog"
                                                    text: userName
                                                    clip: true
                                                }
                                                Label{
                                                    style: "dialog"
                                                    text: "工号:"+jobNumber
                                                    clip: true
                                                }
                                            }
                                            Label{
                                                Layout.preferredWidth: Units.dp(120)
                                                anchors.verticalCenter: parent.verticalCenter
                                                text: section
                                                clip: true
                                                style: addLabelFont
                                            }
                                            Label{
                                                Layout.preferredWidth: Units.dp(120)
                                                anchors.verticalCenter: parent.verticalCenter
                                                clip: true
                                                text: deptName
                                                style: addLabelFont
                                            }
                                            Button{
                                                Layout.preferredWidth: Units.dp(80)
                                                anchors.verticalCenter: parent.verticalCenter
                                                backgroundColor: userStatus == '激活'?'#259ce9':'#eee'
                                                textColor: userStatus == '激活'? 'white' : '#666'
                                                text: userStatus
                                            }
                                            View {
                                                Layout.fillWidth: true
                                                Layout.preferredWidth: Units.dp(150)
                                                anchors.verticalCenter: parent.verticalCenter
                                                Layout.preferredHeight: Units.dp(60)
                                                Layout.leftMargin: Units.dp(30)
                                                Layout.rightMargin: Units.dp(0)
                                                clip: true
                                                border.color: "#eee"
                                                elevation: 1
                                                Label {
                                                    height: parent.height-10
                                                    width: parent.width-20
                                                    anchors.centerIn: parent
                                                    style: "dialog"
                                                    text: remark
                                                }
                                            }

                                            RowLayout {
                                                Layout.preferredWidth: Units.dp(150)
                                                anchors.verticalCenter: parent.verticalCenter
                                                spacing: Units.dp(10)
                                                Button {
                                                    Layout.preferredWidth: Units.dp(60)
                                                    Layout.leftMargin: Units.dp(20)
                                                    anchors.verticalCenter: parent.verticalCenter
                                                    backgroundColor: "#eee"
                                                    textColor: "#666"
                                                    elevation: 1
                                                    text: "编辑"
                                                    onClicked: {
                                                        index1 = model.index
                                                        console.log(model.index)
                                                        addUserTitle.text = "编辑用户"
                                                        addBtn.text = "确定"
                                                        add_username.text = userName
                                                        add_jobnumber.text = jobNumber
                                                        add_deptname.text = deptName
                                                        add_password.text = passWord
                                                        add_sectiono.text = section
                                                        add_userstatus.text = userStatus
                                                        add_remarko.text = remark
                                                    }
                                                }
                                                Button {
                                                    anchors.verticalCenter: parent.verticalCenter
                                                    Layout.preferredWidth: Units.dp(60)
                                                    backgroundColor: "#eee"
                                                    text: "删除"
                                                    textColor: "#666"
                                                    elevation: 1
                                                    onClicked: {
                                                        alertDeleteBar.show()
                                                    }
                                                }
                                            }
                                            Dialog {
                                                id: alertDeleteBar
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

                //                 中间：分界线
                Rectangle {
                    id:divideLine
                    width: 1
                    Layout.fillHeight: true
                    color: Qt.rgba(0,0,0,0.1)
                }

                //                 右边：用户增加编辑模块
                View {
                    id: userEditBox
                    width: Units.dp(200)
                    Layout.fillHeight: true
                    Layout.leftMargin: Units.dp(20)
                    Layout.rightMargin: Units.dp(30)
                    Layout.topMargin: Units.dp(50)
                    Layout.bottomMargin: Units.dp(50)
                    elevation: 1

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
                        Image {
                            id: personLogo
                            anchors.horizontalCenter: parent.horizontalCenter
                            sourceSize.width: Units.dp(140)
                            sourceSize.height: Units.dp(130)
                            source: "img/person.png"
                            Ink {
                                anchors.fill: parent
                            }
                        }
                        ListItem.Standard {
                            width: parent.width
                            clip: true
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
                            clip: true
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
                            clip: true
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
                            clip: true
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
                            clip: true
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
                            clip: true
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
                            clip: true
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
                            clip: true
                            action:Label {
                                anchors.bottom: parent.bottom
                                style:addLabelFont
                                text:"备注："
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
                                    addBtn.text = "添加"
                                    addUserTitle.text = "新增用户"

                                    userListView.currentIndex = index1
                                    userContentModel.set(userListView.currentIndex,{
                                                             userName:add_username.text,jobNumber:add_jobnumber.text,
                                                             deptName:add_deptname.text,passWord:add_password.text,
                                                             section:add_sectiono.text,remark:add_remarko.text
                                                         })
                                }
                                else{
                                    userContentModel.append({
                                                             userName:add_username.text,jobNumber:add_jobnumber.text,
                                                             deptName:add_deptname.text,passWord:add_password.text,
                                                             section:add_sectiono.text,userStatus:add_userstatus.text,
                                                             remark:add_remarko.text
                                                            })
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
