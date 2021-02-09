import 'package:azapay/app/app.dart';
import 'package:flutter/material.dart';

class DocumentsUI extends StatefulWidget {
  @override
  _DocumentsUIState createState() => _DocumentsUIState();
}

class _DocumentsUIState extends State<DocumentsUI> {
  final ScrollController _controllerOne = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(AppStrings.documentOne,
            style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.w600, fontSize: 20)),
      ),
      //todo: BlocBuilder
      body: Container(
        height: MediaQuery.of(context).size.width / 2,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppStrings.activityDocNotifyEmptyTitle,
                  style: AppTextStyles.h2style.copyWith(fontSize: 18),
                ),
                Text(
                  AppStrings.docEmptySubTitle,
                  style: AppTextStyles.h3style,
                ),
              ],
            ),
          ),
        ),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: ColorSets.colorPin),
      ),
      // body: Scrollbar(
      //       controller: _controllerOne,
      //                 child: ListView.builder(
      //                   controller: _controllerOne,
      //         shrinkWrap: true,
      //         itemBuilder: null), ), //Loading activity -> If empty then show the no document yet message
    );
  }
}
