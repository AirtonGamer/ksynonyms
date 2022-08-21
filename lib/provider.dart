import 'package:flutter/foundation.dart';
import "package:simplytranslate/simplytranslate.dart";

class Providertest with ChangeNotifier {
  //Translate From specific language
  String fromLangVal = "Auto";
  String fromLangCode = "auto";

  //Translate To specific language
  String toLangVal = "English";
  String toLangCode = "en";

  String langSwitcher = "";
  String langcodeSwitcher = "";
  String valueSwitcher = "";

  String inputData = "";

  SimplyTranslator gt = SimplyTranslator(EngineType.google);
  //gt.setInstance = "simplytranslate.pussthecat.org";

  String textResult = "";

  String searchValue = "";

  void searchBar(String value) {
    searchValue = value;
    notifyListeners();
  }

  void transFromData(String langName, String langCode) {
    fromLangVal = langName;
    fromLangCode = langCode;
    notifyListeners();
  }

  void transToData(String langName, String langCode) {
    toLangVal = langName;
    toLangCode = langCode;
    notifyListeners();
  }

  void dataSwitcher() {
    //TODO: make sure to switch the sentcnes
    langSwitcher = fromLangVal;
    langcodeSwitcher = fromLangCode;

    fromLangVal = toLangVal;
    fromLangCode = toLangCode;

    toLangVal = langSwitcher;
    toLangCode = langcodeSwitcher;

    valueSwitcher = inputData;

    inputData = textResult;

    textResult = valueSwitcher;
    
    setInstance();
    saveInput(inputData);
    translateFunc();
    notifyListeners();
  }

  void setInstance() {
    gt.setInstance = "translate.bus-hit.me";
    gt.updateSimplyInstances();
  }

  void saveInput(String value) {
    gt.updateSimplyInstances();
    inputData = value;
    translateFunc();
    //gt.setInstance = "translate.josias.dev";
    //print(gt.getInstances);
    notifyListeners();
  }

  void translateFunc() async {
    textResult = await gt.trSimply(inputData, fromLangCode, toLangCode);
    notifyListeners();
    //gt.updateSimplyInstances();
  }
}
