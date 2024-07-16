import 'dart:convert';
import 'package:task_stack/model/owner.dart';

class Question {
  int? id;
  String? title;
  List? tags;
  Owner? owner;
  bool? isanaswrd;
  int? viewcount;
  int? score;
  int? answercount;
  int? datecreated;
  int? lastedit;
  int? lastactivity;
  int? acceptedAnswerId;
  String? link;
  Question(
      this.id,
      this.title,
      this.tags,
      this.owner,
      this.isanaswrd,
      this.viewcount,
      this.score,
      this.answercount,
      this.datecreated,
      this.lastedit,
      this.lastactivity,
      this.link,
      this.acceptedAnswerId);

  Question.formJson(Map<String, dynamic> json) {
    id = json['question_id'];
    title = json['title'];
    tags = json['tags'] is String ? jsonDecode(json['tags']) : json['tags'];
    owner = json['owner'] != null && json['owner'] is String
        ? Owner.fromJson(jsonDecode(json['owner']))
        : Owner.fromJson(json['owner']);
    isanaswrd = json['is_answered'] == 0
        ? false
        : json['is_answered'] == 1
            ? true
            : json['is_answered'];
    viewcount = json['view_count'];
    score = json['score'];
    answercount = json['answer_count'];
    datecreated = json['creation_date'];
    lastedit = json['last_edit_date'];
    lastactivity = json['last_activity_date'];
    link = json['link'];
    acceptedAnswerId = json['accepted_answer_id'];
  }
  Map<String, dynamic> toJson() {
    return {
      'question_id': id,
      'title': title,
      'tags': jsonEncode(tags),
      'owner': jsonEncode(owner!.toJson()),
      'is_answered': isanaswrd! ? 1 : 0, // 0 not is_answered || 1 is_answered
      'view_count': viewcount,
      'score': score,
      'answer_count': answercount,
      'creation_date': datecreated,
      'last_edit_date': lastedit,
      'last_activity_date': lastactivity,
      'link': link,
      'accepted_answer_id':acceptedAnswerId
    };
  }
}
