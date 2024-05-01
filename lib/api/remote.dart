import 'package:current_convert/api/crypto.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Remote{
  Future<Btc?> getCrypto() async{   
    var client = http.Client();
    String apiKey = "j2EDabhmLv9tHWBsno9PWZMQVlI4LTLx";
    TimeOfDay now= TimeOfDay.now();
    List<TimeOfDay> openingTimeRange = [TimeOfDay(hour: 10, minute: 00), TimeOfDay(hour: 21, minute: 00)]; // as an example
    DateTime dateToday =new DateTime.now().subtract(Duration(days:1)); 
    String date = dateToday.toString().substring(0,10);
    String url = "https://api.polygon.io/v2/aggs/grouped/locale/global/market/crypto/$date?adjusted=true&apiKey=$apiKey";
    var uri = Uri.parse(url);
    var response = await client.get(uri);
    var json = response.body;
    return btcFromJson(json);
    
    // if(now.hour >= openingTimeRange[1].hour
    //   && now.minute >= openingTimeRange[1].minute){
    //     DateTime dateToday =new DateTime.now();
    //     String date = dateToday.toString().substring(0,10);
    //     String url = "https://api.polygon.io/v2/aggs/grouped/locale/global/market/crypto/$date?adjusted=true&apiKey=$apiKey";
    //     var uri = Uri.parse(url);
    //     var response = await client.get(uri);
    //     var json = response.body;
      
    //     return btcFromJson(json);
    //   } else{
    //    DateTime dateToday =new DateTime.now().subtract(Duration(days:1)); 
    //     String date = dateToday.toString().substring(0,10);
    //     String url = "https://api.polygon.io/v2/aggs/grouped/locale/global/market/crypto/$date?adjusted=true&apiKey=$apiKey";
    //     var uri = Uri.parse(url);
    //     var response = await client.get(uri);
    //     var json = response.body;
      
    //     return btcFromJson(json);
    //   }


    

    
  }
}