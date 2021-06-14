import 'package:flutter/material.dart';

class FavoriteCoins extends StatefulWidget {

  @override
  _FavoriteCoinsState createState() => _FavoriteCoinsState();
}

class _FavoriteCoinsState extends State<FavoriteCoins> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite page'),
      ),
    );
  }
}