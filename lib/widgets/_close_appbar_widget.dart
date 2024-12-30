import 'package:flutter/material.dart';
import 'package:matching/main.dart';

import 'package:matching/screens/login_page.dart';
import 'package:matching/data/app_data.dart';



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
      backgroundColor: Styl.bgBase,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
        
            Navigator.pop(context); 

          },
        
        icon: goBack
            ? const Icon (
                Icons.arrow_back,
                color: Styl.textColorBase,
              )
            : const Icon (
                Icons.close,
                color: Styl.textColorBase,
              ),
      ),
    );
  }

  // Required to satisfy the PreferredSizeWidget interface
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
