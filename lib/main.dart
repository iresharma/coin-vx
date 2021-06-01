import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  /// Setting Path Url Strategy for Web
  Vx.setPathUrlStrategy();

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
      routes: {
        '/': (uri, params) => MaterialPage(
                child: Scaffold(
              body: "heelo".text.center.make(),
            ))
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        routeInformationParser: VxInformationParser(),
        routerDelegate: navigator);
  }
}
