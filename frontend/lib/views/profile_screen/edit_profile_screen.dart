import 'package:frontend/consts/consts.dart';
import 'package:frontend/controllers/profile_controller.dart';
import 'package:frontend/widgets_common/custome_textfield.dart';
import 'package:frontend/widgets_common/our_button.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  final dynamic data;
  const EditProfileScreen({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();
    // controller.nameController.text=data['name'];
    // controller.oldpassController.text=data['password'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 212, 97, 232),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromARGB(255, 212, 97, 232), Colors.deepPurple],
          ),
        ),
        child: Obx(
          () => SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  imgProfile,
                  width: 100,
                  fit: BoxFit.cover,
                ).box.roundedFull.clip(Clip.antiAlias).make(),

                10.heightBox,

                const Divider(),
                20.heightBox,
                customTextField(
                    name, nameHint, controller.nameController, false),
                10.heightBox,
                customTextField(
                    oldpass, passwordHint, controller.oldpassController, true),
                10.heightBox,
                customTextField(
                    newpass, passwordHint, controller.newpassController, true),
                20.heightBox,
                //loading
                controller.isLoading.value
                    ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(redColor),
                      )
                    : SizedBox(
                        width: context.width - 60,
                        child: ourButton(
                            onPress: () async {
                              controller.isLoading(true);

                              //old paswword database
                              if (data['password'] ==
                                  controller.oldpassController.text) {
                                await controller.changeAuthPassword(
                                    data['email'],
                                    controller.oldpassController.text,
                                    controller.newpassController.text);
                                VxToast.show(context, msg: "Updated");
                              } else {
                                VxToast.show(context, msg: "Wrong password");
                                controller.isLoading(false);
                              }
                            },
                            color1: redColor,
                            textColor: whiteColor,
                            title: "Save")),
              ],
            )
                .box
                .white
                .shadowSm
                .rounded
                .padding(const EdgeInsets.all(16))
                .margin(const EdgeInsets.only(top: 50, left: 16, right: 16))
                .make(),
          ),
        ),
      ),
    );
  }
}
