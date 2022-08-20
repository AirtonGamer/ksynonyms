// import "../theme.dart";
// import "package:flutter/material.dart";
// import 'package:flutter/services.dart';
// import "package:provider/provider.dart";
// import "../provider.dart";

// class WritingPad extends StatelessWidget {
//   WritingPad({Key? key}) : super(key: key);
//   final controller = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         borderRadius: BorderRadius.all(Radius.circular(15.5)),
//         color: Color.fromRGBO(254, 255, 254, 1),
//       ),
//       child: Column(
//         children: <Widget>[
//           SizedBox(
//             width: Themer().textFieldPadWidth(context),
//             height: MediaQuery.of(context).size.height * 0.30,
//             child: TextField(
//               decoration: const InputDecoration(
//                 filled: true,
//                 fillColor: Color.fromRGBO(254, 255, 254, 1),
//                 hoverColor: Color.fromRGBO(254, 255, 254, 1),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(15.5)),
//                   borderSide: BorderSide(
//                     width: 0.0,
//                     style: BorderStyle.none,
//                   ),
//                 ),
//               ),
//               style: const TextStyle(
//                 fontFamily: "Aromatica",
//                 fontSize: 23,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.black,
//               ),
//               textAlignVertical: TextAlignVertical.top,
//               controller: controller,
//               onChanged: (String value) {
//                 Provider.of<Providertest>(context, listen: false).setInstance();
//                 Provider.of<Providertest>(context, listen: false)
//                     .saveInput(value);
//                 Provider.of<Providertest>(context, listen: false)
//                     .translateFunc();
//               },
//               expands: true,
//               maxLines: null,
//             ),
//           ),
//           SizedBox(
//             width: MediaQuery.of(context).orientation == Orientation.portrait
//                 ? MediaQuery.of(context).size.width * 0.80
//                 : MediaQuery.of(context).size.width * 0.30,
//             child: const Divider(),
//           ),
//           SizedBox(
//             width: MediaQuery.of(context).orientation == Orientation.portrait
//                 ? MediaQuery.of(context).size.width * 0.90
//                 : MediaQuery.of(context).size.width * 0.45,
//             height: MediaQuery.of(context).size.height * 0.10,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: <Widget>[
//                 IconButton(
//                   icon: const Icon(Icons.copy),
//                   onPressed: () {
//                     Clipboard.setData(ClipboardData(text: controller.text));
//                   },
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.speaker),
//                   onPressed: () {},
//                 ),
//                 const SizedBox(
//                   width: 15,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
