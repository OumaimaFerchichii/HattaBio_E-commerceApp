import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:hattabio/consts/consts.dart';
import 'package:hattabio/consts/lists.dart';
import 'package:hattabio/controllers/product_controller.dart';
import 'package:hattabio/views/category_screen/categories_deyails.dart';
import 'package:hattabio/widgets_common/bg_widget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller=Get.put(ProductController());
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
        title:categories.text.fontFamily(bold).white.make() ,
        ),
        body: Container(
          padding: EdgeInsets.all(12),
          child: GridView.builder (
            shrinkWrap: true,
            itemCount: 9,
            
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:3,mainAxisSpacing: 8,crossAxisSpacing: 8,mainAxisExtent:200),itemBuilder:(context,index){
            return Column(
              children: [
                Image.asset(categoriesImages[index],
                height:180,
                width: 200,
                fit: BoxFit.cover,
                ),
                "${categoriesList1[index]}".text.color(darkFontGrey).fontFamily(bold).align(TextAlign.center).make(),
              ],
            ).box.white.rounded.clip(Clip.antiAlias).outerShadowSm.make().onTap(() {


              controller.getSubCategories(categoriesList[index]);
              Get.to(()=>CategoriesDetails(title: categoriesList1[index]));
            });
          }),
        ),
      
    ));
  }
}