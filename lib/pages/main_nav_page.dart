import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../widgets/my_app_bar.dart';
import 'chat_screen.dart';
import 'habit_tracker.dart';
import 'home_page.dart';
import 'profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  List pages = [
    const HomePage(),
    const ChatScreen(),
    const HabitTracker(),
    ProfilePage()
  ];
  void signUserOut() {}

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    String userName = "Rohit";
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hi, $userName"),
              Text(
                "How are you feeling today?",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          actions: [
            const toggle(),
            IconButton(
              onPressed: () {},
              icon: const Icon(Ionicons.notifications_outline),
            ),
            IconButton(
              onPressed: signUserOut,
              icon: const Icon(Ionicons.log_out_outline),
            ),
          ],
        ),
        body: pages[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          onTap: onTap,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          showSelectedLabels: true,
          selectedItemColor: Theme.of(context).highlightColor,
          unselectedItemColor: Theme.of(context).colorScheme.onBackground,
          items: const [
            // home
            BottomNavigationBarItem(
              icon: Icon(Ionicons.home_outline),
              activeIcon: Icon(Ionicons.home),
              label: "Home",
            ),
            // chatbot
            BottomNavigationBarItem(
              icon: Icon(Ionicons.chatbubble_ellipses_outline),
              activeIcon: Icon(Ionicons.chatbubble_ellipses),
              label: "Chatbot",
            ),
            // Self-Help Features
            BottomNavigationBarItem(
              icon: Icon(Ionicons.calendar_outline),
              activeIcon: Icon(Ionicons.calendar),
              label: "Features",
            ),
            // profile & about
            BottomNavigationBarItem(
              icon: Icon(Ionicons.person_outline),
              activeIcon: Icon(Ionicons.person),
              label: "Profile",
            ),
          ],
        ));
  }
}
