import 'package:coin_vx/Pages/HomeScreen/Home.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:velocity_x/velocity_x.dart';

var logger = Logger();

void main() {
  /// Setting Path Url Strategy for Web
  Vx.setPathUrlStrategy();
  logger.v("Logger Initialized");
  runApp(CoinApp());
}

// First way to monitor changes in the routing stack:
class MyObs extends VxObserver {
  @override
  void didChangeRoute(Uri route, Page page, String pushOrPop) {
    print("${route.path} - $pushOrPop");
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    print('Pushed a route');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    print('Popped a route');
  }
}

class CoinApp extends StatefulWidget {
  const CoinApp({Key? key}) : super(key: key);

  @override
  _CoinAppState createState() => _CoinAppState();
}

class _CoinAppState extends State<CoinApp> {
  final navigator = VxNavigator(
      notFoundPage: (uri, params) => MaterialPage(
              child: Scaffold(
            appBar: AppBar(
              title: "Not Found".text.make(),
            ),
            body: "${uri} was not found".text.center.xl.make(),
          )),
      routes: {'/': (uri, params) => MaterialPage(child: Home())});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        theme: ThemeData(
            accentColor: Colors.deepPurple,
            primaryColor: Colors.teal,
            brightness: Brightness.light),
        darkTheme: ThemeData(
            accentColor: Colors.deepPurple,
            primaryColor: Colors.teal,
            brightness: Brightness.dark,
            scaffoldBackgroundColor: Colors.black45),
        routeInformationParser: VxInformationParser(),
        routerDelegate: navigator);
  }
}
