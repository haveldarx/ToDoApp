import 'package:flutter/material.dart';
import 'package:todoapp/model/nodo_item.dart';
import 'package:todoapp/util/database_client.dart';

class NotoDOScrenn extends StatefulWidget {
  const NotoDOScrenn({Key? key}) : super(key: key);

  @override
  _NotoDOScrennState createState() => _NotoDOScrennState();
}

class _NotoDOScrennState extends State<NotoDOScrenn> {
  final TextEditingController _textEditingController =
      new TextEditingController();
  var db = DatabaseHelper();
  final List<NoDoItem> _itemList = <NoDoItem>[];
  @override
  void initState() {
    super.initState();
    _readNoDoList();
  }

  void _handleSubmitter(String text) async {
    _textEditingController.clear();
    NoDoItem noDoItem = NoDoItem(text, DateTime.now().toIso8601String());
    int saveItemId = await db.saveItem(noDoItem);
    print("save item id:$saveItemId");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Column(),
      floatingActionButton: FloatingActionButton(
          tooltip: "Add Items",
          backgroundColor: Colors.white,
          child: ListTile(
            title: Icon(Icons.add, color: Colors.blueAccent),
          ),
          onPressed: _showFormDialog),
    );
  }

  void _showFormDialog() {
    var alert = AlertDialog(
        content: Row(
          children: <Widget>[
            Expanded(
                child: TextField(
              controller: _textEditingController,
              autofocus: true,
              decoration: InputDecoration(
                  labelText: "text",
                  hintText: "dont buy stuff",
                  icon: Icon(Icons.note_add)),
            ))
          ],
        ),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                _handleSubmitter(_textEditingController.toString());
              },
              child: Text("Save")),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"))
        ]);
    showDialog(
        context: context,
        builder: (_) {
          return alert;
        });
  }

  _readNoDoList() async {
    List items = await db.getItems();
    items.forEach((item) {
      NoDoItem noDoItem = NoDoItem.map(item);
      print("db items:${noDoItem.itemName}");
    });
  }
}
