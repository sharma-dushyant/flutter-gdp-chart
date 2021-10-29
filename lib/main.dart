import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.blueGrey
      ),
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<GDPData> _chartData;
  late TooltipBehavior _tooltipBehavior;

@override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior =TooltipBehavior(enable: true);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SfCircularChart(
          title: ChartTitle(text: "Continent wise GDP - 2021 \n (in billions of USD)"),
          legend: Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
          tooltipBehavior: _tooltipBehavior,
          series: <CircularSeries> [
          PieSeries<GDPData, String>(
            dataSource: _chartData,
            xValueMapper: (GDPData data,_) => data.continent,
            yValueMapper: (GDPData data,_) => data.gdp,
            dataLabelSettings: DataLabelSettings(isVisible: true),
            enableTooltip: true,
          )
          ],
          )));
  }

List<GDPData> getChartData(){
  final List<GDPData>chartData = [
    GDPData("China", 14723),
    GDPData("Japan", 5065),
    GDPData("India", 2623),
    GDPData("South Korea", 1631),
    GDPData("Indonesia", 1058),
    GDPData("Taiwan", 700),
    GDPData("Thailand", 502),
    GDPData("United Arab Emirates", 421),
    GDPData("Israel", 402),
    GDPData("Philippines", 361),
    GDPData("Hong Kong", 540),
    GDPData("Singapore", 700),
    GDPData("Malaysia", 800),
    GDPData("Bangladesh", 400),
    GDPData("Vietnam", 500),
    GDPData("Pakistan", 264),
    GDPData("Iran", 192),
    GDPData("Kazakhstan", 170),
    GDPData("Iraq", 167),
    GDPData("Qatar", 166),
  ];
  return chartData;
}




}

class GDPData{
  GDPData(this.continent, this.gdp);
  final String continent;
  final int gdp;
}




