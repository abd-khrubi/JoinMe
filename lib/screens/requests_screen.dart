import 'package:flutter/material.dart';
import 'package:flutter_app/models/activity.dart';
import 'package:flutter_app/models/campus.dart';
import 'package:flutter_app/widgets/request_list_item.dart';
import 'package:flutter_app/models/request.dart';

class RequestsScreen extends StatelessWidget {
  Request request = Request(
    '1',
    "hiiiiii",
    Activity.basketball,
    Campus.givat,
    DateTime.now(),
    DateTime.now(),
  );
  Request request2 = Request(
    '2',
    "hiiiiii",
    Activity.running,
    Campus.givat,
    DateTime.now(),
    DateTime.now(),
  );
  Request request3 = Request(
    '3',
    "hiiiiii",
    Activity.chess,
    Campus.givat,
    DateTime.now(),
    DateTime.now(),
  );
  Request request4 = Request(
    '4',
    "hiiiiii",
    Activity.football,
    Campus.givat,
    DateTime.now(),
    DateTime.now(),
  );

  @override
  Widget build(BuildContext context) {
    List<Request> newList = [request, request2, request3, request4, request4, request4];

    return Scaffold(
      appBar: AppBar(
        title: Text("Requests"),
      ),
      body: ListView.builder(
        itemCount: newList.length,
        itemBuilder: (context, index) {
          return RequestListItem(newList[index]);
        },
      ),
    );
  }
}
