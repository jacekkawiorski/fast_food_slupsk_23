import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddOpinionPageCcontent extends StatefulWidget {
  const AddOpinionPageCcontent({
    Key? key,
  }) : super(key: key);

  @override
  State<AddOpinionPageCcontent> createState() => _AddOpinionPageCcontentState();
}

class _AddOpinionPageCcontentState extends State<AddOpinionPageCcontent> {
  var restaurantName = "";
  var foodName = '';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: 'Podaj nazwę lokalu',
              ),
              onChanged: (newValue) {
                setState(() {
                  restaurantName = newValue;
                });
              },
            ),
            const SizedBox(height: 40),
            TextField(
              decoration: const InputDecoration(
                hintText: "Podaj nazwę fast food'a",
              ),
              onChanged: (newValue) {
                setState(() {
                  foodName = newValue;
                });
              },
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                FirebaseFirestore.instance.collection('restaurants').add({
                  'food': foodName,
                  'name': restaurantName,
                  'rating': 3.0,
                });
              },
              child: const Text('Dodaj opinie'),
            )
          ],
        ),
      ),
    );
  }
}
