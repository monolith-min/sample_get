import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BattleStatusWidget extends StatelessWidget {
  String? status;

  BattleStatusWidget({Key? key, required this.status}) : super(key: key);

  var textColor = Colors.red;
  var image = 'assets/images/img_icon_finished.png';

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case "wait":
      case "ready":
        {
          textColor = Colors.orange;
          image = 'assets/images/img_icon_ready.png';

          break;
        }

      case "active":
        {
          textColor = Colors.deepPurple;
          image = 'assets/images/img_icon_play.png';

          break;
        }

      case "cancel":
        {
          textColor = Colors.purple;
          image = 'assets/images/img_icon_canceled.png';

          break;
        }
    }

    return Column(
      children: [
        Text(status!, style: TextStyle(color: textColor),),
        Image.asset(image, width: 70,)
      ],
    );
  }
}
