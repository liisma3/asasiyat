// To parse this JSON data, do
//
//     final grid = gridFromJson(jsonString);
import 'dart:convert';
import 'dart:math';
//import 'dart:convert';

/* List<Grid> gridFromJson(String str) =>
    List<Grid>.from(json.decode(str).map((x) => Grid.fromJson(x)));

String gridToJson(List<Grid> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
 */
class Guest {

  final int tokenId;
  final int? phoneNb;
  final int host;
  String? collaboratorId; //O6cKgXEsuPNAuzCMTGeblWW9sWI3
  String? flag;
  List<String>? stages;
  DateTime? createdAt;

  Guest({
    required this.tokenId,
    this.phoneNb,
    required this.host,
    required this.collaboratorId,
  });
  Map<String, dynamic>? toMap() {
    return <String, dynamic>{
      "tokenId": this.tokenId,
      "host": (this.host != null) ? this.host : 0,
      "phoneNb": this.phoneNb,
      "collaboratorId": this.collaboratorId,
    };
  }

  String toJson() => json.encode(toMap);
  factory Guest.fromMap(Map<String, dynamic> map) {
    var tempId = Random().nextInt(1000) + 1000;
    return Guest(
        tokenId: map["tokenId"] as int? ?? tempId,
        host: map["host"] as int? ?? 0,
        phoneNb: map["phoneNb"],
        collaboratorId: map["collaboratorId"]);
  }
  factory Guest.fromJson(String source) {
    return Guest.fromMap(json.decode(source) as Map<String, dynamic>);
  }
}
