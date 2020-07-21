

import 'dart:io';

import 'package:docScanner/Screen/scanner_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AllDocuments extends StatefulWidget{
  @override
  _AllDocumentsState createState() => _AllDocumentsState();
}

class _AllDocumentsState extends State<AllDocuments>{
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  
  @override
  Widget build(BuildContext context) {

      Widget drawerMenu(String title, IconData icon, Function func) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
      leading: Icon(
        icon,
        color: Colors.blueGrey.shade900,
      ),
      onTap: func,
    );
  }

    return Scaffold(
      appBar: AppBar(
        title: Text("Docs Scan"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Color.fromRGBO(248, 251, 248, 2),
      drawer: Drawer(
        child: Container(
            child: Column(
          children: [
            Container(
              color: Colors.blueGrey.shade900,
              height: 180,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: CircleAvatar(child: Icon(Icons.account_circle, color: Colors.blueGrey.shade900,size: 50,), backgroundColor: Colors.teal, maxRadius: 25,),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 70,
                          left: 45
                        ),
                        child: Text("Prince Kumar", style: TextStyle(color: Colors.white, fontSize: 20),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 5,
                          left: 40
                        ),
                        child: Text("+91-8709960796", style: TextStyle(color: Colors.white, fontSize: 13),),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.teal,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    drawerMenu("About", Icons.info, null),
                    drawerMenu("Tags", Icons.label_outline, null),
                    drawerMenu("Help", Icons.help, null),
                    drawerMenu("Sign Out", Icons.subdirectory_arrow_left, null),
                  ],
                ),
              ),
            )
          ],
        )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return ScannerPage();
                }));
              },

                          child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Card(
                  elevation: 5,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.22,
                    width: double.infinity,
                    color: Color(0xFFeaeaea),
                    child: Row(
                      children: [
                        Container(
                          child: Image.asset("assets/images/pdf2.png",height: 150,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 50,
                            top: 20,
                          ),
                          child: Container(
                            child: Column(
                              children: [
                                Text("PrinceResume", style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text("Date", style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black38
                                    ),),
                                    SizedBox(
                                      width: 45,
                                    ),
                                    Text("12/07/2020", style: TextStyle(
                                      fontWeight: FontWeight.bold,color: Colors.black38
                                    ),),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text("Time", style: TextStyle(
                                      fontWeight: FontWeight.bold,color: Colors.black38
                                    ),),
                                    SizedBox(
                                      width: 55,
                                    ),
                                    Text("09:30 AM", style: TextStyle(
                                      fontWeight: FontWeight.bold,color: Colors.black38
                                    ),),
                                  ],
                                ),
                                SizedBox(
                                  height: 38,
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.share, color: Colors.blueGrey.shade900,),
                                SizedBox(
                                  width: 40,
                                ),
                                    Icon(Icons.delete, color: Colors.blueGrey.shade900,),
                                SizedBox(
                                  width: 30,
                                ),
                                    Icon(Icons.more_vert, color: Colors.blueGrey.shade900,),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // _image == null ?Container(): Image.file(_image)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: getImage , backgroundColor: Colors.teal,
      child: Icon(Icons.camera_alt, color: Colors.blueGrey.shade900,),),
    );
  }
}
