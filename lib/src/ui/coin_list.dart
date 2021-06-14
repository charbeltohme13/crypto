import 'package:flutter/material.dart';
import 'package:myProjectName/bloc/coins_bloc.dart';
import '../models/item_models.dart';



class CoinList extends StatefulWidget {
  @override
  _CoinListState createState() => _CoinListState();
}

class _CoinListState extends State<CoinList> {
 final coinsBloc = CoinsBloc();

   @override
  void initState() {
   coinsBloc.eventSink.add(CoinsAction.Fetch);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crypto" , style: TextStyle(color: Colors.lightGreen),),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right:10.0),
              child: GestureDetector(
  onTap: () {
    Navigator.pushNamed(context, "/Favorite");
  },
  child: new Text("Favorite" , style: TextStyle(color: Colors.lightGreen , fontSize: 20 ,
  fontWeight: FontWeight.bold
  ),
  ),
),
            ),
          )
        ],
      ),
      body: Container(
        child: StreamBuilder<List<Datum>>(
          stream: coinsBloc.coinsStream,
          builder: (context , snapshot){
            if(snapshot.hasError){
              return Center(
                child: Text(snapshot.error ?? "Error"),
              );
            }
            if(snapshot.hasData){
               return ListView.builder(
                 itemCount: snapshot.data.length,
                 itemBuilder: (context , index){
                   var coin = snapshot.data[index];
            return Container(
              height: 90,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(8.0)
              ),
              margin: const EdgeInsets.all(10.0),
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children:<Widget> [
                       Text(coin.name, style: TextStyle(
                         fontSize: 20.0,
                         color: Colors.black,
                         fontWeight: FontWeight.bold
                       ),),
                       SizedBox(
                         height: 5.0,
                       ),
                       Text(coin.symbol),
                       Text(" number markets: ${coin.numMarketPairs}")
                     ]
                   ),
                   InkWell(
                     child:
                      IconButton(
                        icon: Icon(Icons.star),
                         onPressed: (){
                           print("button pressed");
                         },
                      ),
                      )
                 ],
               ),
             ),
            );
          });
            }else 
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

}
