import 'package:flutter/material.dart';
// ignore: must_be_immutable
class NoDoItem extends StatelessWidget {
  String? _itemName;
  String? _dateCreated;
  int? _id;
 NoDoItem(this._itemName, this._dateCreated);
NoDoItem.map(dynamic obj){
  this._itemName =obj["itemName"];
  this._dateCreated =obj["dateCreated"];
  this._id =obj["id"];
}
String get itemName => _itemName!;
String get dateCreated => _dateCreated!;
int get id => _id!;
Map<String, dynamic> toMap() {
  var map = new Map<String, dynamic>();
  map["itemName"] = _itemName;
  map["dateCreated"] = _dateCreated;
  
    map["id"] = _id;
  
  return map;
}
NoDoItem.fromMap(Map<String, dynamic> map){
  this._itemName = map["itemName"];
  this._dateCreated = map["dateCreated"];
  this._id =map["id"];
}

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          Text(itemName, style:TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize:16.9
          ) ,),
          Container(
            margin: EdgeInsets.only(top:5.0),
            child:Text("created on:$_dateCreated",
            style: TextStyle(
              color:Colors.white70,
              fontSize: 13.5,
              fontStyle:FontStyle.italic
            ))
          )
        ],),
    );
  }
}