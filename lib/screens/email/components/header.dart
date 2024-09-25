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
      '0',
      '0',
      '0',
      '0',
      '0',
      '0',
      '0',
      '0',
      '0',
      '0',
      '0',
      '0',
      '0',
      '0'
    ],
    [
      'B',
      '0',
      '0',
      '0',
      '0',
      '0',
      '0',
      '0',
      '0',
      '0',
      '0',
      '0',
      '0',
      '0',
      '0',
      '0'
    ],
  ];

  @override
  Widget build(BuildContext context) {
    // 使用 MediaQuery 来获取屏幕宽度
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = Responsive.isMobile(context);

    // 根据屏幕宽度调整 childAspectRatio
    double calculateAspectRatio() {
      if (screenWidth > 850) {
        return 1.5; // 宽屏设备
      } else if (screenWidth > 600) {
        return 1.2; // 中等屏幕
      } else {
        return 1.0; // 小屏幕
      }
    }

    return Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Row(
          children: [
            //if (isMobile) BackButton(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            '5',
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '5',
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              final gridWidth = constraints.maxWidth > 850
                                  ? 800
                                  : constraints.maxWidth;
                              double? gridWidthAsDouble = gridWidth.toDouble();
                              return SizedBox(
                                width: gridWidthAsDouble,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 110, // 移动设备显示更多高度
                                      child: GridView.builder(
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 16, // 一行有16列
                                          mainAxisSpacing: kMinPadding,
                                          crossAxisSpacing: kMinPadding,
                                          childAspectRatio:
                                              calculateAspectRatio(),
                                        ),
                                        itemCount: scoreBoard.length *
                                            scoreBoard[0].length, // 3行 * 16列
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          // 计算行列索引
                                          final row = index ~/ 16; // 获取行索引
                                          final col = index % 16; // 获取列索引
                                          return ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(2),
                                            child: Container(
                                              color: Colors.grey[300], // 添加背景色
                                              alignment: Alignment.center,
                                              child: Text(
                                                scoreBoard[row]
                                                    [col], // 显示二维数组中的值
                                                style: TextStyle(
                                                  fontSize: 10, // 设置文本大小
                                                  color: Colors.black, // 设置文本颜色
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: IconButton(
                            icon: WebsafeSvg.asset(
                              "/Icons/input.svg",
                              width: 24,
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Expanded(
                          child: IconButton(
                            icon: WebsafeSvg.asset(
                              "/Icons/reset.svg",
                              width: 24,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
