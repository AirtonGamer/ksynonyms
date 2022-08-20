import "package:flutter/material.dart";
import 'package:ksynonyms/provider.dart';
import 'package:provider/provider.dart';
import "pages/home.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ChangeNotifierProvider(
      create: (_) => Providertest(),
      child: const KSynonyms(),
    ),
  );
}

class KSynonyms extends StatelessWidget {
  const KSynonyms({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: KSynonymsHome(),
    );
  }
}