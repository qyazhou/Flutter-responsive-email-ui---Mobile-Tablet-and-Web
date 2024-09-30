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
    // 示例 Game 对象，你需要用实际的对象替换
    final Game exampleGame = Game(
      name: 'Elvia Atkins',
      image: 'assets/images/Img_0.png', // 使用实际路径
      subject: 'Inspiration for our new home',
      body:
          'Hello my love, \n \nSunt architecto voluptatum esse tempora sint nihil minus incidunt nisi. Perspiciatis natus quo unde magnam numquam pariatur amet ut. Perspiciatis ab totam. Ut labore maxime provident. Voluptate ea omnis et ipsum asperiores laborum repellat explicabo fuga. Dolore voluptatem praesentium quis eos laborum dolores cupiditate nemo labore. \n \nLove you, \n\nElvia',
      time: 'Today at 15:32',
      isChecked: false,
      isAttachmentAvailable: true,
      tagColor: Colors.blue, // 使用实际的颜色
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
