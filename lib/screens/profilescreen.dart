import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/AuthenticationService.dart';

class UserProfilePage extends StatefulWidget {
  final User? user; // User object retrieved from Firebase

  UserProfilePage({required this.user});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
        automaticallyImplyLeading: true,
        actions: [
          IconButton(
              onPressed: (){

              },
              icon: Icon(Icons.logout_outlined))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${widget.user!.displayName}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Email: ${widget.user!.email}',
              style: TextStyle(fontSize: 18),
            ),
            // Add more fields to display other user data
          ],
        ),
      ),
    );
  }
}
