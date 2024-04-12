import 'package:flutter/material.dart';
import '../bot/providers/active_theme_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const name = "Rohit";
const fullName = "Rohit Kushwaha";
const bio = "Certified Nerd.";

class ProfilePage extends StatelessWidget implements PreferredSizeWidget {
  ProfilePage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    @override
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10)
                      .copyWith(top: 20),
                  padding: const EdgeInsets.symmetric(vertical: 22)
                      .copyWith(left: 5, right: 20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).colorScheme.secondary,
                        offset: const Offset(
                          2.0,
                          2.0,
                        ),
                        blurRadius: 5.0,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/profiles/${name}1.png',
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            fullName,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          // const SizedBox(height: 5),
                          Text(
                            bio,
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: Colors.white,
                                    ),
                          ),
                          const SizedBox(height: 4),
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.edit,
                            ),
                            label: const Text("Edit Profile"),
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14)),
                              foregroundColor: Colors.white,
                              backgroundColor: Theme.of(context).primaryColor,
                              side: const BorderSide(
                                  color: Colors.white, width: 2),
                              fixedSize: Size(w / 2, 10),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                // sign in button
                const SizedBox(height: 20),
                buttton(() {}, context, "Badges"),
                const SizedBox(height: 5),
                buttton(() {}, context, "Records"),
                const SizedBox(height: 5),
                buttton(() {}, context, "Appointments"),
                const SizedBox(height: 5),
                buttton(() {}, context, "Settings"),
                const SizedBox(height: 5),
                buttton(() {}, context, "About Us"),

                SizedBox(
                  height: 150,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(left: w / 3),
                    child: const Toggle(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}

class Toggle extends StatelessWidget {
  const Toggle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Consumer(
            builder: (context, ref, child) => Image.asset(
              ref.watch(activeThemeProvider) == Themes.dark
                  ? "assets/logo_on_dark.png"
                  : "assets/logo_on_light.png",
            ),
          ),
        ],
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  Function()? onTap;
  var label = "Sign In";
  return buttton(onTap, context, label);
}

GestureDetector buttton(onTap, BuildContext context, String label) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(18),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSecondary,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    ),
  );
}
