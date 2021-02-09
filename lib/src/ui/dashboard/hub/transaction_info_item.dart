import 'package:flutter/material.dart';

class TransactionInfoItem extends StatelessWidget {
  const TransactionInfoItem({
    Key key,
    this.rightTitle,
    this.leftTitle,
    this.rightDetail,
    this.leftDetail,
    this.showRightItem,
  }) : super(key: key);
  final String rightTitle, leftTitle, rightDetail, leftDetail;
  final bool showRightItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        leftTitle,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        leftDetail,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              showRightItem
                  ? Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            rightTitle,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            rightDetail,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ))
                  : Container()
            ],
          ),
        ),
        Divider(
          thickness: .5,
          color: Colors.grey,
        ),
      ],
    );
  }
}
