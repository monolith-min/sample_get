import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sample_get/src/components/avatar_widget.dart';

import '../models/model_battle_response.dart';

class BattleWidget extends StatelessWidget {
  BattleResponseModel data;

  BattleWidget({Key? key, required this.data}) : super(key: key);

  Widget _battleTitleWidget() {
    return Container(
        height: 50,
        decoration: BoxDecoration(border: Border.all(color: Colors.white)),
        child: Row(
          children: [
            Text("개인전"),
            Container(
              height: 10,
              width: 10,
              color: Colors.red,
            )
          ],
        ));
  }

  Widget _status() {
    return Container(
      color: Colors.grey,
      child: Text(data.battleStatus ?? "Play"),
    );
  }

  Widget _iamgeList() {
    return Stack(
      children: List.generate(
        data.playerList!.length,
        (index) => Positioned(
          left: 0,
          width: 20,
          height: 20,
          child: AvatarWidget(
            thumbPath:
                // "https://i.pinimg.com/originals/43/6d/a2/436da29db0fdade76e6455e4b71bf1db.jpg",
                data.playerList![index].imageUrl!,
            size: 20,
          ),
        ),
      ),
    );
  }

  Widget _images() {
    return Container(
        width: Get.width,
        color: Colors.blue,
        child: /*_iamgeList(),*/
            Stack(
          children: [
            AvatarWidget(
              thumbPath:
                  "https://i.pinimg.com/originals/43/6d/a2/436da29db0fdade76e6455e4b71bf1db.jpg",
              size: 20,
            ),
            Positioned(
              left: 15,
              child: AvatarWidget(
                thumbPath:
                    "https://i.pinimg.com/originals/43/6d/a2/436da29db0fdade76e6455e4b71bf1db.jpg",
                size: 20,
              ),
            ),
            Positioned(
              left: 30,
              child: AvatarWidget(
                thumbPath:
                    "https://i.pinimg.com/originals/43/6d/a2/436da29db0fdade76e6455e4b71bf1db.jpg",
                size: 20,
              ),
            ),
            Positioned(
              left: 45,
              child: AvatarWidget(
                thumbPath:
                    "https://i.pinimg.com/originals/43/6d/a2/436da29db0fdade76e6455e4b71bf1db.jpg",
                size: 20,
              ),
            ),
          ],
        ));
  }

  Widget _title() {
    return Text(data.battleName ?? "오메기떡 걸고 한판?");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _battleTitleWidget(),
          _status(),
          _images(),
          _title(),
        ],
      ),
    );
  }
}
