import 'package:flutter/material.dart';
import 'package:matching/main.dart';

import 'package:matching/screens/login_page.dart';
import 'package:matching/data/app_data.dart';



class WidgetCloseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool goBack;
  final String lastPageDirection;

  const WidgetCloseAppBar({
    super.key,
    this.goBack = false,
    this.lastPageDirection ="/",
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Styl.azulProfundo,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pushNamed(context, lastPageDirection);

          },
        
        icon: goBack
            ? const Icon (
                Icons.arrow_back,
                color: Styl.cieloNevado,
              )
            : const Icon (
                Icons.close,
                color: Styl.cieloNevado,
              ),
      ),
    );
  }

  // Required to satisfy the PreferredSizeWidget interface
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
