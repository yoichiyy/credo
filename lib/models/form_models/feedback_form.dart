import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FeedbackForm {
  final bool isMorning;
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

  FeedbackForm(
      {@required this.isMorning,
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
      this.motivation});

  Map<String, dynamic> toMap() {
    return {
      'isMorning': isMorning,
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
    };
  }

  factory FeedbackForm.fromMap(Map<String, dynamic> map) {
    return FeedbackForm(
      isMorning: map['isMorning'],
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
    );
  }

  String toJson() => json.encode(toMap());

  factory FeedbackForm.fromJson(String source) =>
      FeedbackForm.fromMap(json.decode(source));
}
