import 'package:frontend/consts/consts.dart';

Widget applogoWidget() {
  //x_velocity
  return Image.asset(vaniLogo)
      .box
      .white
      .size(85, 85)
      .padding(const EdgeInsets.all(8))
      .rounded
      .make();
}
