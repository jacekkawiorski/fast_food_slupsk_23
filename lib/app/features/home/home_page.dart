import 'package:fast_food_slupsk_23/app/features/home/add_opinon/add_opinion_page_content.dart';
import 'package:fast_food_slupsk_23/app/features/home/my_account/my_account_page_content.dart';
import 'package:fast_food_slupsk_23/app/features/home/restaurants/restaurants_page_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fast Food Słupsk')),
      body: Builder(builder: (context) {
        if (currentIndex == 0) {
          return const RestaurantsPageCcontent();
        }
        if (currentIndex == 1) {
          return AddOpinionPageCcontent(onSave: () {
            setState(() {
              currentIndex = 0;
            });
          });
        }

        return MyAccountPageContent(email: widget.user.email);
      }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.reviews),
            label: "Opinie",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Dodaj",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Moje konto",
          ),
        ],
      ),
    );
  }
}
