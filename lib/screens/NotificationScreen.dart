import 'package:flutter/material.dart';
import 'package:flutter_app/models/app_user.dart';
import 'package:flutter_app/models/user_notification.dart';
import 'package:flutter_app/services/notification_service.dart';
import 'package:flutter_app/services/request_service.dart';
import 'package:flutter_app/utils/firebase_utils.dart';
import 'package:flutter_app/widgets/notification_list_item.dart';

import '../main.dart';

class NotificationScreen extends StatefulWidget {

  final AppUser usr;
  NotificationScreen(this.usr);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NotificationScreenState();
  }

}

class _NotificationScreenState extends State<NotificationScreen> {


  final NotificationService srvs = locator<NotificationService>();
  final RequestService rSrvs = locator<RequestService>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadThings();
  }

  void loadThings() async {
    await rSrvs.loadRequests();
  }

  @override
  Widget build(BuildContext context) {
    var srv = locator<NotificationService>();
    String currentUserUid = widget.usr.uid!;
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
      ),
      body: Container(
        height: 550,
        child: FutureBuilder(
          future: srv.loadNotifications(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<UserNotification> nList =
                  snapshot.data as List<UserNotification>;
              print(nList.length);
              print("hello im here wallah");
              var filteredList = nList
                  .where((element) => (element.responderUid == currentUserUid ||
                      getRequestByUid(element.requestUid!).requesterUid ==
                          currentUserUid))
                  .toList();
              return ListView.builder(
                itemCount: filteredList.length,
                itemBuilder: (context, index) {
                  return NotificationListItem(filteredList[index]);
                },
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );

  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_app/models/activity.dart';
// import 'package:flutter_app/models/app_user.dart';
// import 'package:flutter_app/models/campus.dart';
// import 'package:flutter_app/models/request.dart';
// import 'package:flutter_app/screens/ChooseCampusScreen.dart';
// import 'package:flutter_app/screens/requests_screen.dart';
// import 'package:flutter_app/widgets/MyDrawer.dart';
// import 'package:flutter_app/widgets/requestListItemNotifications.dart';
//
// class NotificationScreen extends StatelessWidget {
//   AppUser usr;
//
//   NotificationScreen(this.usr);
//
//   // Request request = Request(
//   //   "hiiiiii",
//   //   Activity.basketball,
//   //   Campus.givat,
//   //   DateTime.now(),
//   //   DateTime.now(),
//   // );
//   // Request request2 = Request(
//   //   "hiiiiii",
//   //   Activity.running,
//   //   Campus.givat,
//   //   DateTime.now(),
//   //   DateTime.now(),
//   // );
//   // Request request3 = Request(
//   //   "hiiiiii",
//   //   Activity.chess,
//   //   Campus.givat,
//   //   DateTime.now(),
//   //   DateTime.now(),
//   // );
//   // Request request4 = Request(
//   //   "hiiiiii",
//   //   Activity.football,
//   //   Campus.givat,
//   //   DateTime.now(),
//   //   DateTime.now(),
//   // );
//
//   @override
//   Widget build(BuildContext context) {
//     List<Request> newList = [
//       request,
//       request2,
//       request3,
//       request4,
//       request4,
//       request4
//     ];
//
//     return Scaffold(
//         appBar: AppBar(
//           title: FittedBox(fit: BoxFit.fitWidth, child: Text('Notifications')),
//           actions: [],
//         ),
//         backgroundColor: Colors.white,
//         body: Stack(children: [
//           Container(
//             child: ListView.builder(
//               itemCount: newList.length,
//               itemBuilder: (context, index) {
//                 return requestListItemNotifications(newList[index]);
//               },
//             ),
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               Container(
//                 alignment: Alignment.bottomCenter,
//               ),
//             ],
//           )
//         ]),
//         drawer: MyDrawer(usr));
//   }
// }
