import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SettingsProfile extends StatefulWidget {
  final String Email;

  const SettingsProfile({super.key, required this.Email});

  @override
  State<SettingsProfile> createState() => _SettingsProfileState();
}

class _SettingsProfileState extends State<SettingsProfile> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _uploadImage() async {
    try {
      await firebase_storage.FirebaseStorage.instance
          .ref('profile_images/${widget.Email}')
          .putFile(_imageFile!);
      print('Image uploaded.');
    } catch (e) {
      print('Failed to upload image: $e');
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
        _uploadImage;
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> _deleteImage() async {
    try {
      await firebase_storage.FirebaseStorage.instance
          .ref('profile_images/${widget.Email}')
          .delete();
      print('Image deleted.');
    } catch (e) {
      print('Failed to delete image: $e');
    }
  }

  final UserCollection =
      FirebaseFirestore.instance.collection('Register_Student');
  final currentUser = FirebaseAuth.instance.currentUser!;
  //Bo goriny nawakan
  Future<void> EdidFild(String field) async {
    String newValue = '';
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Center(
          child: Text(
            field + ' گۆرانکاری',
            style: TextStyle(color: Colors.blue.shade900),
          ),
        ),
        content: TextField(
          autocorrect: true,
          decoration: InputDecoration(
            hintText: '$field نوێکردنەوەی ',
          ),
          onChanged: (value) {
            newValue = value;
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'پەشیمان بونەوە',
              style: TextStyle(color: Colors.red, fontSize: 15),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(newValue),
            child: Text(
              'گۆڕین',
              style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
        ],
      ),
    );
    //Update Data
    if (newValue.trim().length > 2) {
      await UserCollection.doc(widget.Email).update({field: newValue});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('دەستکاریکردنی پڕۆفایل'),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new)),
        backgroundColor: Colors.amber.withOpacity(0.5),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("Register_Student")
            .doc(widget.Email)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final userData = snapshot.data!.data() as Map<String, dynamic>;
            return ListView(
              children: [
                SizedBox(
                  height: 15,
                ),
                //Profile Picture
                Stack(
                  alignment: Alignment.center,
                  children: [
                    _imageFile != null
                        ? Image.file(_imageFile!)
                        : userData.containsKey('image_url')
                            ? Image.network(userData['image_url'])
                            : CircleAvatar(
                                // You can add default avatar here
                                radius: 50,
                                backgroundColor: Colors.grey,
                              ),
                    IconButton(
                      onPressed: () => _pickImage(ImageSource.gallery),
                      icon: Icon(Icons.camera_alt),
                    ),
                    Positioned(
                      top: 1,
                      left: 325,
                      child: IconButton(
                        onPressed: _deleteImage,
                        icon: Icon(
                          Icons.remove_circle,
                          color: Colors.red,
                          size: 25,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                    child: Text(widget.Email,
                        style: TextStyle(
                            color: Colors.blue.shade900, fontSize: 20))),
                //User Email
                SizedBox(
                  height: 25,
                ),
                //User Detail

                Center(
                  child: Text(
                    'زانیاری بەکارهێنەر',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                ),

                //username
                TextBox(
                  text: userData["FirstName"],
                  sectionName: "دەستکاری کردنی ناو",
                  onPressed: () => EdidFild('FirstName'),
                ),
                TextBox(
                  text: userData['LastName'],
                  sectionName: "دەستکاری کردنی ناوی دووەم",
                  onPressed: () => EdidFild('FirstName'),
                ),
                //Bio
                TextBox(
                    text: userData["Phone"],
                    sectionName: "دەستکاری ژمارەی مۆبایل",
                    onPressed: () => EdidFild('Phone')),
                //User Social Media
                SizedBox(
                  height: 25,
                ),
                Center(
                    child: Text('سۆشیال میدیا',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17))),
                TextBox(
                    text: userData["Facebook"],
                    sectionName: "دانانی لینکی فەیسبووک ",
                    onPressed: () => EdidFild('Facebook')),

                TextBox(
                    text: userData["Instagram"],
                    sectionName: "دانانی لینکی ئینستاگرام",
                    onPressed: () => EdidFild('Instagram')),

                TextBox(
                    text: userData["Youtube"],
                    sectionName: "دانانی لینکی یوتوب",
                    onPressed: () => EdidFild('Youtube')),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error" + snapshot.error.toString()),
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}

class TextBox extends StatelessWidget {
  final String text;
  final String sectionName;
  final void Function()? onPressed;
  const TextBox(
      {super.key,
      required this.text,
      required this.sectionName,
      required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(8)),
      padding: EdgeInsets.only(left: 15, bottom: 15),
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                sectionName,
                style: TextStyle(color: Colors.grey.shade900),
              ),
              IconButton(
                onPressed: onPressed,
                icon: Icon(Icons.edit, color: Colors.grey.shade500),
              ),
            ],
          ),
          Text(text),
        ],
      ),
    );
  }
}
