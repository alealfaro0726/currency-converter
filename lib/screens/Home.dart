// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace
import 'package:current_convert/api/Config.dart';
import 'package:current_convert/api/cRemote.dart';
import 'package:current_convert/api/remote.dart';
import 'package:current_convert/screens/Photo.dart';
import 'package:current_convert/widgets/dropdown.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../api/crypto.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String dropdownValue = "USD";

  final _controller = TextEditingController();

  var amoun = "";
  var total = "";

  @override
  void initState() {
    super.initState();
    TimeOfDay tod = new TimeOfDay.now();

    print(tod);
    print(_controller.text);
  }

  getData() async {
    Config.vals = await cRemote()
        .getCrypto(Config.to, "USD", "23"); //make the widget refresh
      setState(() {
          total = (Config.vals!.result.rate * double.parse(amoun)).toStringAsFixed(2);      
        });
    
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final oCcy = new NumberFormat("#,##0.0000", "en_US");

    return Config.loading
        ? Scaffold(
            backgroundColor: Colors.white,
            body: Center(
                child: CircularProgressIndicator(
              color: Colors.orange,
            )))
        : Scaffold(
            backgroundColor: Color(0xFFECECEE),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PhotoPage()));
              },
              backgroundColor: Colors.blue[900],
              child: Icon(
                Icons.camera_alt_outlined,
                size: 25,
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.endDocked,
            body: SingleChildScrollView(
              child: Stack(children: [
                Container(
                  height: size.height * 0.3,
                  decoration: BoxDecoration(
                      color: Color(0xFF1C4399),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                ),
                SafeArea(
                    child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Currency Converter",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(209, 238, 238, 238))),
                      SizedBox(height: 9),
                      Text("Welcome",
                          style: TextStyle(
                              fontSize: 33,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      SizedBox(height: 20),
                      Container(
                        height: 170,
                        width: size.width,
                        child: Container(
                          child: Column(children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              child: Row(
                                children: [
                                  Text("USD", style: TextStyle(fontSize: 17),),
                                  SizedBox(width: 140),
                                  Dropdown(),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 35.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 100,
                                    height: 70,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color.fromARGB(
                                                    121, 200, 197, 197)
                                                .withOpacity(0.5),
                                            spreadRadius: 3,
                                            blurRadius: 5,
                                            offset: Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextField(
                                        
                                        onSubmitted: (value) => {
                                          getData(),
                                          
                                          setState(() {
                                            amoun = value;
                                            Config.amount = value;
                                          }),
                                          Config.amount = value,
                                          print(Config.amount),
                                          print(Config.to),
                                          
                                        },
                                        controller: _controller,
                                        style: TextStyle(fontSize: 21 ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 100,
                                    height: 70,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color.fromARGB(
                                                    121, 200, 197, 197)
                                                .withOpacity(0.5),
                                            spreadRadius: 3,
                                            blurRadius: 5,
                                            offset: Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Config.amount != ""
                                            ?
                                            Text( total,   
                                                style: TextStyle(fontSize: 21),
                                              ) 
                                            : Text("0.00", style: TextStyle(fontSize: 21),),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ]),
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 5.5,
                              blurRadius: 5.5, // changes position of shadow
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Frequent Conversions"),
                          ],
                        )),
                      ),
                      SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Container(
                            child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('\$ 1.00 USD',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16)),
                                Text("€ 0.98",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16))
                              ],
                            ),
                            SizedBox(height: 40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('\€ 1.00',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16)),
                                Text(
                                  "\£ 0.85",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                )
                              ],
                            ),
                            SizedBox(height: 40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('\$ 1.00',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16)),
                                Text("¥ 138.32",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16))
                              ],
                            ),
                            SizedBox(height: 40),
                          ],
                        )),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Container(
                          child: Text("Cryptocurrency"),
                        ),
                      ),
                      Config.loading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : Container(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25, vertical: 30),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 140,
                                          height: 140,
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color.fromARGB(
                                                          121, 200, 197, 197)
                                                      .withOpacity(0.5),
                                                  spreadRadius: 3,
                                                  blurRadius: 5,
                                                  offset: Offset(0,
                                                      3), // changes position of shadow
                                                ),
                                              ],
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Bitcoin",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Config
                                                                .crypto!
                                                                .results[Config
                                                                    .btcIndex]
                                                                .c >=
                                                            Config
                                                                .crypto!
                                                                .results[Config
                                                                    .btcIndex]
                                                                .o
                                                        ? Icon(
                                                            Icons
                                                                .arrow_circle_up_outlined,
                                                            color: Colors.green,
                                                            size: 25,
                                                          )
                                                        : Icon(
                                                            Icons
                                                                .arrow_circle_down_sharp,
                                                            color: Colors.red,
                                                            size: 25,
                                                          )
                                                  ],
                                                ),
                                                SizedBox(height: 4),
                                                Text(
                                                    '\$${oCcy.format(Config.crypto!.results[Config.btcIndex].c)}',
                                                    style: TextStyle(
                                                        fontSize: 13)),
                                                SizedBox(height: 23),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Open: \$${oCcy.format(Config.crypto!.results[Config.btcIndex].o)} ",
                                                          style: TextStyle(
                                                              fontSize: 10),
                                                        ),
                                                        SizedBox(height: 4),
                                                        Text(
                                                          "High: \$${oCcy.format(Config.crypto!.results[Config.btcIndex].h)}",
                                                          style: TextStyle(
                                                              fontSize: 10),
                                                        ),
                                                        SizedBox(height: 4),
                                                        Text(
                                                          "Low: \$${oCcy.format(Config.crypto!.results[Config.btcIndex].l)}",
                                                          style: TextStyle(
                                                              fontSize: 10),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 140,
                                          height: 140,
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color.fromARGB(
                                                          121, 200, 197, 197)
                                                      .withOpacity(0.5),
                                                  spreadRadius: 3,
                                                  blurRadius: 5,
                                                  offset: Offset(0,
                                                      3), // changes position of shadow
                                                ),
                                              ],
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Ethereum",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Config
                                                                .crypto!
                                                                .results[Config
                                                                    .ethIndex]
                                                                .c >=
                                                            Config
                                                                .crypto!
                                                                .results[Config
                                                                    .ethIndex]
                                                                .o
                                                        ? Icon(
                                                            Icons
                                                                .arrow_circle_up_outlined,
                                                            color: Colors.green,
                                                            size: 27,
                                                          )
                                                        : Icon(
                                                            Icons
                                                                .arrow_circle_down_sharp,
                                                            color: Colors.red,
                                                            size: 27,
                                                          )
                                                  ],
                                                ),
                                                SizedBox(height: 4),
                                                Text(
                                                    "\$${oCcy.format(Config.crypto!.results[Config.ethIndex].c)}",
                                                    style: TextStyle(
                                                        fontSize: 13)),
                                                SizedBox(height: 23),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Open: \$${oCcy.format(Config.crypto!.results[Config.ethIndex].o)}",
                                                          style: TextStyle(
                                                              fontSize: 10),
                                                        ),
                                                        SizedBox(height: 4),
                                                        Text(
                                                          "High: ${oCcy.format(Config.crypto!.results[Config.ethIndex].h)}",
                                                          style: TextStyle(
                                                              fontSize: 10),
                                                        ),
                                                        SizedBox(height: 4),
                                                        Text(
                                                          "Low: \$${oCcy.format(Config.crypto!.results[Config.ethIndex].l)}",
                                                          style: TextStyle(
                                                              fontSize: 10),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25, vertical: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 140,
                                          height: 140,
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color.fromARGB(
                                                          121, 200, 197, 197)
                                                      .withOpacity(0.5),
                                                  spreadRadius: 3,
                                                  blurRadius: 5,
                                                  offset: Offset(0,
                                                      3), // changes position of shadow
                                                ),
                                              ],
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Column(
                                              // crossAxisAlignment: CrossAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text("Doge Coin",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                    Config
                                                                .crypto!
                                                                .results[Config
                                                                    .dgIndex]
                                                                .c >=
                                                            Config
                                                                .crypto!
                                                                .results[Config
                                                                    .dgIndex]
                                                                .o
                                                        ? Icon(
                                                            Icons
                                                                .arrow_circle_up_outlined,
                                                            color: Colors.green,
                                                            size: 27,
                                                          )
                                                        : Icon(
                                                            Icons
                                                                .arrow_circle_down_sharp,
                                                            color: Colors.red,
                                                            size: 27,
                                                          )
                                                  ],
                                                ),
                                                SizedBox(height: 4),
                                                Text(
                                                  "\$${oCcy.format(Config.crypto!.results[Config.dgIndex].c)}",
                                                  style:
                                                      TextStyle(fontSize: 13),
                                                ),
                                                SizedBox(height: 23),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Open: \$${oCcy.format(Config.crypto!.results[Config.dgIndex].o)}",
                                                          style: TextStyle(
                                                              fontSize: 10),
                                                        ),
                                                        SizedBox(height: 4),
                                                        Text(
                                                          "High: \$${oCcy.format(Config.crypto!.results[Config.dgIndex].h)}",
                                                          style: TextStyle(
                                                              fontSize: 10),
                                                        ),
                                                        SizedBox(height: 4),
                                                        Text(
                                                          "Low: \$${oCcy.format(Config.crypto!.results[Config.dgIndex].l)}",
                                                          style: TextStyle(
                                                              fontSize: 10),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 140,
                                          height: 140,
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color.fromARGB(
                                                          121, 200, 197, 197)
                                                      .withOpacity(0.5),
                                                  spreadRadius: 3,
                                                  blurRadius: 5,
                                                  offset: Offset(0,
                                                      3), // changes position of shadow
                                                ),
                                              ],
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Litecoin",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Config
                                                                .crypto!
                                                                .results[Config
                                                                    .ltcIndex]
                                                                .c >=
                                                            Config
                                                                .crypto!
                                                                .results[Config
                                                                    .ltcIndex]
                                                                .o
                                                        ? Icon(
                                                            Icons
                                                                .arrow_circle_up_outlined,
                                                            color: Colors.green,
                                                            size: 27,
                                                          )
                                                        : Icon(
                                                            Icons
                                                                .arrow_circle_down_sharp,
                                                            color: Colors.red,
                                                            size: 27,
                                                          )
                                                  ],
                                                ),
                                                SizedBox(height: 4),
                                                Text(
                                                    "\$${oCcy.format(Config.crypto!.results[Config.ltcIndex].c)}",
                                                    style: TextStyle(
                                                        fontSize: 13)),
                                                SizedBox(height: 23),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Open: \$${oCcy.format(Config.crypto!.results[Config.ltcIndex].o)}",
                                                          style: TextStyle(
                                                              fontSize: 10),
                                                        ),
                                                        SizedBox(height: 4),
                                                        Text(
                                                          "High: \$${oCcy.format(Config.crypto!.results[Config.ltcIndex].h)}",
                                                          style: TextStyle(
                                                              fontSize: 10),
                                                        ),
                                                        SizedBox(height: 4),
                                                        Text(
                                                          "Low: \$${oCcy.format(Config.crypto!.results[Config.ltcIndex].l)}",
                                                          style: TextStyle(
                                                              fontSize: 10),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                    ],
                  ),
                )),
              ]),
            ));
  }
}
