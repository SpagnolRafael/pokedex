import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex/dtos/official_art.dart';

part 'images_about.g.dart';

@JsonSerializable()
class ImagesAbout {
  @JsonKey(name: 'official-artwork')
  final OfficialArt officialArt;

  ImagesAbout({required this.officialArt});

  factory ImagesAbout.fromJson(Map<String, dynamic> json) =>
      _$ImagesAboutFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesAboutToJson(this);
}
