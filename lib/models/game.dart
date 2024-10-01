import 'package:flutter/material.dart';

class Game {
  final String homeTeamLogo;
  final String awayTeamLogo;
  final String homeTeamName;
  final String awayTeamName;
  final String body;
  final String time;
  final bool isAttachmentAvailable;
  final bool isChecked;
  final Color homeTeamColor;
  final Color awayTeamColor;
  final int homeScore; // 主队分数
  final int awayScore; // 客队分数

  Game({
    required this.time,
    required this.isChecked,
    required this.homeTeamLogo,
    required this.awayTeamLogo,
    required this.homeTeamName,
    required this.awayTeamName,
    required this.body,
    required this.isAttachmentAvailable,
    required this.homeTeamColor,
    required this.awayTeamColor,
    required this.homeScore,
    required this.awayScore,
  });
}

List<Game> games = List.generate(
  demo_data.length,
  (index) => Game(
    homeTeamName: demo_data[index]['homeTeamName'],
    awayTeamName: demo_data[index]['awayTeamName'],
    homeTeamLogo: demo_data[index]['homeTeamLogo'],
    awayTeamLogo: demo_data[index]['awayTeamLogo'],
    isAttachmentAvailable: demo_data[index]['isAttachmentAvailable'],
    isChecked: demo_data[index]['isChecked'],
    homeTeamColor: demo_data[index]['homeTeamColor'],
    awayTeamColor: demo_data[index]['awayTeamColor'],
    time: demo_data[index]['time'],
    body: gameDemoText,
    homeScore: demo_data[index]['homeScore'], // 主队分数
    awayScore: demo_data[index]['awayScore'], // 客队分数
  ),
);

List demo_data = [
  {
    "homeTeamName": "Team A",
    "awayTeamName": "Team B",
    "homeTeamLogo": "assets/images/user_1.png",
    "awayTeamLogo": "assets/images/user_2.png",
    "isAttachmentAvailable": false,
    "isChecked": true,
    "homeTeamColor": Color(0xFF23CF91),
    "awayTeamColor": Color(0xFF3A6FF7),
    "time": "Now",
    "homeScore": 5, // 主队分数
    "awayScore": 3, // 客队分数
  },
  {
    "homeTeamName": "Team C",
    "awayTeamName": "Team D",
    "homeTeamLogo": "assets/images/user_1.png",
    "awayTeamLogo": "assets/images/user_2.png",
    "isAttachmentAvailable": true,
    "isChecked": false,
    "homeTeamColor": Color(0xFFE91E63),
    "awayTeamColor": Color(0xFF9C27B0),
    "time": "15:32",
    "homeScore": 2, // 主队分数
    "awayScore": 4, // 客队分数
  },
  {
    "homeTeamName": "Team E",
    "awayTeamName": "Team F",
    "homeTeamLogo": "assets/images/user_1.png",
    "awayTeamLogo": "assets/images/user_2.png",
    "isAttachmentAvailable": true,
    "isChecked": false,
    "homeTeamColor": Color(0xFF2196F3),
    "awayTeamColor": Color(0xFF673AB7),
    "time": "14:27",
    "homeScore": 3, // 主队分数
    "awayScore": 1, // 客队分数
  },
  // 可以继续添加更多比赛数据
];

String gameDemoText = "比赛正在进行中！";

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('棒球比赛')),
      body: ListView.builder(
        itemCount: games.length,
        itemBuilder: (context, index) {
          final game = games[index];
          return Card(
            child: ListTile(
              leading: Image.asset(game.homeTeamLogo),
              title: Text('${game.homeTeamName} vs ${game.awayTeamName}'),
              subtitle: Text(
                  '时间: ${game.time}\n比分: ${game.homeScore} - ${game.awayScore}'), // 显示分数
              trailing: Icon(game.isChecked ? Icons.check : Icons.clear),
              tileColor: game.isAttachmentAvailable
                  ? Colors.green[50]
                  : Colors.red[50],
            ),
          );
        },
      ),
    ),
  ));
}
