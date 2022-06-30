
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sample_get/src/models/model_battle_response.dart';

import '../models/response_battle_data.dart';

part 'service_api.g.dart';

@RestApi(baseUrl: '')
abstract class ServiceApi {
  factory ServiceApi(Dio dio, {String baseUrl}) = _ServiceApi;

  @POST('teest')
  Future<ResponseBattleData<List<BattleResponseModel>>> getBattleList();
}