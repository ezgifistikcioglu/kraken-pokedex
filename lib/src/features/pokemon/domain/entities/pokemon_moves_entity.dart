import 'package:kraken_pokedex/src/features/pokemon/domain/entities/pokemon_ability_entity.dart';

class Moves {
  Moves({this.move, this.versionGroupDetails});

  Moves.fromJson(Map<String, dynamic> json) {
    move = json['move'] != null
        ? Ability.fromJson(json['move'] as Map<String, dynamic>)
        : null;
    if (json['version_group_details'] != null) {
      versionGroupDetails = <VersionGroupDetails>[];
      json['version_group_details'].forEach((v) {
        versionGroupDetails!
            .add(VersionGroupDetails.fromJson(v as Map<String, dynamic>));
      });
    }
  }
  Ability? move;
  List<VersionGroupDetails>? versionGroupDetails;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (move != null) {
      data['move'] = move!.toJson();
    }
    if (versionGroupDetails != null) {
      data['version_group_details'] =
          versionGroupDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VersionGroupDetails {
  VersionGroupDetails(
      {this.levelLearnedAt, this.moveLearnMethod, this.versionGroup});

  VersionGroupDetails.fromJson(Map<String, dynamic> json) {
    levelLearnedAt = json['level_learned_at'] as int;
    moveLearnMethod = json['move_learn_method'] != null
        ? Ability.fromJson(json['move_learn_method'] as Map<String, dynamic>)
        : null;
    versionGroup = json['version_group'] != null
        ? Ability.fromJson(json['version_group'] as Map<String, dynamic>)
        : null;
  }
  int? levelLearnedAt;
  Ability? moveLearnMethod;
  Ability? versionGroup;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['level_learned_at'] = levelLearnedAt;
    if (moveLearnMethod != null) {
      data['move_learn_method'] = moveLearnMethod!.toJson();
    }
    if (versionGroup != null) {
      data['version_group'] = versionGroup!.toJson();
    }
    return data;
  }
}
