import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Datum {
  final int id;
  final String title;
  final String body;

  Datum(this.id, this.title, this.body);

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
        json['id'] as int, json['title'] as String, json['body'] as String);
  }
}
