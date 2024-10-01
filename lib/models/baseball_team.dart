import 'package:flutter/material.dart';

class BaseballTeam {
  final String name; // 球队名称
  final String logo; // 球队Logo
  final String city; // 球队城市
  final String stadium; // 球队主场
  final String coach; // 教练姓名
  final Color teamColor; // 球队颜色

  BaseballTeam({
    required this.name,
    required this.logo,
    required this.city,
    required this.stadium,
    required this.coach,
    required this.teamColor,
  });
}

List<BaseballTeam> baseballTeams = List.generate(
  demo_data.length,
  (index) => BaseballTeam(
    name: demo_data[index]['name'],
    logo: demo_data[index]['logo'],
    city: demo_data[index]['city'],
    stadium: demo_data[index]['stadium'],
    coach: demo_data[index]['coach'],
    teamColor: demo_data[index]['teamColor'],
  ),
);

List demo_data = [
  {
    "name": "New York Yankees",
    "logo": "assets/images/yankees_logo.png",
    "city": "New York",
    "stadium": "Yankee Stadium",
    "coach": "Aaron Boone",
    "teamColor": Color(0xFF002D72), // 队伍主色
  },
  {
    "name": "Los Angeles Dodgers",
    "logo": "assets/images/dodgers_logo.png",
    "city": "Los Angeles",
    "stadium": "Dodger Stadium",
    "coach": "Dave Roberts",
    "teamColor": Color(0xFF005A9C),
  },
  {
    "name": "Chicago Cubs",
    "logo": "assets/images/cubs_logo.png",
    "city": "Chicago",
    "stadium": "Wrigley Field",
    "coach": "David Ross",
    "teamColor": Color(0xFF0E4E7E),
  },
  {
    "name": "Boston Red Sox",
    "logo": "assets/images/redsox_logo.png",
    "city": "Boston",
    "stadium": "Fenway Park",
    "coach": "Alex Cora",
    "teamColor": Color(0xFFBD3D44),
  },
  {
    "name": "San Francisco Giants",
    "logo": "assets/images/giants_logo.png",
    "city": "San Francisco",
    "stadium": "Oracle Park",
    "coach": "Gabe Kapler",
    "teamColor": Color(0xFFE95E42),
  },
];

String gameDemoText = "各支球队准备好迎接新的赛季！";
