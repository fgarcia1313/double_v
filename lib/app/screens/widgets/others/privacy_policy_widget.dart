import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/global/global_color.dart';
import '../button/button_transparent.dart';

class PrivacyPolicyWidget extends StatelessWidget {
  final double width;
  final VoidCallback onPrivacyPolicies;
  final VoidCallback onTermsOfService;

  const PrivacyPolicyWidget({
    super.key,
    required this.width,
    required this.onPrivacyPolicies,
    required this.onTermsOfService,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Card(
        color: cGrayTransparent,
        margin: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Text(
                'privacy_policies'.tr,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'home_privacy_policies_text'.tr,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(
                width: 250,
                child: ButtonTransparent(
                  text: 'privacy_policies'.tr,
                  onPressed: onPrivacyPolicies,
                  icon: Icons.visibility,
                  iconColor: cGreen,
                ),
              ),
              SizedBox(
                width: 250,
                child: ButtonTransparent(
                  text: 'terms_of_service'.tr,
                  onPressed: onTermsOfService,
                  icon: Icons.visibility,
                  iconColor: cGreen,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
