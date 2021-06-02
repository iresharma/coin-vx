import 'package:coin_vx/Controllers/API/Coin/coins.dart';
import 'package:coin_vx/Models/coinMin.dart';
import 'package:coin_vx/Pages/Coin/coin.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

class CoinsPage extends StatefulWidget {
  const CoinsPage({Key? key}) : super(key: key);

  @override
  _CoinsPageState createState() => _CoinsPageState();
}

class _CoinsPageState extends State<CoinsPage> {
  List<CoinMin> coins = [];

  Future<void> getCoins() async {
    if (coins.length == 0) {
      var coinsClient = CoinsAPI.create();
      var jsonData = await coinsClient.getCoins();
      var listData = jsonData.body as List;
      setState(() {
        coins = listData.map((tweet) => CoinMin.fromMap(tweet)).toList();
      });
    }
  }

  @override
  void initState() {
    getCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 300,
      child: coins.length == 0
          ? LottieBuilder.asset('assets/JSON/coin.json')
          : ListView.builder(
              itemBuilder: (context, index) => ListTile(
                    title: coins[index].name.text.make(),
                    subtitle: coins[index].type.text.make(),
                    leading: "#${coins[index].rank}"
                        .text
                        .bold
                        .xl
                        .color(context.theme.accentColor)
                        .make(),
                    trailing: Hero(
                      child: coins[index]
                          .symbol
                          .text
                          .xl4
                          .bold
                          .color(Color(0xFFFFD700))
                          .make(),
                      tag: coins[index].symbol,
                    ),
                    tileColor: coins[index].is_new
                        ? context.accentColor.withOpacity(0.6)
                        : !coins[index].is_active
                            ? Vx.red400
                            : Colors.transparent,
                    onTap: () => context.push((context) => CoinPage(id: coins[index].id,)),
                  )),
    );
  }
}
