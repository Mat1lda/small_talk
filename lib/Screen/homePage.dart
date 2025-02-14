import 'package:small_talk/ChatPage/chatPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:small_talk/Model/ChatModel.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.chatmodels, required this.sourcechat});
  final List<ChatModel> chatmodels;
  final ChatModel sourcechat;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
        backgroundColor: Color(0xFF075E54),
        title: const Text(
          "SmallTalk",
          style: TextStyle(color: Colors.white, fontFamily: "OpenSans"),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            color: Colors.white,
          ),
          PopupMenuButton<String>(
              onSelected: (value) {},
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: Text("1"),
                    value: "1",
                  ),
                  PopupMenuItem(child: Text("2"), value: "2",)
                ];
              })
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          unselectedLabelColor: Colors.white,
          tabs: [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              text: "CHAT",
            ),
            Tab(
              text: "STATUS",
            ),
            Tab(
              text: "CALLS",
            ),
          ],
          labelColor: Colors.white,
        ),
      ),
      body: TabBarView(controller: _tabController, children: [
        Text("1"),
        chatPage(chatmodels: widget.chatmodels, sourcechat: widget.sourcechat,),
        Text("3"),
        Text("4"),
      ]),
    );
  }
}
