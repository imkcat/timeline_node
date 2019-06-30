import 'package:flutter/material.dart';
import 'package:timeline_node/timeline_node.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'timeline_node',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePageTimelineObject {
  final TimelineNodeStyle style;
  final String message;

  HomePageTimelineObject({this.style, this.message});
}

class HomePage extends StatefulWidget {
  List<HomePageTimelineObject> timelineObject = [
    HomePageTimelineObject(
        message: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        style: TimelineNodeStyle(
            pointType: TimelineNodePointType.Circle,
            lineType: TimelineNodeLineType.BottomHalf)),
    HomePageTimelineObject(
        message:
            'Maecenas non bibendum ante, et volutpat diam. Praesent eu interdum urna. Ut rhoncus, lectus sed condimentum dictum, dolor odio accumsan risus, eget malesuada enim lectus ut diam.',
        style: TimelineNodeStyle(
            pointType: TimelineNodePointType.Circle,
            pointColor: Colors.red,
            lineType: TimelineNodeLineType.Full,
            lineColor: Colors.red)),
    HomePageTimelineObject(
        message:
            'Nullam tincidunt nunc libero, vel efficitur ex elementum quis. Nam non ex laoreet, imperdiet tellus vitae, finibus augue.',
        style: TimelineNodeStyle(
            pointType: TimelineNodePointType.Circle,
            pointColor: Colors.green,
            lineType: TimelineNodeLineType.TopHalf,
            lineColor: Colors.green)),
    HomePageTimelineObject(
        message:
            'Ut fringilla dui posuere, lobortis mauris vitae, pretium ipsum.',
        style: TimelineNodeStyle(
            type: TimelineNodeType.Right,
            pointType: TimelineNodePointType.Circle,
            pointRadius: 10,
            lineType: TimelineNodeLineType.BottomHalf,
            lineWidth: 5)),
    HomePageTimelineObject(
        message:
            'Ut fringilla dui posuere, lobortis mauris vitae, pretium ipsum.',
        style: TimelineNodeStyle(
            type: TimelineNodeType.Right,
            lineType: TimelineNodeLineType.Full,
            lineWidth: 5)),
    HomePageTimelineObject(
        message:
            'Praesent nulla sapien, vestibulum eget tincidunt ac, suscipit eget libero. Aliquam finibus sed nisi sed ornare.',
        style: TimelineNodeStyle(
            type: TimelineNodeType.Right,
            pointType: TimelineNodePointType.Circle,
            pointRadius: 10,
            lineType: TimelineNodeLineType.TopHalf,
            lineWidth: 5)),
  ];

  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timeline Node Demo'),
      ),
      body: ListView.builder(
        itemCount: this.widget.timelineObject.length,
        itemBuilder: (context, index) {
          return TimelineNode(
            style: this.widget.timelineObject[index].style,
            child: Padding(
              padding: EdgeInsets.only(right: 8, top: 4, bottom: 4),
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(this.widget.timelineObject[index].message),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
