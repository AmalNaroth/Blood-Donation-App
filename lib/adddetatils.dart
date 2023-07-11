import 'package:flutter/material.dart';

class AddDetatils extends StatelessWidget {
   AddDetatils({super.key});

  final boolGroup=["A-","A+","B-","B+","O","O-","AB+","AB-"];

  String? selectedGroup;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Add Doners"),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 20,),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Donar Name"),
              ),
              keyboardType: TextInputType.name,
              maxLength: 20,
            ),
            SizedBox(height: 10,),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Donar Age")
              ),
              keyboardType: TextInputType.number,
              maxLength: 3,
            ),
            DropdownButtonFormField(
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
               backgroundColor: MaterialStatePropertyAll(Colors.yellowAccent)
              ),
              onPressed: (){
                
              }, child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}