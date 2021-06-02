import 'package:coin_vx/Controllers/API/Coin/coins.dart';
import 'package:coin_vx/Controllers/API/Global/global.dart';
import 'package:coin_vx/Models/global.dart';
import 'package:coin_vx/Models/tweet.dart';
import 'package:coin_vx/Pages/HomeScreen/pages/Coins.dart';
import 'package:coin_vx/Pages/HomeScreen/pages/Screen1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:velocity_x/velocity_x.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int groupValue;
  PageController controller = new PageController(initialPage: 0);

  late GlobalData data;



  bool loading = true;

  Future getData() async {
    var globalClient = GlobalAPI.create();
    var jsonData = await globalClient.globalData();
    setState(() {
      data = GlobalData.fromMap(jsonData.body);
    });
    setState(() => loading = false);
  }

  @override
  void initState() {
    groupValue = 0;
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (context.theme.brightness == Brightness.dark) ...{
                      "CoinVx".text.bold.xl6.make().py0(),
                      "An attempt at VelocityX".text.light.coolGray300.make()
                    } else ...{
                      "CoinVx".text.extraBold.xl6.make().py0(),
                      "An attempt at VelocityX".text.base.light.black.make(),
                    }
                  ],
                ),
                Row(
                  children: [
                    VxCircle(
                      radius: 50,
                      backgroundColor:
                          context.theme.brightness == Brightness.dark
                              ? Colors.grey[900]
                              : Colors.grey[300],
                      child: Icon(LineIcons.cog),
                    ).px8(),
                    VxCircle(
                      radius: 50,
                      backgroundColor:
                          context.theme.brightness == Brightness.dark
                              ? Colors.grey[900]
                              : Colors.grey[300],
                      child: Icon(LineIcons.info),
                    ),
                  ],
                )
              ],
            ).px12()),
            20.heightBox,
            CupertinoSearchTextField().px20(),
            CupertinoSlidingSegmentedControl(
                children: {
                  0: Text('General'),
                  1: Text('Coins'),
                  2: Text('Search')
                },
                groupValue: groupValue,
                onValueChanged: (value) {
                  setState(() => groupValue = int.parse(value.toString()));
                  controller.animateToPage(int.parse(value.toString()),
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn);
                }).p20(),
            Container(
              height: MediaQuery.of(context).size.height - 334,
              child: PageView(
                children: [
                  Screen1(
                    data: loading ? GlobalData.empty() : data,
                    loading: loading,
                  ),
                  CoinsPage(),
                  Center(
                    child: "Search".text.make(),
                  )
                ],
                controller: controller,
                onPageChanged: (val) => setState(() => groupValue = val),
              ),
            ).p20()
          ],
        ),
      ),
    );
  }
}
