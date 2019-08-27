import 'package:json_annotation/json_annotation.dart';

part 'json_data.g.dart';

@JsonSerializable()
class JsonData {
  final String by;
  final int descendants;
  final int id;
  final List<int> kids;
  final int score;
  final int time;
  final String title;
  final String type;
  @JsonKey(nullable: false)
  final String url;

  JsonData(
      {this.by,
      this.descendants,
      this.id,
      this.kids,
      this.score,
      this.time,
      this.title,
      this.type,
      this.url});

  //反序列化
  factory JsonData.formJson(Map<String, dynamic> json) =>
      _$JsonDataFromJson(json);

  //序列化
  Map<String, dynamic> toJson() => _$JsonDataToJson(this);
}
