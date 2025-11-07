import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utils/global/global_color.dart';

class ButtonCountry extends StatelessWidget {
  final String country;
  final VoidCallback onPressed;
  final String image;

  const ButtonCountry({
    super.key,
    required this.country,
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
                child: SvgPicture.network(
                  image,
                  width: 25,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    country,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
