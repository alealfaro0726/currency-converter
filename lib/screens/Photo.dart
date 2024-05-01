import 'dart:io';
import 'package:current_convert/screens/Camera.dart';
import 'package:current_convert/screens/Home.dart';
import 'package:current_convert/widgets/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';


class PhotoPage extends StatefulWidget {
  const PhotoPage({Key? key}) : super(key: key);

  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  File? image;
  

Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
if(image == null) return;
final imageTemp = File(image.path);
setState(() => this.image = imageTemp);
    } on Exception catch(e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
if(image == null) return;
final imageTemp = File(image.path);
setState(() => this.image = imageTemp);
    } on Exception catch(e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFECECEE),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        },
        backgroundColor: Colors.blue[900],
        child: Icon(
          Icons.home_outlined,
          size: 25,
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
                
                decoration: BoxDecoration(
                  // color: Color(0xFF1C4399),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:24, vertical:75.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Currency Converter",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(209, 22, 18, 18))),
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: (){
                              pickImage();
                            },
                            child:Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(13),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.photo_camera_back_outlined,
                                    size: 35,
                                    color: Colors.amber[400],
                                  ),
                                  SizedBox(height: 20),
                                  GestureDetector(
                                      onTap: () {

                                      },
                                      child: Center(
                                          child: Text(
                                        "Select Image",
                                        style: TextStyle(
                                            color:
                                                Colors.amber[600],
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ))),
                                ],
                              )) ,
                          )
                          ,
                              GestureDetector(
                                onTap: () {
                                  pickCamera();
                                },
                                child: Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(13),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.photo_camera_outlined,
                                    size: 35,
                                    color: Color.fromARGB(255, 50, 205, 117),
                                  ),
                                  SizedBox(height: 20),
                                  GestureDetector(
                                      onTap: () {
                                      },
                                      child: Center(
                                          child: Text(
                                        "Take Photo",
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 38, 159, 90),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ))),
                                ],
                              )),
                              )
                          
                        ],
                      ),
                      
                    ],

                  ),
                )),

            Container(
              margin: EdgeInsets.only(top: 230),
              child: Padding(
                
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 40),
                  child: Column(
                    
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30),
                        Container(
                          width: size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14)),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Dropdown(),
                                Text(
                                  "To",
                                  style: TextStyle(),
                                ),
                                Dropdown(),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 190,
                          width: size.width,
                          child: Center(
                            child: Container(
                              child: Center(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Center(
                                            child: Container(
                                          child: Center(
                                              child: image == null ? Text(
                                            "No Image",
                                            style: TextStyle(fontSize: 25)) : Container( height: 187, child: Image.file(image!)) // make the images smaller and fit in the box
                                          ),
                                        )),
                                      ),
                                    ]),
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 243, 243, 243),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(31, 213, 211, 211),
                                spreadRadius: 5,
                                blurRadius: 5,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 50),
                        Text("Details"),
                      ])),
            )
          ],
        ),
      ),
    );
  }
}
