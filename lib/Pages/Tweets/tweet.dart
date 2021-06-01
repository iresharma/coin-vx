import 'package:coin_vx/Models/tweet.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:velocity_x/velocity_x.dart';

class TweetPage extends StatelessWidget {
  final CoinTweet tweet;

  const TweetPage({Key? key, required this.tweet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: <Widget>[
        Hero(
            tag: tweet.status_id,
            child: VxCircle(
              radius: MediaQuery.of(context).size.width - 100,
              backgroundImage: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(tweet.user_image_link)),
            ).shadowLg.centered()),
        20.heightBox,
        "@${tweet.user_name}".text.xl3.bold.color(Color(0xFF1DA1F2)).make(),
        40.heightBox,
        tweet.status.text.align(TextAlign.center).lg.make().p12(),
        80.heightBox,
        <Widget>[
          [
            Icon(
              LineIcons.heartAlt,
              color: Colors.red,
            ),
            10.widthBox,
            tweet.like_count.text.lg.make()
          ].hStack(),
          [
            Icon(LineIcons.replyAll),
            10.widthBox,
            tweet.retweet_count.text.lg.make()
          ].hStack(),
          if (tweet.is_retweet) ...{
            Chip(
              label: "Retweeted".text.white.make(),
              backgroundColor: context.accentColor,
            )
          }
        ].hStack(
            alignment: MainAxisAlignment.spaceEvenly,
            axisSize: MainAxisSize.max),
        40.heightBox,
        TextButton.icon(
            onPressed: () => print('hi'),
            icon: Icon(LineIcons.twitter),
            label: "Twitter".text.white.lg.make())
      ].vStack(),
    );
  }
}
