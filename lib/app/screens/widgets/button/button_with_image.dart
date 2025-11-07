import 'package:flutter/material.dart';

import '../../../../utils/global/global_color.dart';

class ButtonWithImage extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final String image;

  const ButtonWithImage({
    super.key,
    required this.text,
    required this.onPressed,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: cTransparent,
        foregroundColor: cSecondary,
        padding: const EdgeInsets.only(top: 15, bottom: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: BorderSide(color: cPrimary, width: 1.5),
        ),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: Image.asset(
                  image,
                  height: 30,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Center(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
