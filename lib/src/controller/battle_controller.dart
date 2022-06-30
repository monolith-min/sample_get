import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../models/model_battle_response.dart';
import '../service/service_api.dart';

class BattleController extends GetxController {
  RxList<BattleResponseModel> battleList = <BattleResponseModel>[].obs;

  final apiClient = ServiceApi(Dio());

  @override
  void onInit() {
    super.onInit();
    _loadBattleList();
  }

  void _loadBattleList() async {
    final String response = await rootBundle.loadString('assets/json/battle.json');
    // final data = await json.decode(response,BattleResponseModel);
    print("________________");
    List<dynamic> userMap = jsonDecode(response);
    List<BattleResponseModel> battleList2 = [];

    userMap.forEach((element) {
      Map<String, dynamic> a = element;
      BattleResponseModel dd = BattleResponseModel.fromJson(a);
      battleList2.add(dd);
    });

    await apiClient.getBattleList().then((response) {
      print("GUGUGUGUGUGUG");
      print(battleList2);
      battleList.addAll(battleList2);

    }).onError((error, stackTrace) {
      print("GUGUGUGUGUGUG!!");
      battleList2.forEach((element) {
        print(element.playerList![0]);
      });
      battleList.addAll(battleList2);
    });
  }
}
