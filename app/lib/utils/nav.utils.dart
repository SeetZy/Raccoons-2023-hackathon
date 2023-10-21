/*
  * Library imports
 */
import 'package:flutter/cupertino.dart';

/*
  * Page/Component imports 
 */
import 'package:app/components/subs.template.dart';

class NavUtils {
  static void navigate(BuildContext context, title, desc, usage) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => SubstanceTemplate(
          title: title,
          desc: desc,
          usage: usage,
        ),
      ),
    );
  }
}
