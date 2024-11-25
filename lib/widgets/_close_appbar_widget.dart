import 'package:flutter/material.dart';

import 'package:matching/screens/_login_signin.dart';

class WidgetCloseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool goBack;
  final Widget? lastPage; 

  const WidgetCloseAppBar({
    super.key,
    this.goBack = false,
    this.lastPage,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          if (goBack) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => lastPage!),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignInLogIn()),
            );
          }
        },
        icon: goBack
            ? const Icon (
                Icons.arrow_back,
                color: Colors.black,
              )
            : const Icon (
                Icons.close,
                color: Colors.black,
              ),
      ),
    );
  }

  // Required to satisfy the PreferredSizeWidget interface
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
