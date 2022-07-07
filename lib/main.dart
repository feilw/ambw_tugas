// import 'dart:ffi';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:networkingfl/apiservice.dart';
import 'package:networkingfl/dataclass.dart';
import 'package:networkingfl/detail.dart';
import 'package:networkingfl/tambahdata.dart';

void main() {
  runApp(MaterialApp(
    home: Myapp(),
  ));
}

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  Service serviceAPI = Service();
  late Future<List<cData>> listData;

  //  String get palamat => null;
  static const snackBar = SnackBar(
    content: Text('Deleted!'),
  );

  @override
  void initState() {
    //TODO: implement initState
    super.initState();
    listData = serviceAPI.getAllData();
  }

  final TextEditingController _inputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TambahData()),
            );
          },
          isExtended: true,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          icon: Icon(Icons.supervised_user_circle),
          label: Text('Tambah data'),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          title: Text("Coba Widget"),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                child: FutureBuilder<List<cData>>(
                  future: listData,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<cData> isiData = snapshot.data!;
                      return ListView.builder(
                        itemCount: isiData.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              title: Text(isiData[index].cnama),
                              leading: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(isiData[index].cavatar),
                              ),
                              subtitle: Text(isiData[index].cpekerjaan),
                              trailing: Column(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            new MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailPage(snapshot
                                                        .data![index])));
                                      },
                                      child: Icon(Icons.description),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        //call your onpressed function here
                                        delData(isiData[index].cid);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);

                                        // print(isiData[index].cid);
                                      },
                                      child: Icon(Icons.delete),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return const CircularProgressIndicator();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void delData(String id) async {
    //fungsi delete
    bool response = await serviceAPI.deleteData(id);

    //klo berhasil
    if (response == true) {
      setState(() {
        //ini bakal nampilin list baru langsung
        listData = serviceAPI.getAllData();
      });
    } else {
      log("error delete failed");
    }
  }

  void showData(String id) async {
    cData response = await serviceAPI.getSingleData(id);
    log("data = ${response.cnama} - ${response.cemail}");
  }
}
