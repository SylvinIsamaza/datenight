import 'package:DNL/view/components/CustomTile.dart';
import 'package:DNL/view/main/profile_overview.dart';
import 'package:DNL/view/main/widgets/bottom_navigation_bar.dart';
import 'package:DNL/view/notificationFlow/notification.dart';
import 'package:DNL/view/privacyflow/privacyPage.dart';
import 'package:DNL/view/subscriptionFlow/SubscriptionPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class User {
  String name;
  String avatar;

  User(this.name, this.avatar);
}

// ignore: must_be_immutable
class SettingPage extends StatelessWidget {
  final String emptyImage = 'assets/images/proSet.png';

  User user = User("Jenifer Smith", "assets/images/proSet.png");

  SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFE94057),
        body: Column(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    color: const Color(0xFFE94057),
                    padding: const EdgeInsets.only(
                        top: 88, bottom: 33, left: 33, right: 33),
                    child: const Column(
                      children: [
                        Text(
                          "Settings",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height - 227,
                    padding:
                        const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: Column(
                      children: [
                        if (user != Null)
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        width: 100,
                                        height: 100,
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Colors.black,
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 2.0,
                                          ),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          child: Image.asset(
                                            user.avatar,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      user.name,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        const SizedBox(height: 10),
                        CustomExpansionTile(
                            title: "My profile",
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ProfileOverview(userID: "1")));
                            }),
                        const SizedBox(height: 10),
                        CustomExpansionTile(
                            title: "My subscription",
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SubscriptionPage()));
                            }),
                        const SizedBox(height: 10),
                        CustomExpansionTile(
                            title: "Notifications",
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const NotificationPage()));
                            }),
                        const SizedBox(height: 10),
                        CustomExpansionTile(
                            title: "Privacy policy& condition",
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PrivacyPage()));
                            }),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 400,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              // Handle "Logout" button press by showing the confirmation dialog
                              _showLogoutConfirmationDialog(context);
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color(0xFFE94057)),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Log out',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            BottomNavBar(selectedIndex: 3)
          ],
        ));
  }

  Widget _buildExpansionTile(String title, navigate) {
    return Theme(
      data: ThemeData.dark(),
      child: GestureDetector(
          child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFFD1939B),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(color: Colors.black),
            ),
            const Icon(CupertinoIcons.right_chevron, size: 20),
          ],
        ),
      )),
    );
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Log out"),
              IconButton(
                icon: const Icon(Icons.close, color: Colors.red),
                onPressed: () {
                  // Close button pressed, close the dialog
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          content: Container(
            width: 300, // Adjust the width as needed
            child: const Text("Are you sure you want to log out?"),
          ),
          contentPadding:
              const EdgeInsets.all(20.0), // Adjust padding as needed
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          actions: [
            const SizedBox(
                width: 8.0), // Add spacing between close icon and buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    // Cancel button pressed, close the dialog
                    Navigator.of(context).pop();
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                        side: BorderSide(color: Color(0xFFE94057), width: 2.0),
                      ),
                    ),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                    ),
                  ),
                  child: const Text(
                    "Cancel",
                    style: TextStyle(
                      color: Color(0xFFE94057),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0), // Add spacing between buttons
                ElevatedButton(
                  onPressed: () {
                    // Logout button pressed, navigate to the home page
                    Navigator.of(context).pop(); // Close the dialog
                    // Navigate to the home page (Replace it with your actual home page route)
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFFE94057)),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                        side: BorderSide(color: Color(0xFFE94057), width: 2.0),
                      ),
                    ),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                    ),
                  ),
                  child: const Text(
                    "Log out",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
