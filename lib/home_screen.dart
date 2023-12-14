import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_screen.dart'; // Import your login screen or wherever you handle authentication
import 'welcome_screen.dart'; // Import your WelcomeScreen

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20.0),
            TextField(
              focusNode: _searchFocusNode,
              controller: _searchController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Search...',
              ),
            ),
            const SizedBox(height: 20.0),

            Text('Welcome to the Home Screen!'),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                // Logout user
                await _auth.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen()), // Use WelcomeScreen instead of LoginScreen
                );
              },

              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
