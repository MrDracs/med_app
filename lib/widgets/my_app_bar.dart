import 'package:flutter/material.dart';
import '../bot/providers/active_theme_provider.dart';
import 'theme_switch.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      title: Text(
        'Flutter GPT',
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
      actions: [toggle()],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class toggle extends StatelessWidget {
  const toggle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Consumer(
            builder: (context, ref, child) => Icon(
              ref.watch(activeThemeProvider) == Themes.dark
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined,
            ),
          ),
          const SizedBox(width: 8),
          const ThemeSwitch(),
        ],
      ),
    );
  }
}
