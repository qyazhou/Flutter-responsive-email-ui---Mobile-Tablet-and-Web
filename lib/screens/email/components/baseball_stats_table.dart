import 'package:flutter/material.dart';

class BaseballStatsTable extends StatelessWidget {
  BaseballStatsTable({Key? key}) : super(key: key);

  // 定义二维数组来存储表格数据
  final List<List<String>> tableData = [
    ['打順', '選手名', '盗塁', '打点', '得点', '1', '2', '3', '4'],
    ['1', '太田直仁', '0', '3', '2', '遊安', '右二', '右二', '三振'],
    ['2', '篠崎優', '1', '1', '1', '四球', '左安', '犠打', '四球'],
    ['3', '本橋雄一', '0', '1', '0', '投ゴ', '犠飛', '一ゴ', '左安'],
    ['4', '長谷川健司', '0', '1', '0', '二飛', '左二', '三振', '投ゴ'],
    ['5', '鎌田隼輔', '0', '1', '0', '遊安', '四球', '三振', '三振'],
    ['6', '岡庭章浩', '0', '0', '0', '二ゴ', '二飛', '三ゴ', '投ゴ'],
    ['7', '岡庭康浩', '1', '0', '2', '四球', '遊安', '二飛', ''],
    ['8', '酒井佑旗（助っ人）', '0', '0', '1', '三ゴ', '中二', '二ゴ', ''],
    ['9', '渡邉文理（助っ人）', '0', '0', '1', '四球', '三ゴ', '二飛', ''],
    ['10', '斎藤拓生', '0', '0', '0', '四球', '三ゴ', '二飛', ''],
    ['代1', '', '', '', '', '', '', '', ''],
    ['代2', '', '', '', '', '', '', '', ''],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 9, // 表示9列
        childAspectRatio: 2.0,
        mainAxisSpacing: 1.0,
        crossAxisSpacing: 1.0,
      ),
      itemCount: tableData.length * tableData[0].length, // 总项目数
      itemBuilder: (context, index) {
        final row = index ~/ 9; // 计算当前单元格的行
        final col = index % 9; // 计算当前单元格的列
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            color: row == 0 ? Colors.yellow : Colors.white, // 第一行背景为黄色
          ),
          child: Text(
            tableData[row][col],
            style: TextStyle(
              fontSize: 16,
              fontWeight:
                  row == 0 ? FontWeight.bold : FontWeight.normal, // 标题行加粗
            ),
          ),
        );
      },
    );
  }
}
