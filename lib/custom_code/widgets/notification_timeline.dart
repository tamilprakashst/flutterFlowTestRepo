// Automatic FlutterFlow imports
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
import 'package:timelines/timelines.dart';

class NotificationTimeline extends StatefulWidget {
  const NotificationTimeline({
    Key? key,
    this.width,
    this.height,
    this.date,
    this.time,
    this.deviceName,
    this.context,
    this.count,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? date;
  final String? time;
  final String? deviceName;
  final String? context;
  final int? count;

  @override
  _NotificationTimelineState createState() => _NotificationTimelineState();
}

class _NotificationTimelineState extends State<NotificationTimeline> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FixedTimeline.tileBuilder(
          theme: TimelineThemeData(
            nodePosition: 0.2,
            connectorTheme: const ConnectorThemeData(
              thickness: 3.0,
            ),
          ),
          mainAxisSize: MainAxisSize.min,
          builder: TimelineTileBuilder.connectedFromStyle(
            contentsAlign: ContentsAlign.basic,
            oppositeContentsBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.date! + "\n" + widget.time!,
                style: const TextStyle(
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.black),
              ),
            ),
            contentsBuilder: (codropntext, index) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Container(
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                        title: Padding(
                          padding: const EdgeInsets.only(bottom: 4.0, top: 3.0),
                          child: Text(
                            widget.deviceName!,
                            style: const TextStyle(
                                fontFamily: 'Manrope',
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        subtitle: Text(
                          widget.context!,
                          style: const TextStyle(
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Color.fromRGBO(174, 177, 193, 1)),
                        )),
                  ),
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
              ),
            ),
            connectorStyleBuilder: (context, index) => ConnectorStyle.solidLine,
            indicatorStyleBuilder: (context, index) => IndicatorStyle.dot,
            itemCount: widget.count!,
          ),
        ),
      ],
    );
  }
}
