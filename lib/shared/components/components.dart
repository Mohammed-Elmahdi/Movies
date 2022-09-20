import 'package:flutter/material.dart';

// showLoading(BuildContext context, String text, {bool isCancelable = true}) {
//   showDialog(
//       barrierDismissible: isCancelable,
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           content: Row(
//             children: [
//               CircularProgressIndicator(),
//               SizedBox(
//                 width: 5,
//               ),
//               Text(
//                 text,
//                 style: Theme.of(context).textTheme.subtitle1,
//               ),
//             ],
//           ),
//         );
//       });
// }
//
// hideLoading(BuildContext context) {
//   Navigator.pop(context);
// }

showMessage(
  BuildContext context,
  String message,
  String actionName,
  VoidCallback actionCallBack, {
  bool isCancelable = true,
  String? NegActionName,
  VoidCallback? NegActionCallBack,
}) {
  List<Widget> actions = [
    TextButton(
        onPressed: () {
          actionCallBack();
        },
        child: Text(actionName)),
  ];
  if (NegActionName != null) {
    actions.add(TextButton(
        onPressed: () {
          if (NegActionCallBack != null) NegActionCallBack();
        },
        child: Text(NegActionName)));
  }
  showDialog(
      context: context,
      barrierDismissible: isCancelable,
      builder: (context) {
        return AlertDialog(

          backgroundColor: Colors.black45,
          content: Text(message,style: TextStyle(
            color: Colors.white
          )),
          actions: actions,
        );
      });
}
