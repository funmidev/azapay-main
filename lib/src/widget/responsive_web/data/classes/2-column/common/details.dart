import 'package:azapay/app/app.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../two_column_navigation.dart';

class DetailsView extends StatelessWidget {
  const DetailsView(
      {Key key,
      @required int listIndex,
      @required DetailsWidget details,
      this.previous,
      this.next,
      this.isLast = false,
      this.isFirst = false,
      this.drawer,
      this.drawerScrimColor,
      this.automaticallyImplyLeading = true,
      // this.showDetailsArrows = false,
      @required this.actions,
      this.scaffoldKey,
      this.leading})
      : _listIndex = listIndex,
        _details = details,
        super(key: key);

  final int _listIndex;
  final DetailsWidget _details;
  final VoidCallback previous, next;
  // final bool showDetailsArrows;
  final Widget drawer;
  final Color drawerScrimColor;
  final bool isLast, isFirst;
  final bool automaticallyImplyLeading;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final Widget leading;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerScrimColor: drawerScrimColor,
      drawer: drawer,
      backgroundColor: ColorSets.colorPrimaryWhite,
      key: scaffoldKey,
      appBar: AppBar(
        elevation: 2.0,
        automaticallyImplyLeading: automaticallyImplyLeading,
        leading: leading,
        title: _details.title,
        // : Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: <Widget>[
        //       // Row(
        //       //   mainAxisSize: MainAxisSize.min,
        //       //   children: <Widget>[
        //       //     IconButton(
        //       //       icon: Icon(Icons.arrow_upward),
        //       //       onPressed: isFirst ? null : previous,
        //       //     ),
        //       //     IconButton(
        //       //       icon: Icon(Icons.arrow_downward),
        //       //       onPressed: isLast ? null : next,
        //       //     ),
        //       //   ],
        //       // ),
        //       if (_details?.title != null)
        //         Expanded(
        //           child: Center(child: _details.title),
        //         ),
        //     ],
        //   ),
        // actions: _details?.actions,
        actions: actions,
      ),
      body: _details.child,
      bottomNavigationBar: _details?.bottomAppBar,
    );
  }
}
