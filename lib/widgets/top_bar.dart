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
        borderRadius: BorderRadius.all(Radius.circular(13.7)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromRGBO(71, 82, 217, 1),
            Color.fromRGBO(94, 68, 217, 1),
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
                  "assets/icons/down.png",
                  width: 18,
                  height: 18,
                  color: Colors.white,
                ),
              ],
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const LangPage(translateFrom: true),
                ),
              );
              Provider.of<Providertest>(context,listen: false).searchBar("");
            },
          ),
          IconButton(
            icon: Image.asset(
              "assets/icons/exchange.png",
              color: Colors.white,
              width: 20,
              height: 20,
            ),
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
                  "assets/icons/down.png",
                  width: 18,
                  height: 18,
                  color: Colors.white,
                ),
              ],
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const LangPage(translateFrom: false),
                ),
              );
              Provider.of<Providertest>(context,listen: false).searchBar("");
            },
          ),
        ],
      ),
    );
  }
}
