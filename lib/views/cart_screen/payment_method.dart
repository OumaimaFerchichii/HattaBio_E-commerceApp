
import 'package:get/get.dart';
import 'package:hattabio/consts/consts.dart';
import 'package:hattabio/consts/lists.dart';
import 'package:hattabio/controllers/cart_controller.dart';
import '../../widgets_common/our_button.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    var controller=Get.find<cartcontroller>();
    return Scaffold(
      backgroundColor: whiteColor,
      bottomNavigationBar: SizedBox(
        height: 60,
        child: ourbutton(
          onpress: (){
            controller.placemyorder(orderpaymentmethod: paymentmethods[controller.paymentIndex.value], totalamount:controller.totalP.value );
          },
          color: Colors.green,
          textcolor: whiteColor,
          title: "Place my order", 
        ),
      ),
      appBar: AppBar(
        title: "Choose Payment".text.fontFamily(semibold).color(darkFontGrey).make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Obx(
           ()=>Column(
            children: List.generate(paymentmethodImg.length, (index) {
              return GestureDetector(
                onTap: (){
                  controller.changepaymentindex(index);
                },
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: controller.paymentIndex.value==index?  Colors.green : Colors.transparent,
                      width: 7,
                    )
                  ),
                  margin: const EdgeInsets.only(bottom: 8),
                
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Image.asset(paymentmethodImg[index],width: double.infinity,height: 120,
                        colorBlendMode:controller.paymentIndex.value==index?  BlendMode.darken:BlendMode.color,
                        color:controller.paymentIndex.value==index?  Colors.black.withOpacity(0.4):Colors.transparent ,
                        
                        
                        
                        
                        fit: BoxFit.cover,),
                        controller.paymentIndex.value==index? Transform.scale(
                          scale: 1.3,
                          child: Checkbox(
                            activeColor: Colors.green,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                            value: true, onChanged: (value){}
                            ),
                        )
                        :Container(),
                      Positioned(
                        bottom:10,
                        right: 10,
                        child: paymentmethods[index].text.white.fontFamily(semibold).size(16).make()),
                      ],
                    ),
                  
                ),
              );
            }
            ),
          ),
        ),
      ),
    );
  }
}