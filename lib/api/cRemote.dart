import 'package:current_convert/api/Config.dart';
import 'package:current_convert/api/convert.dart';
import 'package:current_convert/api/crypto.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class cRemote{
  Future<ConvertC?> getCrypto(String to, String from, String amount) async{   
    var client = http.Client();
    double aount = Config.amout;
    String url =  "https://api.fastforex.io/convert?from=$from&to=$to&amount=$amount&api_key=f0c7de7811-5ff73ff77e-rgs6z5";
    var uri = Uri.parse(url);
    print(url);
    var response = await client.get(uri);
    var json = response.body;
    return convertCFromJson(json);
    
  }
}