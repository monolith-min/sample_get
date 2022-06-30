import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_get/src/components/battle_widget.dart';
import 'package:sample_get/src/controller/battle_controller.dart';
import 'package:sample_get/src/models/model_battle_response.dart';

class App extends GetView<BattleController> {
  const App({Key? key}) : super(key: key);

  Widget _battleWidget(BattleResponseModel data) {
    // return Column(
    return BattleWidget(data: data);
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Obx(
        () => GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
              childAspectRatio: 1),
          itemCount: controller.battleList.length,
          itemBuilder: (BuildContext context, int index) {
            return _battleWidget(controller.battleList[index]);
          },
        ),
      ),
    );
//
  }
}
