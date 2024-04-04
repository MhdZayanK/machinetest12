
import 'dart:convert';

List<DataModel> modelsFromJson(String str) => List<DataModel>.from(json.decode(str).map((x) => DataModel.fromJson(x)));

String modelsToJson(List<DataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataModel {

  String? author;
  String? content;


  DataModel({

    this.author,
    this.content,

  }) {
    // TODO: implement DataModel
    throw UnimplementedError();
  }

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(

    author: json["author"],

    content: json["content"],

  );

  Map<String, dynamic> toJson() => {

    "author": author,

    "content": content,

  };
}
