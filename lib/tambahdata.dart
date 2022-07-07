import 'package:flutter/material.dart';
import 'package:networkingfl/apiservice.dart';
import 'package:networkingfl/main.dart';
import 'dataclass.dart';

class TambahData extends StatefulWidget {
  @override
  _TambahDataState createState() => _TambahDataState();
}

class _TambahDataState extends State<TambahData> {
  var _formKey = GlobalKey<FormState>();
  var isLoading = false;
  late Future<List<cData>> listData;
  Service serviceAPI = Service();

  // Controller
  TextEditingController _namaController = TextEditingController();
  TextEditingController _avatarController = TextEditingController();
  TextEditingController _alamatController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _pekerjaanController = TextEditingController();
  TextEditingController _quoteController = TextEditingController();

  static const snackBar = SnackBar(
    content: Text('Success!'),
  );

  void _submit() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      bool response = await serviceAPI.postData(
          _namaController.text,
          _avatarController.text,
          _alamatController.text,
          _emailController.text,
          _pekerjaanController.text,
          _quoteController.text);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Future.delayed(Duration(seconds: 3), () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  Myapp()), // this mymainpage is your page to refresh
          (Route<dynamic> route) => false,
        );
      });
      return;
    }
    _formKey.currentState?.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah data baru"),
      ),
      //body
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        //form
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              // nama
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'nama'),
                controller: _namaController,
                onFieldSubmitted: (value) {
                  //Validator
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Field is required!';
                  }
                  return null;
                },
              ),

              // avatar
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'avatar'),
                controller: _avatarController,
                onFieldSubmitted: (value) {
                  //Validator
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Field is required!';
                  }
                  return null;
                },
              ),

              // alamat
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'alamat'),
                controller: _alamatController,
                onFieldSubmitted: (value) {
                  //Validator
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Field is required!';
                  }
                  return null;
                },
              ),

              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'E-Mail'),
                keyboardType: TextInputType.emailAddress,
                onFieldSubmitted: (value) {
                  //Validator
                },
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                    return 'Enter a valid email!';
                  }
                  return null;
                },
              ),

              // pekerjaan
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'pekerjaan'),
                controller: _pekerjaanController,
                onFieldSubmitted: (value) {
                  //Validator
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Field is required!';
                  }
                  return null;
                },
              ),

              // Quote
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Quote'),
                controller: _quoteController,
                onFieldSubmitted: (value) {
                  //Validator
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Field is required!';
                  }
                  return null;
                },
              ),

              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              RaisedButton(
                padding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 15.0,
                ),
                child: Text(
                  "Submit",
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                ),
                onPressed: () => _submit(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
