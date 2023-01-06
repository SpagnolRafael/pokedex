import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex/dtos/stat.dart';

part 'stats.g.dart';

@JsonSerializable()
class Stats {
  @JsonKey(name: 'base_stat')
  int? baseStats;
  Stat stat;
  Stats({required this.baseStats, required this.stat});

  factory Stats.fromJson(Map<String, dynamic> json) => _$StatsFromJson(json);

  Map<String, dynamic> toJson() => _$StatsToJson(this);
}
