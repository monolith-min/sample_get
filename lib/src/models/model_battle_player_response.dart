import 'dart:convert';

import 'package:dart_json_mapper/dart_json_mapper.dart' show JsonMapper, JsonMapperAdapter, JsonProperty, jsonSerializable, typeOf;

@jsonSerializable
class BattlePlayerResponseModel {
  int? teamCode;
  String? teamName;
  int? wrbId;
  int? memberId;
  String? playerType;
  String? nickName;
  String? imageUrl;
  int? batId;
  bool? todayYn;
  String? wearableTypeCd;
  int? ranking;
  bool? imageYn;
  bool? leaderYn;
  bool? selfYn;
  bool? enabled;


  BattlePlayerResponseModel({
      this.teamCode,
      this.teamName,
      this.wrbId,
      this.memberId,
      this.playerType,
      this.nickName,
      this.imageUrl,
      this.batId,
      this.todayYn,
      this.wearableTypeCd,
      this.ranking,
      this.imageYn,
      this.leaderYn,
      this.selfYn,
      this.enabled});


  @override
  String toString() {
    return 'BattlePlayerResponseModel{teamCode: $teamCode, teamName: $teamName, wrbId: $wrbId, memberId: $memberId, playerType: $playerType, nickName: $nickName, imageUrl: $imageUrl, batId: $batId, todayYn: $todayYn, wearableTypeCd: $wearableTypeCd, ranking: $ranking, imageYn: $imageYn, leaderYn: $leaderYn, selfYn: $selfYn, enabled: $enabled}';
  }

  factory BattlePlayerResponseModel.fromJson(Map<String, dynamic> json){
    return BattlePlayerResponseModel(
        teamCode: json['teamCode'],
        teamName: json['teamName'],
        wrbId: json['wrbId'],
        memberId: json['memberId'],
        playerType: json['playerType'],
        nickName: json['nickName'],
        imageUrl: json['imageUrl'],
        batId: json['batId'],
        todayYn: json['todayYn'],
        wearableTypeCd: json['wearableTypeCd'],
        ranking: json['ranking'],
        imageYn: json['imageYn'],
        leaderYn: json['leaderYn'],
        selfYn: json['selfYn'],
        enabled: json['enabled']
    );
  }
  Map<String, dynamic> toJson() => jsonDecode(JsonMapper.serialize(this));
}
