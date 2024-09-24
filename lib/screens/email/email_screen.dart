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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.3, // 20% of screen height for Header
                child: Header(),
              ),
              Divider(thickness: 1),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(kDefaultPadding),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LayoutBuilder(
                              builder: (context, constraints) => Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: screenHeight *
                                        0.6, // 60% of screen height
                                    width: screenWidth, // Full width
                                    child: BaseballStatsTable(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
