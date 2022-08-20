import "package:flutter/material.dart";
import 'package:ksynonyms/provider.dart';
import 'package:provider/provider.dart';
import "../pages/lang_page.dart";

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.90,
      height: MediaQuery.of(context).size.height * 0.10,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15.5)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 84, 75, 217),
            Color.fromARGB(255, 82, 76, 216),
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          TextButton(
            child: Row(
              children: <Widget>[
                Consumer<Providertest>(
                  builder: (_, data, __) {
                    return Text(
                      data.fromLangVal.characters.take(3).toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: "Aromatica",
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
                const SizedBox(width: 7.5),
                Image.asset(
                  "assets/icons/arrow-down-sign-to-navigate.png",
                  width: 10,
                  height: 10,
                  color: Colors.white,
                ),
              ],
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => LangPage(translateFrom: true)));
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.repeat_rounded,
              color: Colors.white,
            ),
            // icon: Image.asset(
            //   "assets/icons/exchange.png",
            //   color: Colors.white,
            //   width: 20,
            //   height: 20,
            // ),
            onPressed: () {
              Provider.of<Providertest>(context, listen: false).dataSwitcher();
            },
          ),
          TextButton(
            child: Row(
              children: <Widget>[
                Consumer<Providertest>(
                  builder: (_, data, __) {
                    return Text(
                      data.toLangVal.characters.take(3).toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: "Aromatica",
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
                const SizedBox(width: 7.5),
                Image.asset(
                  "assets/icons/arrow-down-sign-to-navigate.png",
                  width: 10,
                  height: 10,
                  color: Colors.white,
                ),
              ],
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => LangPage(translateFrom: false)));
            },
          ),
        ],
      ),
    );
  }
}
