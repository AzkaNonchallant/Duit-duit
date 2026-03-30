import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:manajemen_uang/screens/Dashboardscreen.dart';
import 'package:manajemen_uang/screens/Loginscreen.dart';
import 'package:manajemen_uang/utils/storage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<Widget> check() async {
    final token = await Storage.getToken();
    return token != null
      ? Dashboardscreen(token: token)
      : const Loginscreen();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
        future: check(),
        builder: (context, snap) {
          if (!snap.hasData) return const Center(child: LoadingAnimationWidget.fallingDot(color: Colors.red, size: 50),);
          return snap.data!;
        },
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
