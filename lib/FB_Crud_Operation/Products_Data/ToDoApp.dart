import 'package:firebase/FB_Crud_Operation/Products_Data/Data_controler.dart';
import 'package:firebase/FB_Crud_Operation/model/model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  @override
  Widget build(BuildContext context) {
    final updateName = TextEditingController();
    final updatePrice = TextEditingController();
    final name = TextEditingController();
    final price = TextEditingController();

    // get put initialized .. 
    final controler = Get.put(DataControler());
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Task Manager'),
      ),
      // show data after fatching ....
      body: FutureBuilder(
          future: controler.GetData(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }

            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final product = snapshot.data![index];
                return Container(
                  padding: const EdgeInsets.all(15),
                  margin:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    title: Text(product.name),
                    // data update and delete from user interface ..
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(product.price.toString()),
                        SizedBox(width: 10),
                        // Update button...
                        IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  // show in edit field ..
                                  updateName.text = product.name;
                                  updatePrice.text = product.price;
                                  // Alert section ..
                                  return AlertDialog(
                                    title: const Text('Update Item'),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextFormField(
                                          controller: updateName,
                                          decoration: const InputDecoration(
                                              labelText: 'Name',
                                              prefixIcon:
                                                  const Icon(Icons.edit)),
                                        ),
                                        const SizedBox(height: 15),
                                        TextFormField(
                                          controller: updatePrice,
                                          decoration: const InputDecoration(
                                              labelText: 'Price',
                                              prefixIcon: Icon(Icons.edit)),
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      // Update product..
                                      TextButton(
                                          onPressed: () {
                                            controler.UpdateData(product.id, {
                                              'Name': updateName.text,
                                              'Price': updatePrice.text
                                            });
                                            Navigator.pop(context);
                                            setState(() {});
                                          },
                                          child: const Text('Update'))
                                    ],
                                  );
                                },
                              );
                            },
                            icon: Icon(Icons.edit)),

                        // delete button ..
                        IconButton(
                            onPressed: () {
                              controler.DeleteData(product.id);
                              setState(() {});
                            },
                            icon: Icon(Icons.delete)),
                      ],
                    ),
                  ),
                );
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Add Product Data '),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //name field ..
                      TextFormField(
                        controller: name,
                        decoration: const InputDecoration(
                            labelText: 'Name',
                            prefixIcon: const Icon(Icons.edit)),
                      ),
                      const SizedBox(height: 15),
                      // price field ..
                      TextFormField(
                        controller: price,
                        decoration: const InputDecoration(
                            labelText: 'Price', prefixIcon: Icon(Icons.edit)),
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          controler.PostUser(ProductModel(
                              name: name.text, id: '', price: price.text));

                          Navigator.pop(context);
                          setState(() {});
                        },
                        child: const Text('Add'))
                  ],
                );
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
