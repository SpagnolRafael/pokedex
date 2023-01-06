import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex/dtos/type.dart';

part 'types.g.dart';

@JsonSerializable()
class Types {
  final Type type;
  Types({required this.type});
  factory Types.fromJson(Map<String, dynamic> json) => _$TypesFromJson(json);

  Map<String, dynamic> toJson() => _$TypesToJson(this);
}
