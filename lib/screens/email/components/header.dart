import 'package:flutter/material.dart';
import 'package:baseball/responsive.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../../constants.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Row(
        children: [
          // We need this back button on mobile only
          if (Responsive.isMobile(context)) BackButton(),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LayoutBuilder(
                  builder: (context, constraints) => SizedBox(
                    width:
                        constraints.maxWidth > 850 ? 800 : constraints.maxWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 110,
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 15,
                              mainAxisSpacing: kMinPadding,
                              crossAxisSpacing: kMinPadding,
                              childAspectRatio: 1.5,
                            ),
                            itemCount: 45,
                            itemBuilder: (BuildContext context, int index) =>
                                ClipRRect(
                              borderRadius: BorderRadius.circular(1),
                              child: Container(
                                color: const Color.fromARGB(
                                    255, 247, 244, 244), // 添加背景色
                                alignment: Alignment.center,
                                child: Text(
                                  "Text$index", // 用文本代替图片
                                  style: TextStyle(
                                    fontSize: 8, // 设置文本大小
                                    color: Colors.black, // 设置文本颜色
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
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
