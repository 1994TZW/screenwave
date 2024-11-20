import '../widget/theme.dart' as theme;
import 'package:flutter/material.dart';

class LocalAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? label;
  final Color? backgroundColor;
  final Color? labelColor;
  final Color? arrowColor;
  final List<Widget>? actions;

  const LocalAppBar({
    super.key,
    this.label,
    this.backgroundColor = theme.backgroundColor,
    this.labelColor,
    this.arrowColor = theme.textColor,
    this.actions,
  });

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        splashRadius: 25,
        icon: Icon(Icons.arrow_back_ios, color: arrowColor, size: 23),
        onPressed: () => Navigator.of(context).pop(),
      ),
      shadowColor: Colors.transparent,
      backgroundColor: backgroundColor,
      surfaceTintColor: backgroundColor,
      title: label != null
          ? Text(
              label!,
              style: const TextStyle(color: theme.textColor, fontSize: 20),
            )
          : const SizedBox(),
      actions: actions,
    );
  }
}
