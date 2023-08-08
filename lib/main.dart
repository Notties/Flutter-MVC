import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mvc/screens/home.dart';

// import 'package:flutter_mvc/routes/routes_page.dart';
// import 'package:flutter_mvc/views/home.dart';
// import 'package:flutter_mvc/views/pokemon_list_view.dart';
// import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return App();
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   // theme: ThemeData(
    //   //     primaryColor: Colors.blue,
    //   //     brightness: Brightness.light,
    //   //     visualDensity: VisualDensity.adaptivePlatformDensity),
    //   home: HomeTodo(),
    //   // home: Home(),
    //   // home: PokemonListView(),
    //   // getPages: RoutePages.pages,
    //   // routingCallback: (routing) {
    //   //   if (routing!.current == '/') {
    //   //     debugPrint("Home Scene");
    //   //   }
    //   // },
    // );
  }
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeTodo(),
    );
  }
}
