import 'package:json_annotation/json_annotation.dart';

part 'type.g.dart';

@JsonSerializable()
class Type {
  final String name;
  Type({required this.name});
  factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);

  Map<String, dynamic> toJson() => _$TypeToJson(this);
}
