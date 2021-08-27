class MainStringConstants {
  static final String appName = "Review System";
}

class HomeStringConstants {
  static final String appBarTitle = "Review System";

  static final String homeTabMorning = "Morning Videos";
  static final String homeTabEvening = "Evening Videos";
}

class MorningFeedbackFormFieldHintConstants {
  static final String name = "お名前";
  static final String emailAddress = "メールアドレス";
  static final String knowledge = "今回のクレドで知ったことや学んだことを記入してください";
  static final String focus = "視聴して心にのこったキーワードやフレーズを記入してください";

  static final String motivation = "今回のクレドで抱いた感情は？";

  static final String feeling = "クレド視聴前の気持ちは？";

  static getFeelingTypes(int value) {
    List<String> _options = ["快晴", "晴れ", "曇り", "雨", "雷雨"];
    return _options[value];
  }

  static final String bridging =
      "今回のクレドををあなた自身のどのような事に活用できそうでしょうか？（具体的な場面や目標など）";

  static getMotivationTypes(int value) {
    List<String> _options = [
      "共感!",
      "新鮮!",
      "納得!",
      "難しそう!",
      "感動!",
      "半信半疑!",
      "感謝!",
      "ワクワク!",
      "へぇー!",
      "まじっすか!",
      "すごくいい!"
    ];
    return _options[value];
  }
}

class EveningFeedbackFormFieldHintConstants {
  static final String name = "お名前";
  static final String emailAddress = "メールアドレス";
  static final String knowledge = "【Knowledge】今回のクレドで知ったことや学んだことを記入してください";
  static final String focus = "【Focus】視聴して心にのこったキーワードやフレーズを記入してください";

  static final String motivation = "【Motivation】今回のクレドで抱いた感情は？";

  static final String feeling = "【Feeling】クレド視聴前の気持ちは？";

  static getFeelingTypes(int value) {
    List<String> _options = ["快晴", "晴れ", "曇り", "雨", "雷雨"];
    return _options[value];
  }

  static final String bridging =
      "今回のクレドををあなた自身のどのような事に活用できそうでしょうか？（具体的な場面や目標など）";

  static getMotivationTypes(int value) {
    List<String> _options = [
      "共感!",
      "新鮮!",
      "納得!",
      "難しそう!",
      "感動!",
      "半信半疑!",
      "感謝!",
      "ワクワク!",
      "へぇー!",
      "まじっすか!",
      "すごくいい!"
    ];
    return _options[value];
  }
}

class LoginFormStringConstants {
  static final String appBarTitle = "Login / Register";
  static final String emailAddress = "メールアドレス";
  static final String password = "パスワード";
  static final String buttonTitle = "Login / Register";
}

class SettingsPageStringConstants {
  static final String appBarTitle = "Settings";
  static final String loginButtonTitle = "Login using email id";
}

class CommonStringConstants {
  static final String save = "Save";
}
