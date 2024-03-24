import 'package:flick/presentation/login_signup_screens/controller/terms_and_condition_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/constants/constants.dart';

class CheckBoxText extends StatelessWidget {
  const CheckBoxText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Consumer<TermsAndConditionProvider>(builder: (context, termsProvider, _) {
      return Row(
        children: [
          IconButton(
              onPressed: () {
                if (!termsProvider.termsAndConditionAccepted.contains(true)) {
                  termsProvider.acceptTerm(true);
                } else {
                  termsProvider.rejectTerm(true);
                }
              },
              icon: termsProvider.termsAndConditionAccepted.contains(true)
                  ? const Icon(Icons.check_box, color: checkboxIconColor)
                  : const Icon(Icons.check_box_outline_blank, color: checkboxIconColor)),
          Text(text, style: const TextStyle(color: checkboxTextColor), maxLines: 2)
        ],
      );
    });
  }
}
