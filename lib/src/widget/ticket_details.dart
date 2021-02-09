import 'package:azapay/app/app.dart';
import 'package:azapay/src/models/models.dart';
import 'package:azapay/src/widget/button_arrow_ui.dart';
import 'package:flutter/material.dart';

class CustomTicketDetails extends StatelessWidget {
  final TicketDetails ticketDetails;

  const CustomTicketDetails({Key key, @required this.ticketDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipPath(
              clipper: TicketClipper(),
              child: AnimatedContainer(
                duration: Duration(seconds: 5),
                child: ticketDetails.child,
                width: ticketDetails.width,
                decoration: BoxDecoration(color: ColorSets.colorPin, borderRadius: BorderRadius.circular(30.0)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
              child: ButtonArrow(
                  navigatorfunc: ticketDetails.navigate,
                  buttontitle: ticketDetails.buttontitle,
                  arrow: ticketDetails.arrow,
                  buttontitleColor: ticketDetails.buttontitlecolor),
            )
          ],
        ),
      ),
    );
  }
}

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(0.0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0.0)
      ..addOval(Rect.fromCircle(center: Offset(0.0, size.height / 2), radius: 20.0))
      ..addOval(Rect.fromCircle(center: Offset(size.width, size.height / 2), radius: 20.0));
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// Navigator.push(context,
//   PageRouteBuilder(pageBuilder: (context, _, __) {
// return CustomTicketDetails(
//     child: Padding(
//       padding: EdgeInsets.symmetric(horizontal: 30),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Center(
//                 child: Text(
//               AppStrings.ticketHeader,
//               style: AppTextStyles.h2style,
//               textAlign: TextAlign.center,
//             )),
//           ),
//           Divider(),
//           Text(
//             AppStrings.ticketSubHeaderI,
//             style: AppTextStyles.h3style,
//           ),
//           Column(
//             children: [],
//           ),
//           Divider(),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Text(
//                   AppStrings.ticketSubHeaderII,
//                   style: AppTextStyles.h3style,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     ),
//     arrow: false,
//     navigate: () {
//       Navigator.pop(context);
//     },
//     buttontitlecolor: ColorSets.colorPrimaryBlack,
//     buttontitle: 'Proceed',
//     width: MediaQuery.of(context).size.height / 2);
// }));
