import 'package:flutter/material.dart';
import 'package:monei_portfolio/commun/constents/colors.dart';
import 'package:monei_portfolio/commun/constents/text_styles.dart';

enum EventStatus {
  success,
  fail
}

class Messangers {
  static void snackBar(BuildContext context, {EventStatus? eventStatus, required String message}) {
    switch (eventStatus) {
      case EventStatus.success:
      case EventStatus.fail:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height - 100),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            elevation: 0,
            content: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: CustomColors.grey1.withOpacity(0.3),
                  border: Border.all(color: Colors.red, width: 2)
                ),
                child: Text(
                  message,
                  style: TextStyles.style2.copyWith(
                    color: Colors.red
                  ),
                ),
              ),
            )
          )
        );
        break;
      default:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height - 100),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            elevation: 0,
            content: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: CustomColors.grey1.withOpacity(0.3),
                  border: Border.all(color: CustomColors.grey1, width: 2)
                ),
                child: Text(
                  message,
                  style: TextStyles.style2,
                ),
              ),
            )
          )
        );
    }
  }
}