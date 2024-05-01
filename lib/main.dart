import 'package:current_convert/api/Config.dart';
import 'package:current_convert/api/cRemote.dart';
import 'package:current_convert/screens/Home.dart';
import 'package:flutter/material.dart';

import 'api/crypto.dart';
import 'api/remote.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override void initState(){
    super.initState();
    getData();

  }


  getData() async {
    Config.crypto = await Remote().getCrypto();
    
    //btcusd = 17 index

    if (Config.crypto != null) {
      for (int i = 0; i < Config.crypto!.resultsCount; i++) {
        if (Config.crypto!.results[i].t == "X:BTCUSD") {
          Config.btcIndex = i;
        }
        if (Config.crypto!.results[i].t == "X:DOGEUSD") {
          Config.dgIndex = i;
        }
        if (Config.crypto!.results[i].t == "X:LTCUSD") {
          Config.ltcIndex = i;
        }
        if (Config.crypto!.results[i].t == "X:ETHUSD") {
         Config.ethIndex = i;
        }
      }
      setState(() {
        Config.loading = false;
      });

    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      home: HomePage()
    );
  }
}