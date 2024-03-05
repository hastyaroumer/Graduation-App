import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Course extends StatefulWidget {
  final String Sem;
  final String College;
  const Course({
    super.key,
    required this.Sem,
    required this.College,
  });
  @override
  State<Course> createState() => _CourseState();
}

class _CourseState extends State<Course> {
  final Course_le = FirebaseFirestore.instance
      .collection("Course")
      .doc('w4Ml4o8oxfzOZjMAyc6Y')
      .snapshots();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      animationDuration: Duration(seconds: 1),
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50))),
          title: Center(
            child: Text('پەڕەی  کۆرسەکان'),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new)),
          backgroundColor: Colors.amber.withOpacity(0.7),
          bottom: TabBar(
            labelColor: Colors.blue.shade900,
            unselectedLabelStyle: TextStyle(color: Colors.blueGrey.shade700),
            dividerColor: Colors.transparent,
            indicatorColor: Colors.blue.shade900,
            tabs: [
              Tab(
                  icon: Icon(
                    Icons.video_file_outlined,
                    size: 30,
                  ),
                  child: Text(
                    'ڤیدیۆیەکان',
                  )),
              Tab(
                icon: Icon(
                  Icons.edit_document,
                  size: 30,
                ),
                child: Text(
                  'کۆرسەکان',
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.co_present_sharp,
                  size: 30,
                ),
                child: Text(
                  'سیمینارەکان',
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.blue.shade900.withOpacity(0.1),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("Course")
                  .doc('w4Ml4o8oxfzOZjMAyc6Y')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final userData =
                      snapshot.data!.data() as Map<String, dynamic>;

                  return TabBarView(children: [
                    Icon(Icons.video_file_outlined),
                    GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        childAspectRatio: 1,
                      ),
                      itemCount: 2,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              color: Colors.white,
                              boxShadow: [BoxShadow(blurRadius: 2)],
                              borderRadius: BorderRadius.circular(30)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Center(
                                child: Icon(
                                  Icons.folder,
                                  size: 100,
                                  color: Colors.amber.withOpacity(0.8),
                                ),
                              ),
                              Center(
                                child: Text(
                                  userData['CourseName'] + ' : ناوی وانە',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Center(
                                child: Text(
                                  ' :مامۆستای وانە',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                              Center(
                                child: Text(
                                  userData['TeacherName'],
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                              Center(
                                child: Text(
                                  userData['College'] +
                                      '- Semister ' +
                                      userData['CollegeSem'],
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                              Center(
                                child: Text(
                                  userData['Years'] + ' :ساڵی',
                                  style: TextStyle(
                                      fontSize: 9,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    Icon(Icons.co_present_sharp),
                  ]);
                }
                return isLoading ? CircularProgressIndicator() : SizedBox();
              },
            )),
      ),
    );
  }
}
