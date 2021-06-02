import 'package:coin_vx/Controllers/API/Coin/coins.dart';
import 'package:coin_vx/Models/coin.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:velocity_x/velocity_x.dart';

class CoinPage extends StatefulWidget {
  final String id;
  const CoinPage({Key? key, required this.id}) : super(key: key);

  @override
  _CoinPageState createState() => _CoinPageState();
}

class _CoinPageState extends State<CoinPage> {
  late Coin coin;
  bool loading = true;

  Future<void> getCoinInfo() async {
    var coinClient = CoinsAPI.create();
    var jsonData = await coinClient.getCoin(widget.id);
    setState(() => coin = Coin.fromMap(jsonData.body));
    setState(() => loading = false);
  }

  @override
  void initState() {
    getCoinInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: loading ? CircularProgressIndicator().centered() : SingleChildScrollView(
        child: Column(
          children: [
            VxCircle(
                    backgroundColor: context.theme.accentColor,
                    radius: MediaQuery.of(context).size.width - 200,
                    child: [
                      "#${coin.rank}".text.xl6.bold.make(),
                      coin.symbol.text.xl4.color(Color(0xFFFFD700)).bold.make()
                    ].vStack(alignment: MainAxisAlignment.center))
                .centered(),
            coin.name.text.capitalize.xl6.extraBold.make(),
            [
              coin.type.text.capitalize.xl3.bold.make(),
              Tooltip(
                message: 'Whitepaper',
                child: Icon(LineIcons.paperclip),
              )
            ].hStack(),
            coin.description.text.lg.align(TextAlign.center).make().p12(),
            Container(
              child: Wrap(
                alignment: WrapAlignment.center,
                children: List.generate(
                    coin.tags.length,
                    (index) => Chip(
                          label: coin.tags[index].name.text.black.make(),
                          backgroundColor: context.primaryColor,
                        ).p4()),
              ),
              height: 150,
            ),
            "Links".text.bold.xl3.make(),
            30.heightBox,
            [
              TextButton.icon(
                  onPressed: () => print('hello'),
                  icon: Icon(LineIcons.folder),
                  label: "Explorer".text.lg.make()),
              TextButton.icon(
                  onPressed: () => print('hello'),
                  icon: Icon(LineIcons.facebook),
                  label: "Facebook".text.lg.make())
            ].hStack(),
            10.heightBox,
            [
              TextButton.icon(
                  onPressed: () => print('hello'),
                  icon: Icon(LineIcons.github),
                  label: "Source Code".text.lg.make()),
              TextButton.icon(
                  onPressed: () => print('hello'),
                  icon: Icon(LineIcons.redditAlien),
                  label: "Reddit".text.lg.make())
            ].hStack(),
            10.heightBox,
            [
              TextButton.icon(
                  onPressed: () => print('hello'),
                  icon: Icon(LineIcons.globe),
                  label: "Website".text.lg.make()),
              TextButton.icon(
                  onPressed: () => print('hello'),
                  icon: Icon(LineIcons.youtube),
                  label: "Youtube".text.lg.make())
            ].hStack(),
            20.heightBox,

            "Team".text.bold.xl3.make(),
            10.heightBox,
            Container(
              height: coin.team.length * 80.0,
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: coin.team.length,
                  itemBuilder: (context, index) => ListTile(
                        title: coin.team[index].name.text.xl2.make(),
                        subtitle: coin.team[index].position.text.lg.make(),
                        leading: Icon(LineIcons.personEnteringBooth),
                      )),
            ),
            20.heightBox,
            "Other Links".text.bold.xl3.make(),
            Container(
              child: Wrap(
                alignment: WrapAlignment.center,
                children: List.generate(
                    coin.links_extended.length,
                    (index) => Chip(
                          label:
                              coin.links_extended[index].type.text.black.make(),
                          backgroundColor: context.primaryColor,
                        ).p4()),
              ),
              height: 150,
            ),
          ],
        ),
      ),
    );
  }
}
