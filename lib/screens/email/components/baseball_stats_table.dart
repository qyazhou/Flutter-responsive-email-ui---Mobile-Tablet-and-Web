import 'package:flutter/material.dart';

class BaseballStatsTable extends StatelessWidget {
  BaseballStatsTable({Key? key}) : super(key: key);

  // 定义二维数组来存储表格数据
  final List<List<String>> tableData = [
    ['打順', '選手名', '盗塁', '打点', '得点', '打席', '', '', ''],
    ['', '', '', '', '', '1', '2', '3', '4'],
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
    return Column(
      children: [
        Row(
          children: [_buildHeaderCell('野手成績', flex: 9)],
        ),
        // 使用Row和Expanded手动构建表头部分，合并单元格
        Row(
          children: [
            _buildHeaderCell('打順', flex: 1),
            _buildHeaderCell('選手名', flex: 1),
            _buildHeaderCell('盗塁', flex: 1),
            _buildHeaderCell('打点', flex: 1),
            _buildHeaderCell('得点', flex: 1),
            _buildHeaderCell('打席1', flex: 4),
          ],
        ),
        // 使用Row显示“1, 2, 3, 4”
        Row(
          children: [
            _buildEmptyCell(),
            _buildEmptyCell(),
            _buildEmptyCell(),
            _buildEmptyCell(),
            _buildEmptyCell(),
            _buildHeaderCell('1'),
            _buildHeaderCell('2'),
            _buildHeaderCell('3'),
            _buildHeaderCell('4'),
          ],
        ),
        // 表格内容部分使用GridView显示数据
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 9, // 一行9列
              childAspectRatio: 2.0,
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 1.0,
            ),
            itemCount: (tableData.length - 2) * 9, // 数据行的项目数，去掉前两行表头
            itemBuilder: (context, index) {
              final row = (index ~/ 9) + 2; // 数据从第3行开始
              final col = index % 9;

              return Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: Text(
                  tableData[row][col],
                  style: const TextStyle(fontSize: 14),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

// 辅助函数：创建单元格的样式
  Widget _buildCell({
    String? title, // 如果传入了title则为表头单元格，否则为空白单元格
    Color backgroundColor = Colors.white, // 默认背景色为白色
    FontWeight fontWeight = FontWeight.normal, // 默认字体不加粗
    int flex = 1, // 默认为1倍的伸缩比例
  }) {
    return Expanded(
      flex: flex,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: backgroundColor,
        ),
        child: title != null
            ? Text(
                title,
                style: TextStyle(
                  fontWeight: fontWeight,
                  fontSize: 10,
                ),
              )
            : null, // 如果没有标题内容，保持单元格为空
      ),
    );
  }

// 使用统一的样式函数来创建表头单元格
  Widget _buildHeaderCell(String title, {int flex = 1}) {
    return _buildCell(
      title: title,
      backgroundColor: Color.fromARGB(255, 248, 245, 223),
      fontWeight: FontWeight.bold, // 表头文字加粗
      flex: flex,
    );
  }

// 使用统一的样式函数来创建空白单元格
  Widget _buildEmptyCell({int flex = 1}) {
    return _buildCell(
      title: "",
      backgroundColor: Color.fromARGB(255, 248, 245, 223),
      fontWeight: FontWeight.bold, // 表头文字加粗
      flex: flex,
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text('野手成績')),
      body: BaseballStatsTable(),
    ),
  ));
}
