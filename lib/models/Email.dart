import 'package:flutter/material.dart';

class Email {
  final String image, name, subject, body, time;
  final bool isAttachmentAvailable, isChecked;
  final Color tagColor;

  Email({
    required this.time,
    required this.isChecked,
    required this.image,
    required this.name,
    required this.subject,
    required this.body,
    required this.isAttachmentAvailable,
    required this.tagColor,
  });
}

List<Email> emails = List.generate(
  demo_data.length,
  (index) => Email(
    name: demo_data[index]['name'],
    image: demo_data[index]['image'],
    subject: demo_data[index]['subject'],
    isAttachmentAvailable: demo_data[index]['isAttachmentAvailable'],
    isChecked: demo_data[index]['isChecked'],
    tagColor: demo_data[index]['tagColor'],
    time: demo_data[index]['time'],
    body: emailDemoText,
  ),
);

List demo_data = [
  {
    "name": "Apple",
    "image": "assets/images/user_1.png",
    "subject": "12",
    "isAttachmentAvailable": false,
    "isChecked": true,
    "tagColor": Color(0xFF23CF91),
    "time": "Now"
  },
  {
    "name": "Nokia",
    "image": "assets/images/user_2.png",
    "subject": "2",
    "isAttachmentAvailable": true,
    "isChecked": false,
    "tagColor": Color(0xFF23CF91),
    "time": "15:32"
  },
  {
    "name": "Marvin",
    "image": "assets/images/user_3.png",
    "subject": "3",
    "isAttachmentAvailable": true,
    "isChecked": false,
    "tagColor": Color(0xFF23CF91),
    "time": "14:27",
  },
  {
    "name": "Domenic",
    "image": "assets/images/user_4.png",
    "subject": "4",
    "isAttachmentAvailable": false,
    "isChecked": true,
    "tagColor": Color(0xFF23CF91),
    "time": "10:43"
  },
  {
    "name": "Elenor",
    "image": "assets/images/user_5.png",
    "subject": "5",
    "isAttachmentAvailable": false,
    "isChecked": false,
    "tagColor": Color(0xFF3A6FF7),
    "time": "9:58"
  }
];

String emailDemoText = "もうすぐ始まります";
