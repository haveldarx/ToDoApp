import 'package:flutter/material.dart';
import 'package:todoapp/model/nodo_item.dart';
import 'package:todoapp/util/database_client.dart';
class NotoDOScrenn extends StatefulWidget {
  const NotoDOScrenn({ Key? key }) : super(key: key);

  @override
  _NotoDOScrennState createState() => _NotoDOScrennState();
}

class _NotoDOScrennState extends State<NotoDOScrenn> {
  final TextEditingController _textEditingController = new TextEditingController();
  var db = DatabaseHelper();
  void _handleSubmitter(String text) async {
    _textEditingController.clear();
    NoDoItem noDoItem = NoDoItem(text,DateTime.now().toIso8601String());
      int saveItemId = await db.saveItem(noDoItem);
            print("item save id :$saveItemId");

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
           title: Icon(Icons.add,color: Colors.blueAccent),
        ),
        onPressed:_showFormDialog
      ),
    );
  }

  void _showFormDialog() {
    var alert = AlertDialog(
    
      content : Row (
      children:<Widget>[
        Expanded(
          child:TextField(
            controller: _textEditingController,
            autofocus: true,
            decoration: InputDecoration(
              labelText:"text",
              hintText: "dont buy stuff",
              icon: Icon(Icons.note_add)
            ),
          
        )
        )

      ],
      ),
      
      
      actions:<Widget>[
        TextButton(
          onPressed: (){
            
            _textEditingController.clear();
          },
          child:Text("Save")),
          TextButton(onPressed: (){
            _handleSubmitter(_textEditingController.toString());
              _textEditingController.clear();},
              child:Text("Cancel"))
          
      ]
      
    
      );
      showDialog(context: context,
      builder:(_){
        return alert;
      });
    }
  }
