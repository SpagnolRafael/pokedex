import 'package:json_annotation/json_annotation.dart';

part 'official_art.g.dart';

@JsonSerializable()
class OfficialArt {
  @JsonKey(name: 'front_default')
  final String frontDefault;
  OfficialArt({required this.frontDefault});

  factory OfficialArt.fromJson(Map<String, dynamic> json) =>
      _$OfficialArtFromJson(json);

  Map<String, dynamic> toJson() => _$OfficialArtToJson(this);
}
