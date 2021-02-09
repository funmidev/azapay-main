import 'package:azapay/app/app.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:azapay/utils/utils.dart';
import 'package:flutter/material.dart';

class LabeledRadio extends StatelessWidget {
  const LabeledRadio(
      {@required this.label,
      @required this.padding,
      @required this.groupValue,
      @required this.value,
      @required this.onChanged,
      @required this.vector,
      this.transferstyle = false,
      this.imagebyte,
      this.title,
      this.vectorpath});

  final String label;
  final EdgeInsets padding;
  final int groupValue;
  final int value;
  final bool transferstyle;
  final Function(int) onChanged;
  final bool vector;
  final String vectorpath;
  final dynamic imagebyte;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (value != groupValue) onChanged(value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            vector
                ? Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: vectorpath.isEmpty
                        ? CircleAvatar(
                            child: Icon(Icons.person),
                            backgroundColor: ColorSets.colorPin,
                          )
                        : Image.asset(vectorpath),
                  )
                : EmptyWidgetUI(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    title.isNotEmpty
                        ? Text(
                            title,
                            style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.w600),
                          )
                        : EmptyWidgetUI(),
                    Text(
                      label,
                      style: transferstyle
                          ? AppTextStyles.h3style.copyWith(color: Color(0XFF818181))
                          : AppTextStyles.h3style.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: Radio<int>(
                activeColor: ColorSets.colorPrimaryLightYellow,
                groupValue: groupValue,
                value: value,
                onChanged: onChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class MyStatefulWidget extends StatefulWidget {
//   MyStatefulWidget({Key key}) : super(key: key);

//   @override
//   _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
// }

// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//   int _isRadioSelected;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <LabeledRadio>[
//           LabeledRadio(
//             label: 'This is the first label text',
//             padding: const EdgeInsets.symmetric(horizontal: 5.0),
//             value: 0,
//             groupValue: _isRadioSelected,
//             onChanged: (newValue) {
//               setState(() {
//                 _isRadioSelected = newValue;
//               });
//             },
//           ),
//           LabeledRadio(
//             label: 'This is the second label text',
//             padding: const EdgeInsets.symmetric(horizontal: 5.0),
//             value: 1,
//             groupValue: _isRadioSelected,
//             onChanged: (newValue) {
//               setState(() {
//                 _isRadioSelected = newValue;
//               });
//             },
//           ),
//           LabeledRadio(
//             label: 'This is the second label text',
//             padding: const EdgeInsets.symmetric(horizontal: 5.0),
//             value: 2,
//             groupValue: _isRadioSelected,
//             onChanged: (newValue) {
//               setState(() {
//                 _isRadioSelected = newValue;
//               });
//             },
//           ),
//           LabeledRadio(
//             label: 'This is the second label text',
//             padding: const EdgeInsets.symmetric(horizontal: 5.0),
//             value: 3,
//             groupValue: _isRadioSelected,
//             onChanged: (newValue) {
//               setState(() {
//                 _isRadioSelected = newValue;
//               });
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
