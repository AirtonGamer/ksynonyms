import "../theme.dart";
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import "package:provider/provider.dart";
import "../provider.dart";

class Pad extends StatelessWidget {
  const Pad({Key? key, required this.readOnly}) : super(key: key);

  final bool readOnly;

  @override
  Widget build(BuildContext context) {

    final controller = TextEditingController(
        text: Provider.of<Providertest>(context).textResult);

    final inputController = TextEditingController(
        text: Provider.of<Providertest>(context).inputData);

    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15.5)),
        color: textFieldColor,
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).orientation == Orientation.portrait
                ? MediaQuery.of(context).size.width * 0.90
                : MediaQuery.of(context).size.width * 0.45,
            height: MediaQuery.of(context).orientation == Orientation.portrait
                ?  MediaQuery.of(context).size.height * 0.30 : MediaQuery.of(context).size.height * 0.45, 
            child: TextField(
              decoration: const InputDecoration(
                filled: true,
                fillColor: textFieldColor,
                hoverColor: textFieldColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.5)),
                  borderSide: BorderSide(
                    width: 0.0,
                    style: BorderStyle.none,
                  ),
                ),
              ),
              style: const TextStyle(
                fontFamily: "Aromatica",
                fontSize: 23,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              textAlignVertical: TextAlignVertical.top,
              onChanged: (String value) {
                Provider.of<Providertest>(context, listen: false).setInstance();
                Provider.of<Providertest>(context, listen: false)
                    .saveInput(value);
                //Provider.of<Providertest>(context, listen: false)
                //    .translateFunc();
              },
              expands: true,
              maxLines: null,
              readOnly: readOnly,
              controller: readOnly == false
                  ? null
                  // : (Provider.of<Providertest>(context, listen: false)
                  //         .inputData
                  //         .isEmpty
                  //     ? null
                  //     : 
                      : controller
                      //),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).orientation == Orientation.portrait
                ? MediaQuery.of(context).size.width * 0.80
                : MediaQuery.of(context).size.width * 0.40,
            child: const Divider(),
          ),
          SizedBox(
            width: MediaQuery.of(context).orientation == Orientation.portrait
                ? MediaQuery.of(context).size.width * 0.90
                : MediaQuery.of(context).size.width * 0.45,
            height: MediaQuery.of(context).size.height * 0.10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.copy),
                  onPressed: () {
                    Clipboard.setData(
                      ClipboardData(
                        text: readOnly == false
                            ? Provider.of<Providertest>(context, listen: false)
                                .inputData
                            : Provider.of<Providertest>(context, listen: false)
                                .textResult,
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.speaker),
                  onPressed: () {},
                ),
                const SizedBox(
                  width: 15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
