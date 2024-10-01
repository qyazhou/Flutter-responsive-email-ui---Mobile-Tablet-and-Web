import 'package:flutter/material.dart';
import 'package:baseball/components/side_menu.dart';
import 'package:baseball/responsive.dart';
import 'package:baseball/screens/game/game_screen.dart';
import 'components/list_of_games.dart';
import 'package:baseball/models/game.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // It provide us the width and height
    Size _size = MediaQuery.of(context).size;
    final Game exampleGame = Game(
      homeTeamName: "Team A",
      awayTeamName: "Team B",
      homeTeamLogo: "assets/images/user_1.png",
      awayTeamLogo: "assets/images/user_2.png",
      isAttachmentAvailable: false,
      isChecked: true,
      homeTeamColor: Color(0xFF23CF91),
      awayTeamColor: Color(0xFF3A6FF7),
      time: "Now",
      body: gameDemoText,
      homeScore: 5, // 主队分数
      awayScore: 3, // 客队分数
    );
    return Scaffold(
      body: Responsive(
        // Let's work on our mobile part
        mobile: ListOfGames(),
        tablet: Row(
          children: [
            Expanded(
              flex: 6,
              child: ListOfGames(),
            ),
            Expanded(
              flex: 9,
              child: GameScreen(game: exampleGame),
            ),
          ],
        ),
        desktop: Row(
          children: [
            // Once our width is less then 1300 then it start showing errors
            // Now there is no error if our width is less then 1340
            Expanded(
              flex: _size.width > 1340 ? 2 : 4,
              child: SideMenu(),
            ),
            Expanded(
              flex: _size.width > 1340 ? 3 : 5,
              child: ListOfGames(),
            ),
            Expanded(
              flex: _size.width > 1340 ? 8 : 10,
              child: GameScreen(game: exampleGame),
            ),
          ],
        ),
      ),
    );
  }
}
