import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddOpinionPageCcontent extends StatefulWidget {
  const AddOpinionPageCcontent({
    Key? key,
    required this.onSave,
  }) : super(key: key);

  final Function onSave;

  @override
  State<AddOpinionPageCcontent> createState() => _AddOpinionPageCcontentState();
}

class _AddOpinionPageCcontentState extends State<AddOpinionPageCcontent> {
  var restaurantName = "";
  var foodName = '';
  var rating = 3.0;

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
            Slider(
                onChanged: (newValue) {
                  setState(() {
                    rating = newValue;
                  });
                },
                value: rating,
                min: 1.0,
                max: 6.0,
                divisions: 10,
                label: rating.toString()),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: restaurantName.isEmpty || foodName.isEmpty
                  ? null
                  : () {
                      FirebaseFirestore.instance.collection('restaurants').add({
                        'food': foodName,
                        'name': restaurantName,
                        'rating': rating,
                      });
                      widget.onSave();
                    },
              child: const Text('Dodaj opinie'),
            )
          ],
        ),
      ),
    );
  }
}
