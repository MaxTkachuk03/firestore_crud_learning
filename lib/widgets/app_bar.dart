import 'package:firestore_crud_learning/generated/l10n.dart';
import 'package:firestore_crud_learning/resources/resources.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key, this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      centerTitle: true,
      title: Text(S.of(context).yourNotes, style: AppStyles.titleTextStyle),
      actions: [
        IconButton.filled(
          onPressed: onPressed,
          icon: AppIcons.themeIcon,
          color: Theme.of(context).colorScheme.inversePrimary,
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
