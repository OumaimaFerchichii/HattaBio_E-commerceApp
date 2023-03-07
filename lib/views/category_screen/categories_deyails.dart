import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:hattabio/consts/consts.dart';
import 'package:hattabio/controllers/product_controller.dart';
import 'package:hattabio/services/firestore_services.dart';
import 'package:hattabio/views/category_screen/Items_details.dart';
import 'package:hattabio/widgets_common/bg_widget.dart';
import 'package:hattabio/widgets_common/loading_indicator.dart';

class CategoriesDetails extends StatelessWidget {
  final String ? title;
 
  
  const CategoriesDetails({Key? key,required  this.title}):super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller=Get.find<ProductController>();
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: title!.text.fontFamily(bold).white.make(
            
          ),
        
        
        ),
        body: StreamBuilder(
          stream: Firestoreservices.getProducts(title),
          builder: (BuildContext context,AsyncSnapshot< QuerySnapshot> snapshot) {
            if(!snapshot.hasData){
              return Center(
                child:loadingIndicator() ,
              );
            } else if (snapshot.data!.docs.isEmpty) {

return Center(
  child: "Please contact us to command ".text.color(darkFontGrey).make(),

);

            } else{

            var data=snapshot.data!.docs;



              return Container(
          padding: const EdgeInsets.all(12),

          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,

                child: Row(
                 

                ),
              ),
              20.heightBox,
              Expanded(
              
                
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 250,mainAxisSpacing: 8,crossAxisSpacing: 8)
                , itemBuilder: (context,index){
                   return  Column(
      
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                  Image.network
                  (



                    data[index ]['p_images'][0],
                    
                    
                    
                    height:150,
                  width: 200,
                  fit: BoxFit.cover,).box.roundedSM.clip(Clip.antiAlias).make(),
                  
              5.heightBox,
                 "${data[index]['p_name']}".text.fontFamily(semibold).color(darkFontGrey).make(),
                  10.heightBox,
                 "${data[index]['p_price']}".numCurrency.text.color(Color.fromARGB(255, 10, 73, 12)).fontFamily(bold).size(16).make(),
                  
          10.heightBox,
                 ],
              ).box.white.margin(const EdgeInsets.symmetric(horizontal: 6)).roundedSM.outerShadow.padding(const EdgeInsets.all(12))
              .make().onTap(() {
                Get.to(()=>ItemsDetails(title:  "${data[index]['p_name']}",data: data[index],));
              });

                }),



            
              )
              
            ],
          ),
          
        );
            }
            
          })
        ,)
        
             

        //items container :
      
      
      
    );
  }
}  