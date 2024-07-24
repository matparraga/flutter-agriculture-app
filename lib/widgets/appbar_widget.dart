import 'package:flutter/material.dart';
import 'package:practica1/constants.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: neutralColor,
      title: const Row(
        children: [
          Icon(
            Icons.eco,
            color: lightEsmeraldColor,
          ),
          SizedBox(
            width: 5.0,
          ),
          Text(
            "Greenside",
            style: TextStyle(color: lightEsmeraldColor, fontSize: 16),
          ),
        ],
      ),
      actions: [
        IconButton(
            onPressed: () async {
              supabaseClient.auth.signOut();
            },
            icon: const Icon(
              Icons.exit_to_app,
              color: whiteColor,
            ))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
