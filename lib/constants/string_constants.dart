class StringConstants {
  static final String appName = "Review System";

  static final String homeTabMorning = "Morning Videos";
  static final String homeTabEvening = "Evening Videos";
}

class FeedbackFormFieldHintConstants {
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
