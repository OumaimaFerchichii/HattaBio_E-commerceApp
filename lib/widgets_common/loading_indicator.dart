import 'package:hattabio/consts/consts.dart';
Widget loadingIndicator(){
  return const CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation(Colors.green),
  );
}