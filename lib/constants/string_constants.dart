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

class MorningSpecialFeedbackFormFieldHintConstants {
  static final String name = "お名前";
  static final String emailAddress = "メールアドレス";
  static final String feeling = "クレド視聴前の気持ちは？";
  static final String inspiration =
      "本シリーズの８つのクレドのうち、最も心に残った・心に響いた・ブリッヂングできた、と感じたものをお教えください。（１つ）";
  static final String nextChallenge =
      "本シリーズの８つのクレドのうち、実践がむずかしかった・うまくいかなかった・ブリッジングできなかった　と感じたものをお教えください。（１つ）";
  static final String knowledge =
      "８つのクレドをブリッジングして得た、最も印象に残った・役に立つと感じた・衝撃を受けた！新しい知識はどんなことですか。";

  static getFeelingTypes(int value) {
    List<String> _options = ["快晴", "晴れ", "曇り", "雨", "雷雨"];
    return _options[value];
  }
}

class EveningFeedbackFormFieldHintConstants {
  static final String name = "お名前";
  static final String emailAddress = "メールアドレス";
  static final String use1 = "【Use】本日、他に活用したクレドがあれば記入して下さい";
  static final String use2 = "【Use】今回のクレドを活用したシーンを記入して下さい";

  static final String feedback =
      "【Feedback】今日一日を振り返って記入してください（気づき、得たもの、もしもう一度やり直せるなら、などの観点から）";

  static final String feeling = "【Feeling】今日一日の気持ちを下記の中から選んで下さい";

  static getFeelingTypes(int value) {
    List<String> _options = ["快晴", "晴れ", "曇り", "雨", "雷雨"];
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
  static final String alreadyLoggedIn = "Already Logged In";
}

class CommonStringConstants {
  static final String save = "Save";
  static final String yes = "Yes";
  static final String no = "No";
  static final String saveButtonWarnings = "Are you sure you want to save it";
  static final String noVideoWarning = "No video for selected slot";
}
