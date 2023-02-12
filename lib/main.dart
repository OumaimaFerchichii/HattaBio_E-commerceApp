import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hattabio/consts/colors.dart';
import 'package:hattabio/views/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //we are using getX
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HATTABIO',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: darkFontGrey),
          backgroundColor: Colors.transparent,
        ),
        
      ),
      home: SplashScreen(),
    );
  }
}
                                                                              