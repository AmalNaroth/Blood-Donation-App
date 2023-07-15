import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdateDetails extends StatelessWidget {
   UpdateDetails({super.key});

  final boolGroup=["A-","A+","B-","B+","O","O-","AB+","AB-"];

   TextEditingController donorName=TextEditingController();
    TextEditingController donorphone=TextEditingController();
   String? selectedGroup;

   final CollectionReference donor=FirebaseFirestore.instance.collection("doner");

   void detatilsupdate(donorid){
    final data={
      "name" : donorName.text,
      "phone" : int.parse(donorphone.text),
      "group" : selectedGroup
    };
    donor.doc(donorid).update(data);
    }


  @override
  Widget build(BuildContext context) {
    final args=ModalRoute.of(context)!.settings.arguments as Map;
    donorName.text=args['name'];
    donorphone.text=args['phone'].toString();
    selectedGroup=args['group'];
    final donorid=args['id'];
    return Scaffold(
      appBar: AppBar(title: Text("Update Details"),),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 20,),
            TextFormField(
             controller: donorName,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Donar Name"),
              ),
              keyboardType: TextInputType.name,
              maxLength: 20,
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: donorphone,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Donar Age")
              ),
              keyboardType: TextInputType.number,
              maxLength: 3,
            ),
            DropdownButtonFormField(
              value: selectedGroup,
              decoration: InputDecoration(
                label: Text("Select Blood Group")
              ),
              items:
              boolGroup.map((e) => DropdownMenuItem(child: Text(e),
              value: e,)).toList(), onChanged:(value) {
              selectedGroup=value as String?;
            },),
            ElevatedButton(
              style: ButtonStyle(
               minimumSize: MaterialStatePropertyAll(Size(double.infinity,50)),
               backgroundColor: MaterialStatePropertyAll(Colors.red)
              ),
              onPressed: (){
                Navigator.pop(context);
                detatilsupdate(donorid);
                donorName.clear();
                donorphone.clear();
                boolGroup.clear();
              }, child: Text("Update"))
          ],
        ),
      ),
    );
  }
}