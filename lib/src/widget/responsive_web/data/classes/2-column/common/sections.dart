import 'package:azapay/app/app.dart';
import 'package:flutter/material.dart';

import '../two_column_navigation.dart';

class SectionsList extends StatelessWidget {
  const SectionsList({
    Key key,
    @required this.sectionTap,
    @required int sectionIndex,
    @required this.sections,
  })  : _sectionIndex = sectionIndex,
        super(key: key);

  final int _sectionIndex;
  final ValueChanged<int> sectionTap;
  final List<MainSection> sections;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final _item = sections[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
          child: Card(
            elevation: 0.0,
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              hoverColor: ColorSets.colorPrimaryLightYellow,
              leading: _item.icon,
              focusColor: ColorSets.colorPrimaryLightYellow,
              title: _item.label,
              selectedTileColor: ColorSets.colorPrimaryLightYellow,
              selected: index == _sectionIndex,
              onTap: () => sectionTap(index),
            ),
          ),
        );
      },
      itemCount: sections.length,
    );
  }
}
