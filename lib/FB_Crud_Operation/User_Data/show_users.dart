import 'package:firebase/signUpPages/signup_controler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowUsers extends StatefulWidget {
  const ShowUsers({super.key});

  @override
  State<ShowUsers> createState() => _ShowUsersState();
}

class _ShowUsersState extends State<ShowUsers> {
  @override
  Widget build(BuildContext context) {
    final controler = Get.put(SignupControler());

    return Scaffold(
      appBar: AppBar(title: Text('User Data ')),
      // show data in page
      body: FutureBuilder(
        future: controler.showUsers(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final user = snapshot.data![index];
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(user.fullname),
                                const SizedBox(height: 5),
                                Text(user.phone),
                                const SizedBox(height: 5),
                                Text(user.email),
                                const SizedBox(height: 5),
                                Text(user.password),
                              ],
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      controler.fullname.text = user.fullname;
                                      controler.phone.text = user.phone;

                                      return AlertDialog(
                                        title:
                                            const Text('Update Name & Phone'),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            // full name ..
                                            TextFormField(
                                              controller: controler.fullname,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                labelText: 'FullName',
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            // full name ..
                                            TextFormField(
                                              controller: controler.phone,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                labelText: 'Phone',
                                              ),
                                            ),
                                          ],
                                        ),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                controler.UpdateData(user.id, {
                                                  'FullName':
                                                      controler.fullname.text,
                                                  'Phone': controler.phone.text
                                                });
                                                Navigator.pop(context);
                                                setState(() {
                                                  
                                                });
                                              },
                                              child: const Text('Update'))
                                        ],
                                      );
                                    });
                              },
                              icon: Icon(Icons.edit)),
                          const SizedBox(width: 10),
                          IconButton(
                              onPressed: () {}, icon: Icon(Icons.delete)),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
