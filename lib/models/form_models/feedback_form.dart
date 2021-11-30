import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FeedbackForm {
  final bool isMorning;
  final bool isSpecial;
  final String name;
  final String email;
  final String type;
  final String section;
  final String video;

  /// Evening
  final String use1;
  final String use2;
  final String feedback;

  /// Morning
  final String feeling;
  final String focus;
  final String knowledge;
  final String bridging;
  final String motivation;

  ///Special
  // final int feeling;
  // final String knowledge;
  final String nextChallenge;
  final String inspiration;

  FeedbackForm(
      {@required this.isMorning,
      this.isSpecial = false,
      @required this.name,
      @required this.email,
      @required this.type,
      @required this.section,
      @required this.video,
      this.use1,
      this.use2,
      this.feedback,
      this.feeling,
      this.focus,
      this.knowledge,
      this.bridging,
      this.motivation,
      this.nextChallenge,
      this.inspiration});

  Map<String, dynamic> toMap() {
    return {
      'isMorning': isMorning,
      'isSpecial': isSpecial,
      'name': name,
      'email': email,
      'type': type,
      'section': section,
      'video': video,
      'use1': use1,
      'use2': use2,
      'feedback': feedback,
      'feeling': feeling,
      'focus': focus,
      'knowledge': knowledge,
      'bridging': bridging,
      'motivation': motivation,
      'nextChallenge': nextChallenge,
      'inspiration': inspiration,
    };
  }

  factory FeedbackForm.fromMap(Map<String, dynamic> map) {
    return FeedbackForm(
      isMorning: map['isMorning'],
      isSpecial: map['isSpecial'],
      name: map['name'],
      email: map['email'],
      type: map['type'],
      section: map['section'],
      video: map['video'],
      use1: map['use1'],
      use2: map['use2'],
      feedback: map['feedback'],
      feeling: map['feeling'],
      focus: map['focus'],
      knowledge: map['knowledge'],
      bridging: map['bridging'],
      motivation: map['motivation'],
      nextChallenge: map['nextChallenge'],
      inspiration: map['inspiration'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FeedbackForm.fromJson(String source) =>
      FeedbackForm.fromMap(json.decode(source));
}
