import 'package:flutter/material.dart';
import 'package:flutter_assignment/constants/global_variables.dart';
import 'package:flutter_assignment/data/dummy_data.dart';
import 'package:flutter_assignment/widgets/contact_screen_widget.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalVariables.primaryColor,
        title: Text('My Contacts', style: GlobalVariables.largeText),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.person_add_alt_rounded, size: 30),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            final contact = contacts[index];

            return buildContactCard(context, contact, size);
          },
        ),
      ),
    );
  }
}
