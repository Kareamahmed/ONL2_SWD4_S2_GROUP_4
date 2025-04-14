import 'package:flutter/material.dart';
import 'package:striky/core/routes/go_route.dart';
import 'package:striky/core/themes/light_theme.dart';

void main() {
    WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}



class MainApp extends StatelessWidget {
  
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      theme: lighttheme,
      routerConfig: AppRoutes.router ,
      debugShowCheckedModeBanner: false,
    );
  }
}
