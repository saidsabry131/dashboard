import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.error_rounded,
            size: 100,
            ),
            // Display your company name and logo
            
            SizedBox(height: 16),
            Text(
              'About us',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            // Add a brief summary of your company
            Text(
              'Our program is used to record data of different customers',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            // Include your mission statement
            Text(
              'Our mission is to empower people with easy ways to git them accounts and in more security place.',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            // Add contact information
            Text(
              'Contact us at: team@gmail.com',
              style: TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


 