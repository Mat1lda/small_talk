class ChatModel {
  String name;
  String icon;
  bool isGroup;
  String time;
  String currentMessage;
  String status;
  bool selected = false;
  int id;

  ChatModel(
      {required this.name, required this.icon,  required this.isGroup, required this.time, required this.currentMessage, required this.status,this.selected = false, required this.id});
}
