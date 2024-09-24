import 'package:flutter/material.dart';
import 'package:baseball/responsive.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../../constants.dart';

class Header extends StatelessWidget {
  Header({
    Key? key,
  }) : super(key: key);

  // 定义一个 3x15 的二维数组
  final List<List<String>> scoreBoard = [
    [
      'チーム',
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '10',
      '11',
      '12',
      'R',
      'H',
      'E'
    ],
    [
      'R',
      '0',
      '1',
      '2',
      '0',
      '3',
      '1',
      '0',
      '2',
      '1',
      '1',
      '0',
      '0',
      '5',
      '10',
      '1'
    ],
    [
      'B',
      '1',
      '2',
      '0',
      '1',
      '0',
      '1',
      '1',
      '3',
      '0',
      '0',
      '1',
      '1',
      '6',
      '9',
      '0'
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Row(
        children: [
          if (Responsive.isMobile(context)) BackButton(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  LayoutBuilder(
                    builder: (context, constraints) => SizedBox(
                      width: constraints.maxWidth > 850
                          ? 800
                          : constraints.maxWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 110,
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 16, // 一行有16列
                                mainAxisSpacing: kMinPadding,
                                crossAxisSpacing: kMinPadding,
                                childAspectRatio: 1.5,
                              ),
                              itemCount: scoreBoard.length *
                                  scoreBoard[0].length, // 3行 * 16列
                              itemBuilder: (BuildContext context, int index) {
                                // 计算行列索引
                                final row = index ~/ 16; // 获取行索引
                                final col = index % 16; // 获取列索引
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(1),
                                  child: Container(
                                    color: Colors.grey[300], // 添加背景色
                                    alignment: Alignment.center,
                                    child: Text(
                                      scoreBoard[row][col], // 显示二维数组中的值
                                      style: TextStyle(
                                        fontSize: 16, // 设置文本大小
                                        color: Colors.black, // 设置文本颜色
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (Responsive.isDesktop(context))
            IconButton(
              icon: WebsafeSvg.asset(
                "/Icons/input.svg",
                width: 24,
              ),
              onPressed: () {},
            ),
          IconButton(
            icon: WebsafeSvg.asset(
              "Icons/Reset.svg",
              width: 24,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
