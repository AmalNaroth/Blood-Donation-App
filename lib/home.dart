import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final CollectionReference donor=FirebaseFirestore.instance.collection('doner');

  void donordalete(docid){
    donor.doc(docid).delete();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Blood donate app"),
      ),
      body: StreamBuilder(
        stream: donor.orderBy('name').snapshots(),
        builder: (context,AsyncSnapshot snapshot) {
         if(snapshot.hasData){
          return ListView.builder(
            itemCount: snapshot.data?.docs.length,
            itemBuilder: (context, index) {
              final DocumentSnapshot donorsnap=snapshot.data.docs[index];
              
            return displaydetails(donorsnap);
          },);
         }
         return Center(child: CircularProgressIndicator(),); 
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.pushNamed(context, "/addUserDetails",);
      },backgroundColor: Colors.black,
      child:const Icon(Icons.add,color: Colors.white,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget displaydetails(DocumentSnapshot donorsnap){
    return Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 220, 220, 220),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(color: Colors.grey,
                  blurRadius: 2,
                  spreadRadius: 2)
                ]
              ),
              margin: EdgeInsets.only(top:10,left: 20,right: 20),
              padding: EdgeInsets.symmetric(vertical: 10),
              //height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Row(
                  children: [
                     Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 172, 172, 172),
                  radius: 25,
                  child: Text(donorsnap['group'],style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                  ),
                ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10,),
                      Row(
                        children: [
                          Text(donorsnap['name'],style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0),fontSize: 20,fontWeight: FontWeight.bold,),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          ),
                        ],
                      ),
                      Text(donorsnap['phone'].toString(),maxLines: 1,)
                    ],),
                  ],
                ),
                Row(children: [
                  IconButton(onPressed: (){
                    Navigator.pushNamed(context, '/updateDetails',
                    arguments: {
                      "name" : donorsnap["name"],
                      "phone" : donorsnap["phone"],
                      "group" : donorsnap['group'],
                      "id" :donorsnap.id
                    });
                  }, icon: Icon(Icons.edit)),
                IconButton(onPressed: (){
                  donordalete(donorsnap.id);
                }, icon: Icon(Icons.delete))
                ],)
              ],),
            );
  }
}