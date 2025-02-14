import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:small_talk/CustomUI/AvatarCard.dart';
import 'package:small_talk/CustomUI/buttonCard.dart';
import 'package:small_talk/CustomUI/contactCard.dart';
import 'package:small_talk/Model/ChatModel.dart';

class CreateGroup extends StatefulWidget {
  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  List<ChatModel> contacts = [
    ChatModel(
      name: "Matilda",
      icon: "",
      isGroup: false,
      time: "",
      currentMessage: "",
      status: "Hello! I'm new to SmallTalk", id: 1,
    ),
    ChatModel(
      name: "Matilda",
      icon: "",
      isGroup: false,
      time: "",
      currentMessage: "",
      status: "Hello! I'm new to SmallTalk", id: 1,
    ),
    ChatModel(
      name: "Matilda",
      icon: "",
      isGroup: false,
      time: "",
      currentMessage: "",
      status: "Hello! I'm new to SmallTalk", id: 1,
    ),
    ChatModel(
      name: "Matilda",
      icon: "",
      isGroup: false,
      time: "",
      currentMessage: "",
      status: "Hello! I'm new to SmallTalk", id: 1,
    ),
    ChatModel(
      name: "Matilda",
      icon: "",
      isGroup: false,
      time: "",
      currentMessage: "",
      status: "Hello! I'm new to SmallTalk", id: 1,
    ),
    ChatModel(
      name: "Matilda",
      icon: "",
      isGroup: false,
      time: "",
      currentMessage: "",
      status: "Hello! I'm new to SmallTalk", id: 1,
    ),
    ChatModel(
      name: "Matilda",
      icon: "",
      isGroup: false,
      time: "",
      currentMessage: "",
      status: "Hello! I'm new to SmallTalk", id: 1,
    ),
    ChatModel(
      name: "Matilda",
      icon: "",
      isGroup: false,
      time: "",
      currentMessage: "",
      status: "Hello! I'm new to SmallTalk", id: 1,
    ),
    ChatModel(
      name: "Matilda",
      icon: "",
      isGroup: false,
      time: "",
      currentMessage: "",
      status: "Hello! I'm new to SmallTalk", id: 1,
    ),
    ChatModel(
      name: "Matilda",
      icon: "",
      isGroup: false,
      time: "",
      currentMessage: "",
      status: "Hello! I'm new to SmallTalk", id: 1,
    ),
    ChatModel(
      name: "Matilda",
      icon: "",
      isGroup: false,
      time: "",
      currentMessage: "",
      status: "Hello! I'm new to SmallTalk", id: 1,
    ),
  ];
  List<ChatModel> groups = [];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF075E54),
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create Group",
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                "Add Members",
                style: TextStyle(fontSize: 13, color: Colors.white),
              )
            ],
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          ],
        ),
        body: Stack(
          children: [
            ListView.builder(
              itemCount: contacts.length ,
              itemBuilder: (context, index) {
                // if(index > 0){
                //   return Container(
                //     height: groups.length > 0? 90: 10,
                //   );
                // }
                return InkWell(
                    onTap: () {
                      setState(() {
                        if(contacts[index ].selected == true){
                          groups.remove(contacts[index]);
                          contacts[index].selected = false;
                        }
                        else{
                          groups.add(contacts[index]);
                          contacts[index].selected = true;
                        }
                      });
                    },
                    child: Contactcard(contact: contacts[index]));
              },
            ),
            groups.length > 0
                ? Column(
                    children: [
                      Container(
                        height: 75,
                        color: Colors.white,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: contacts.length,
                            itemBuilder: (context, index) {
                              if (contacts[index].selected == true) {
                                return InkWell(
                                    onTap: () {
                                      setState(() {
                                        groups.remove(contacts[index]);
                                        contacts[index].selected = false;
                                      });
                                    },
                                    child:
                                        AvatarCard(contact: contacts[index]));
                              } else {
                                return Container();
                              }
                            }),
                      ),
                      Divider(
                        thickness: 1,
                      )
                    ],
                  )
                : Container(),
          ],
        ));
  }
}
