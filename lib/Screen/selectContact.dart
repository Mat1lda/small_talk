import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:small_talk/CustomUI/buttonCard.dart';
import 'package:small_talk/CustomUI/contactCard.dart';
import 'package:small_talk/Model/ChatModel.dart';
import 'package:small_talk/Screen/CreateGroup.dart';
import 'package:small_talk/Screen/IndividualPage.dart';
import 'package:small_talk/Screen/homePage.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({super.key});

  @override
  State<SelectContact> createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  List<ChatModel> contacts = [
    ChatModel(
        name: "Matilda",
        icon: "",
        isGroup: false,
        time: "",
        currentMessage: "",
        status: "Hello! I'm new to SmallTalk", id: 1, ),
    ChatModel(
      name: "Matilda",
      icon: "",
      isGroup: false,
      time: "",
      currentMessage: "",
      status: "Hello! I'm new to SmallTalk", id: 1, ),
    ChatModel(
      name: "Matilda",
      icon: "",
      isGroup: false,
      time: "",
      currentMessage: "",
      status: "Hello! I'm new to SmallTalk", id: 1, ),
    ChatModel(
      name: "Matilda",
      icon: "",
      isGroup: false,
      time: "",
      currentMessage: "",
      status: "Hello! I'm new to SmallTalk", id: 1, ),
    ChatModel(
      name: "Matilda",
      icon: "",
      isGroup: false,
      time: "",
      currentMessage: "",
      status: "Hello! I'm new to SmallTalk", id: 1, ),
    ChatModel(
      name: "Matilda",
      icon: "",
      isGroup: false,
      time: "",
      currentMessage: "",
      status: "Hello! I'm new to SmallTalk", id: 1, ),
    ChatModel(
      name: "Matilda",
      icon: "",
      isGroup: false,
      time: "",
      currentMessage: "",
      status: "Hello! I'm new to SmallTalk", id: 1, ),
    ChatModel(
      name: "Matilda",
      icon: "",
      isGroup: false,
      time: "",
      currentMessage: "",
      status: "Hello! I'm new to SmallTalk", id: 1, ),
    ChatModel(
      name: "Matilda",
      icon: "",
      isGroup: false,
      time: "",
      currentMessage: "",
      status: "Hello! I'm new to SmallTalk", id: 1, ),
    ChatModel(
      name: "Matilda",
      icon: "",
      isGroup: false,
      time: "",
      currentMessage: "",
      status: "Hello! I'm new to SmallTalk", id: 1, ),
    ChatModel(
      name: "Matilda",
      icon: "",
      isGroup: false,
      time: "",
      currentMessage: "",
      status: "Hello! I'm new to SmallTalk", id: 1, ),
  ];

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
                "Select Contact",
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                "256 contacts",
                style: TextStyle(fontSize: 13, color: Colors.white),
              )
            ],
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            PopupMenuButton<String>(
                onSelected: (value) {},
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                      child: const Text("Invite a friend"),
                      value: "Invite a friend",
                    ),
                    PopupMenuItem(
                      child: const Text("Contacts"),
                      value: "Contacts",
                    ),
                    PopupMenuItem(
                      child: const Text("Help"),
                      value: "Help",
                    )
                  ];
                })
          ],
        ),
        body: ListView.builder(
          itemCount: contacts.length + 2,
          itemBuilder: (context, index) {
            if (index == 0) {
              return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CreateGroup()));
                  },
                  child:
                      ButtonCard(name: "New group", iconData: Icons.group_add));
            } else if (index == 1) {
              return ButtonCard(
                  name: "New contact", iconData: Icons.person_add);
            } else {
              return Contactcard(contact: contacts[index - 2]);
            }
          },
        ));
  }
}
