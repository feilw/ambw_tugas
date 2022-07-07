import 'package:flutter/material.dart';
import 'package:networkingfl/dataclass.dart';

class DetailPage extends StatelessWidget {

  final cData cdata;

  DetailPage(this.cdata);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
          Text(cdata.cnama),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 6.0), //Same as `blurRadius` i guess
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade200,
                                  offset: Offset(0.0, 1.0), //(x,y)
                                  blurRadius: 6.0,
                                ),
                              ],
                        ),
                        child: Column(
                          children: [
                            // Avatar
                            CircleAvatar(
                              radius: 60.0,
                              backgroundImage:
                                  NetworkImage(cdata.cavatar),
                              backgroundColor: Colors.transparent,
                            ),

                            // Nama
                            Text(
                              cdata.cnama,
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                            ),

                            // Alamat
                            Text(
                              cdata.calamat,
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            
                            // Email
                            Text(
                              cdata.cemail,
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                            ),

                            // Pekerjaan
                            Text(
                              cdata.cpekerjaan,
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                            ),

                            SizedBox(height: 20.0,),

                            // Quote
                            Text(
                              "\"${cdata.cquote}\"",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, fontStyle: FontStyle.italic),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "- ${cdata.cnama}",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
    );
  }
}