import 'package:flutter/material.dart';
import 'package:myProjectName/src/ui/Favorite_coins.dart';
import 'package:myProjectName/src/ui/coin_list.dart';

void main(){
  runApp(App());
}
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
       initialRoute: '/',
      routes: {
        '/': (BuildContext context) => CoinList(),
        '/Favorite': (BuildContext context) => FavoriteCoins()
        ,}
      );
  }
}