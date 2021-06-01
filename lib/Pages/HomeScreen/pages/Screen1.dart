import 'package:coin_vx/Controllers/API/Coin/coins.dart';
import 'package:coin_vx/Models/global.dart';
import 'package:coin_vx/Models/tweet.dart';
import 'package:coin_vx/Pages/Tweets/tweet.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:velocity_x/velocity_x.dart';

class Screen1 extends StatefulWidget {
  @required
  final GlobalData data;
  @required
  final bool loading;
  const Screen1({Key? key, required this.data, required this.loading})
      : super(key: key);

  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  List<CoinTweet> tweets = [];

  Future<void> getTweets() async {
    if (tweets.length == 0) {
      var coinsCLient = CoinsAPI.create();
      var jsonData = await coinsCLient.tweets('btc-bitcoin');
      var listData = jsonData.body as List;
      setState(() {
        tweets = listData.map((tweet) => CoinTweet.fromMap(tweet)).toList();
      });
    }
  }

  @override
  void initState() {
    getTweets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          20.heightBox,
          "Market Details".text.bold.xl3.make(),
          <Widget>[
            <Widget>[
              <Widget>[
                "Market Cap".text.semiBold.lg.make(),
                widget.loading
                    ? "xxxxxxxxxxx"
                        .text
                        .xl
                        .bold
                        .color(context.theme.primaryColor)
                        .make()
                        .shimmer()
                    : widget.data.market_cap.text.xl.bold
                        .color(context.theme.primaryColor)
                        .make()
              ].vStack(crossAlignment: CrossAxisAlignment.start),
              <Widget>[
                "Market Volume           ".text.semiBold.lg.make(),
                widget.loading
                    ? "xxxxxxxxxxx"
                        .text
                        .xl
                        .bold
                        .color(context.theme.primaryColor)
                        .make()
                        .shimmer()
                    : widget.data.volume.text.xl.bold
                        .color(context.theme.primaryColor)
                        .make()
              ].vStack(crossAlignment: CrossAxisAlignment.start)
            ].hStack(
                alignment: MainAxisAlignment.spaceBetween,
                axisSize: MainAxisSize.max),
            40.heightBox,
            <Widget>[
              <Widget>[
                "Market Cap Change".text.semiBold.lg.make(),
                widget.loading
                    ? "xxxxxxxxxxx"
                        .text
                        .xl
                        .bold
                        .color(context.theme.primaryColor)
                        .make()
                        .shimmer()
                    : widget.data.market_cap_change.text.xl.bold
                        .color(context.theme.primaryColor)
                        .make()
              ].vStack(crossAlignment: CrossAxisAlignment.start),
              <Widget>[
                "Market Vol Change    ".text.semiBold.lg.make(),
                widget.loading
                    ? "xxxxxxxxxxx"
                        .text
                        .xl
                        .bold
                        .color(context.theme.primaryColor)
                        .make()
                        .shimmer()
                    : widget.data.volume_change.text.xl.bold
                        .color(context.theme.primaryColor)
                        .make()
              ].vStack(crossAlignment: CrossAxisAlignment.start)
            ].hStack(
                alignment: MainAxisAlignment.spaceBetween,
                axisSize: MainAxisSize.max),
          ]
              .vStack(crossAlignment: CrossAxisAlignment.start)
              .p12()
              .box
              .rounded
              .size(MediaQuery.of(context).size.width - 30, 150)
              .neumorphic(
                  color: context.theme.brightness == Brightness.dark
                      ? Colors.grey[900]
                      : Colors.grey[200],
                  curve: VxCurve.emboss)
              .margin(EdgeInsets.symmetric(vertical: 10))
              .make(),
          20.heightBox,
          <Widget>[
            [
              Icon(
                LineIcons.twitter,
                size: 40,
                color: Color(0xFF1DA1F2),
              ),
              10.widthBox,
              "Discover Twitter".text.xl3.bold.make()
            ].hStack(),
            "BTC".text.xl2.color(Color(0xFFFFD700)).thin.make()
          ].hStack(
              alignment: MainAxisAlignment.spaceBetween,
              crossAlignment: CrossAxisAlignment.center,
              axisSize: MainAxisSize.max),
          if (tweets.length != 0) ...{
            Container(
              height: 200.0 * tweets.length,
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: tweets.length,
                  itemBuilder: (context, index) => [
                        Hero(
                            tag: tweets[index].status_id,
                            child: VxCircle(
                              radius: 80,
                              backgroundImage: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      tweets[index].user_image_link)),
                            )),
                        20.widthBox,
                        <Widget>[
                          tweets[index].user_name.text.bold.xl.make(),
                          "${tweets[index].status.length >= 60 ? tweets[index].status.substring(0, 59) : tweets[index].status}..."
                              .text
                              .lg
                              .make()
                              .box
                              .width(250)
                              .make(),
                          <Widget>[
                            [
                              Icon(LineIcons.heartAlt, color: Colors.red,),
                              5.widthBox,
                              tweets[index].like_count.text.make()
                            ].hStack(),
                            [
                              Icon(LineIcons.replyAll),
                              5.widthBox,
                              tweets[index].retweet_count.text.make()
                            ].hStack(),
                            if (tweets[index].is_retweet) ...{
                              Chip(
                                label: "Retweeted".text.white.make(),
                                backgroundColor: context.accentColor,
                              )
                            }
                          ]
                              .hStack(alignment: MainAxisAlignment.spaceEvenly)
                              .w(260)
                        ].vStack(
                            alignment: MainAxisAlignment.spaceBetween,
                            crossAlignment: CrossAxisAlignment.start,
                            axisSize: MainAxisSize.max)
                      ]
                          .hStack()
                          .p12()
                          .py4()
                          .box
                          .rounded
                          .height(180)
                          .neumorphic(
                              color: context.theme.brightness == Brightness.dark
                                  ? Colors.grey[900]
                                  : Colors.grey[200],
                              curve: VxCurve.emboss)
                          .margin(EdgeInsets.symmetric(vertical: 10))
                          .make()
                          .onTap(() {
                        print(index);
                        context.push((context) => TweetPage(
                              tweet: tweets[index],
                            ));
                      })),
            )
          } else ...{
            <Widget>[
              VxAnimator<double>(
                builder: (context, animState, child) {
                  return VxCircle(
                    backgroundColor: Color(0xFF1DA1F2),
                    radius: animState.value,
                    child: Icon(
                      LineIcons.twitter,
                      size: animState.value / 2,
                      color: Colors.white,
                    ),
                  );
                },
              )
                  .easeInCubic
                  .doubleTween(10.0, 200.0)
                  .seconds(sec: 2)
                  .infinite
                  .make(),
              "Loading Tweets".text.bold.xl2.make()
            ].vStack().centered().py64()
          }
        ],
      ),
    ));
  }
}
