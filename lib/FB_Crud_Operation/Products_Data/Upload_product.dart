import 'package:firebase/FB_Crud_Operation/Elebutton.dart';
import 'package:firebase/FB_Crud_Operation/Products_Data/Data_controler.dart';
import 'package:firebase/FB_Crud_Operation/model/model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Uploadproduct extends StatefulWidget {
  const Uploadproduct({super.key});

  @override
  State<Uploadproduct> createState() => _UploadproductState();
}

class _UploadproductState extends State<Uploadproduct> {
  @override
  Widget build(BuildContext context) {
    final controler = Get.put(DataControler());

     final name = TextEditingController();
    final price = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text('Upload Product Data')),
      body: Center(
        child: Container(
          height: 400,
          width: 350,
          decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: const Text('Data Upload on firebase !!',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.w400)),
              ),
              SizedBox(height: 20),
              
              SizedBox(
                width: 250,
                child: TextFormField(
                  controller: name,
                  decoration: InputDecoration(
                      labelText: 'Enter Product Name ',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                width: 250,
                child: TextFormField(
                  controller: price,
                  decoration: InputDecoration(
                      labelText: 'Enter Product Price ',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  EleButton(
                    name: 'Upload',
                    onpressed: () {
                      controler.PostUser(ProductModel(
                        name: name.text,
                        id:'',
                        price: price.text,
                      ));

                      // clear text field ..
                      controler.id.clear();
                      controler.name.clear();
                      controler.price.clear();

                      setState(() {});
                    },
                  ),
                  SizedBox(width: 10),
                  IconButton(
                      onPressed: () {
                        controler.id.clear();
                        controler.name.clear();
                        controler.price.clear();
                      },
                      icon: Icon(Icons.restart_alt))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
