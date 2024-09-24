import 'package:flutter/material.dart';
import 'package:baseball/models/Email.dart';
import '../../constants.dart';
import 'components/header.dart';
import 'components/baseball_stats_table.dart';

class EmailScreen extends StatelessWidget {
  const EmailScreen({
    Key? key,
    required this.email,
  }) : super(key: key);

  final Email email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 150, // 指定 Header 的高度
                child: Header(),
              ),
              Divider(thickness: 1),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(kDefaultPadding),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 将 Expanded 包裹 Column，使其占据可用宽度
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LayoutBuilder(
                              builder: (context, constraints) => Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 600,
                                    child: BaseballStatsTable(),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
