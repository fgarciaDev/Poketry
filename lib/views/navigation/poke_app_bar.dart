import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:poketry/data/providers/app_nav_provider.dart';
import 'package:provider/provider.dart';

class PokeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PokeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final title = Provider.of<AppNavProvider>(context).title;

    return AppBar(
      title: AutoSizeText(title,
          style: const TextStyle(
              fontFamily: 'CupertinoSystemDisplay',
              fontWeight: FontWeight.w500)),
      centerTitle: true,
      elevation: 1,
    );
  }
}
