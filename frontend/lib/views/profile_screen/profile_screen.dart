
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frontend/consts/consts.dart';
import 'package:frontend/consts/loading_indicator.dart';
import 'package:frontend/controllers/auth_controller.dart';
import 'package:frontend/controllers/local_storage.dart';
import 'package:frontend/controllers/localization_controller.dart';
import 'package:frontend/controllers/profile_controller.dart';
import 'package:frontend/views/auth_screen/login_screen.dart';
import 'package:frontend/views/profile_screen/details_card.dart';
import 'package:frontend/views/profile_screen/edit_profile_screen.dart';
import 'package:frontend/views/service_screen/firestore_services.dart';
import 'package:frontend/widgets_common/language_change_dialog.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    var controller1 = Get.put(AuthController());
    bool isEnglish = false;
    LocalStorage.getBool("is_english", false)
        .then((value) => isEnglish = value);
    return Scaffold(
        backgroundColor: whiteColor,
        body: Container(
          width: double.infinity,
          height: 510,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color.fromARGB(255, 212, 97, 232), Colors.deepPurple],
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ),
          ),
          child: StreamBuilder(
            stream: FirestoreServices.getUser(currentUser!.uid),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(redColor),
                  ),
                );
              } else {
                var data = snapshot.data!.docs[0];
                // var card_count=data['card_count']
                return SafeArea(
                  child: Column(children: [
                    //edit
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                          alignment: Alignment.topRight,
                          child: const Icon(
                            Icons.edit,
                            color: whiteColor,
                          ).onTap(() {
                            controller.nameController.text = data['name'];

                            Get.to(EditProfileScreen(
                              data: data,
                            ));
                          })),
                    ),
                    //profile setting
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 10, left: 10),
                            child: Image.asset(
                              imgProfile,
                              width: 80,
                              fit: BoxFit.cover,
                            ).box.roundedFull.clip(Clip.antiAlias).make(),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  "${data['name']}"
                                      .text
                                      .fontFamily(semibold)
                                      .white
                                      .make(),
                                  "${data['email']}"
                                      .text
                                      .white
                                      .fontFamily(semibold)
                                      .make(),
                                ],
                              ),
                            ),
                          ),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                              color: whiteColor,
                            )),
                            onPressed: () async {
                              await controller1.signoutMethod(context);
                              Get.offAll(() => const LoginScreen());
                            },
                            child:
                                logout.text.white.fontFamily(semibold).make(),
                          )
                        ],
                      ),
                    ),
                    10.heightBox,
                    Container(
                      margin: EdgeInsets.only(bottom: 5),
                      child:  Text(
                        "Progress",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: bold),
                      ),
                    ),
                    FutureBuilder(
                      future: FirestoreServices.getCounts(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (!snapshot.hasData) {
                          return loadingIndicator();
                        } else {
                          // var countData=snapshot.data;

                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              detailsCard(
                                  context.screenWidth / 3.5, "00", "Alphabets"),
                              detailsCard(
                                  context.screenWidth / 3.5, "00", "Words"),
                              detailsCard(
                                  context.screenWidth / 3.5, "00", "Sentences"),
                            ],
                          ).box.make();
                        }
                      },
                    ),
                    Row(
                      children: [
                        Text(
                          Loc.get["profile_english"],
                          style: const TextStyle(
                              fontSize: 16, color: Color(0xffc0c0c0)),
                        ),
                        Switch(
                          value: isEnglish,
                          activeColor: const Color(0xff1db4fb),
                          onChanged: (value) async {
                            Get.to(() => languageDialog(context));
                          },
                        ),
                      ],
                    ),

                    // Button section
                    // ListView.separated(
                    //   shrinkWrap: true,
                    //   separatorBuilder: (context, index) {
                    //     return const Divider(
                    //       color: lightGrey,
                    //     );
                    //   },
                    //   itemCount: profileButtonsList.length,
                    //   itemBuilder: (BuildContext context, int index) {
                    //     return ListTile(
                    //       onTap: () {
                    //         // switch(index){
                    //         //   case 0: Get.to(const WishlistScreen());
                    //         //     break;
                    //         //   case 1: Get.to(const OrdersScreen());
                    //         //     break;
                    //         //   case 2: Get.to(const MessageScreen());
                    //         //     break;
                    //         //   default:
                    //         //     break;

                    //         // }
                    //       },
                    //       leading: Image.asset(
                    //         profileButtonsIcon[index],
                    //         width: 22,
                    //       ),
                    //       title: profileButtonsList[index]
                    //           .text
                    //           .fontFamily(semibold)
                    //           .color(darkFontGrey)
                    //           .make(),
                    //     );
                    //   },
                    // )
                    //     .box
                    //     .rounded
                    //     .white
                    //     .margin(const EdgeInsets.all(12))
                    //     .padding(const EdgeInsets.symmetric(horizontal: 16))
                    //     .shadowSm
                    //     .make()
                    //     .box
                    //     .make(),
                  ]),
                );
              }
            },
          ),
        ));
  }
}
