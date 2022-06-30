import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sample_get/src/components/avatar_widget.dart';

import '../models/model_battle_response.dart';
import 'battle_status_widget.dart';

class BattleWidget extends StatelessWidget {
  BattleResponseModel data;

  BattleWidget({Key? key, required this.data}) : super(key: key);

  Widget _battleTitleWidget() {
    return Container(
      height: 30,
      decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("개인전"),
            const SizedBox(
              width: 50,
              height: 1,
            ),
            Container(
              height: 10,
              width: 10,
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }

  Widget _status() {
    return Container(
      color: Colors.grey,
      child: Text(data.battleStatus ?? "Play"),
    );
  }

  List<Positioned> _iamgeList() {
    return List.generate(
      data.playerList!.length,
      (index) => Positioned(
        left: 10,
        width: 20,
        height: 20,
        child: AvatarWidget(
          thumbPath:
              // "https://i.pinimg.com/originals/43/6d/a2/436da29db0fdade76e6455e4b71bf1db.jpg",
              data.playerList![index].imageUrl ??
                  "https://i.pinimg.com/originals/43/6d/a2/436da29db0fdade76e6455e4b71bf1db.jpg",
          size: 20,
        ),
      ),
    );
  }

  Widget _images() {
    return Container(
      width: Get.width,
      child: Stack(children: [
        Container(width: 29, height: 29, color: Colors.transparent),
        ...List.generate(
          data.playerList!.length,
          (index) => Positioned(
            left: 15.0 * index,
            child: AvatarWidget(
              thumbPath: data.playerList![index].imageUrl ??
                  "https://i.pinimg.com/originals/43/6d/a2/436da29db0fdade76e6455e4b71bf1db.jpg",
              size: 25,
            ),
          ),
        ),
      ]),
    );
  }

  Widget _title() {
    return Text(data.battleName ?? "오메기떡 걸고 한판?");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            _battleTitleWidget(),
            BattleStatusWidget(status: data.battleStatus),
            const SizedBox(
              height: 10,
            ),
            _images(),
            const SizedBox(
              height: 10,
            ),
            _title(),
          ],
        ),
      ),
    );
  }
}
