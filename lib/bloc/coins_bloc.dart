import 'dart:async';
import 'package:myProjectName/src/models/item_models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

enum CoinsAction{
  Fetch 
}

class CoinsBloc{
  final _stateController = StreamController<List<Datum>>.broadcast();
  StreamSink<List<Datum>> get coinsSink => _stateController.sink;
  Stream<List<Datum>> get coinsStream => _stateController.stream;
  

  final _eventStream = StreamController<CoinsAction>();
  StreamSink<CoinsAction> get eventSink => _eventStream.sink;
  Stream<CoinsAction> get eventStream => _eventStream.stream;

CoinsBloc(){
  eventStream.listen((event) async{
   if(event == CoinsAction.Fetch){
     try {
       var coins =  await  getCoins();
       if(coins != null)coinsSink.add(coins.data);
       else coinsSink.addError("Something went wrong");
       coinsSink.add(coins.data);
     } on Exception catch (e) {
            coinsSink.addError("Something went wrong");
     }
   }
   });
}

  void dispose(){
    _stateController.close();
    _eventStream.close();
  }
}
    Future<CryptoModel> getCoins() async{
    var client = http.Client();
    var coinsModel = null;
 


try{
  var response = await client.get(Uri.parse('https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=afb80cac-da74-420f-aa85-0391c9f3b1d0'));
  if(response.statusCode == 200){
    var jsonString =  response.body;
   var jsonMap = json.decode(jsonString);
     coinsModel = CryptoModel.fromJson(jsonMap);
   }
 }catch(Exception){
 return coinsModel;
 }
 return coinsModel;
}