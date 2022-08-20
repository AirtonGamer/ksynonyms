// import "package:flutter/material.dart";
// import 'package:flutter/services.dart';
// import 'package:simplytranslate/simplytranslate.dart';
// import '../theme.dart';
// import "writing_pad.dart";
// import "package:provider/provider.dart";
// import "../provider.dart";

// class ResultPad extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final _controller = TextEditingController(
//         text: Provider.of<Providertest>(context).textResult);

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
//                 //labelText: "Hello",
//               ),
//               style: const TextStyle(
//                 fontFamily: "Aromatica",
//                 fontSize: 23,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.black,
//               ),
//               textAlignVertical: TextAlignVertical.top,
//               controller: _controller,
//               expands: true,
//               maxLines: null,
//               readOnly: true,
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
//                     //Clipboard.setData(ClipboardData(text: _controller.text));
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
