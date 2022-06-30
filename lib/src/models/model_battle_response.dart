import 'dart:convert';

import 'package:dart_json_mapper/dart_json_mapper.dart'
    show JsonMapper, JsonMapperAdapter, JsonProperty, jsonSerializable, typeOf;

import 'model_battle_player_response.dart';

@jsonSerializable
class BattleResponseModel {
  int? batid;
  String? battleName;
  String? battleStatus;
  List<BattlePlayerResponseModel>? playerList;

  BattleResponseModel({
    this.batid,
    this.battleName,
    this.battleStatus,
    this.playerList,
  });

  factory BattleResponseModel.fromJson(Map<String, dynamic> json) {
    // print("*** ${ json['playerList'].toString()}");
    // String a = json['playerList'].toString();

    // Iterable l = jsonDecode(json['playerList']);
    // List<BattlePlayerResponseModel> posts = List<BattlePlayerResponseModel>.from(l.map((model)=> BattlePlayerResponseModel.fromJson(model)));
    // print("________________________");
    // print(posts);
    // List<dynamic> battleMap = jsonDecode(a);
    //


    List<BattlePlayerResponseModel> playerList = [];
    // battleMap.forEach((element) {
    //   playerList.add(BattlePlayerResponseModel.fromJson(element));
    // });

    return BattleResponseModel(
      batid: json['batid'],
      battleName: json['battleName'],
      battleStatus: json['battleStatus'],
      playerList: json['playerList'].map<BattlePlayerResponseModel>((json) => BattlePlayerResponseModel.fromJson(json)).toList(),
    );
  }


  @override
  String toString() {
    return 'BattleResponseModel{batid: $batid, battleName: $battleName, battleStatus: $battleStatus, playerList: $playerList}';
  }

  Map<String, dynamic> toJson() => jsonDecode(JsonMapper.serialize(this));
}
