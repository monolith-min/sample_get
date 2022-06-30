import 'package:dart_json_mapper/dart_json_mapper.dart' show JsonMapper, JsonMapperAdapter, JsonProperty, jsonSerializable, typeOf;

@jsonSerializable
class ResponseBattleData<T> {
  final int? activeCount;
  final int? playerCount;
  final int? readyCount;
  T? battleList;

  ResponseBattleData({this.activeCount, this.playerCount, this.readyCount, this.battleList});


  factory ResponseBattleData.fromJson(Map<String, dynamic> json) {
    return ResponseBattleData<T>(
      activeCount: json['activeCount'],
      playerCount: json['playerCount'],
      readyCount: json['readyCount'],
      battleList: JsonMapper.deserialize<T>(json['battleList']),
    );
  }

  
  Map<String, dynamic> toJson() => JsonMapper.serialize(this) as Map<String, dynamic>;
}