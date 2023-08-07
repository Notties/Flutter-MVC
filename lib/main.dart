import 'package:flutter/material.dart';
import 'package:flutter_mvc/routes/routes_page.dart';
import 'package:flutter_mvc/views/home.dart';
import 'package:flutter_mvc/views/pokemon_list_view.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter MVC',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.blue,
          brightness: Brightness.light,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: Home(),
      // home: PokemonListView(),
      getPages: RoutePages.pages,
      routingCallback: (routing) {
        if (routing!.current == '/') {
          debugPrint("Home Scene");
        }
      },
    );
  }
}
