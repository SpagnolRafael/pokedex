import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex/dtos/images_about.dart';

part 'sprites.g.dart';

@JsonSerializable()
class Sprites {
  @JsonKey(name: 'front_default')
  final String frontDefaultImage;
  final ImagesAbout? other;

  Sprites({required this.frontDefaultImage, this.other});

  factory Sprites.fromJson(Map<String, dynamic> json) =>
      _$SpritesFromJson(json);

  Map<String, dynamic> toJson() => _$SpritesToJson(this);
}
