import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';

import 'package:hattabio/consts/consts.dart';

import 'package:hattabio/controllers/profile_controller.dart';
import 'package:hattabio/services/firestore_services.dart';

import 'package:hattabio/widgets_common/bg_widget.dart';
import '../../consts/lists.dart';
import '../../controllers/auth_controller.dart';
import '../auth_screen/login_screen.dart';
import 'components/details_buttons.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(profilecontroller());
    
    return bgWidget(
      child: Scaffold(
        body: StreamBuilder(
          stream: Firestoreservices.getUser(currentUser?.uid),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
               
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(
                    (Colors.green),
                  ),
                ),
              );
            } else  {
              var data=snapshot.data!.docs[0];
             
              
              return SafeArea(
                  child: Column(
                children: [
                  //edit profile button
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Align(
                            alignment: Alignment.topRight,
                            child: Icon(Icons.edit, color: whiteColor))
                        .onTap(() {
                          controller.namecontroller.text=data['name'];
                         
                      Get.to(() => Editprofile(
                        data:data
                      ));
                    }),
                  ),
                  //user details section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [

                        data['imageUrl']==''?

                         


                        Image.asset(
                          profileimg1,
                          width: 80,
                          fit: BoxFit.cover,
                        ).box.roundedFull.clip(Clip.antiAlias).make():
                        Image.network(
                          data['imageUrl'],
                          width: 80,
                          fit: BoxFit.cover,
                        ).box.roundedFull.clip(Clip.antiAlias).make(),
                        10.heightBox,
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "${data['name']}"
                                .text
                                .fontFamily(semibold)
                                .white
                                .make(),
                            5.heightBox,
                            "${data['email']}".text.white.make(),
                          ],
                        )),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                            color: whiteColor,
                          )),
                          onPressed: () async {
                            await Get.put(Authcontroller())
                                .signoutMethod(context);
                            Get.offAll(() => const LoginScreen());
                          },
                          child: "Logout"
                              .text
                              .fontFamily(semibold)
                              .size(16)
                              .white
                              .make(),
                        )
                      ],
                    ),
                  ),

                  20.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      detailsCard(
                        count: data['cart_count'],
                        title: 'in your cart ',
                        width: context.screenWidth / 3.4,
                      ),
                      detailsCard(
                        count: data['order_count'],
                        title: 'in your orders',
                        width: context.screenWidth / 3.4,
                      ),
                    ],
                  ),

                  40.heightBox,
                  // buttons section
                  ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return const Divider(
                        color: lightGrey,
                      );
                    },
                    itemCount: profliebuttonslist.count(),
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: Image.asset(
                          profliebuttonsIcon[index],
                          width: 22,
                        ),
                        title: profliebuttonslist[index]
                            .text
                            .fontFamily(semibold)
                            .color(darkFontGrey)
                            .make(),
                      );
                    },
                  )
                      .box
                      .white
                      .rounded
                      .margin(EdgeInsets.all(12))
                      .padding(const EdgeInsets.symmetric(horizontal: 16))
                      .shadowSm
                      .make()
                      .box
                      .color(Colors.green)
                      .make(),
                ],
              ));
            }
          },
        ),
      ),
    );
  }
}
