import 'package:azapay/app/app.dart';
import 'package:azapay/src/blocs/blocs.dart';
import 'package:azapay/src/ui/ui.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'common/index.dart';

/*
 *  MultiColumn for Flutter
 *
 *  Copyright (c) 2019 Rody Davis
 *
 *  Released under MIT License.
 */

class TwoColumnNavigation extends StatefulWidget {
  TwoColumnNavigation({
    @required this.sections,
    this.showDetailsArrows = true,
    // this.expandedIconData,
    // this.collapsedIconData = Icons.fullscreen,
    this.initiallyExpanded = true,
    this.bottomAppBar,
    this.backgroundColor,
    this.title,
    // this.actions,
  });

  final Color backgroundColor;
  final Widget bottomAppBar;
  // final IconData expandedIconData, collapsedIconData;
  final bool initiallyExpanded;
  List<MainSection> sections;
  final bool showDetailsArrows;
  final Widget title;
  // final List<Widget> actions;

  @override
  _TwoColumnNavigationState createState() => _TwoColumnNavigationState();
}

class _TwoColumnNavigationState extends State<TwoColumnNavigation> with SingleTickerProviderStateMixin {
  AutoScrollController controller;

  bool _expanded = true;
  int _listIndex = 0;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int _sectionIndex = 0;
  ValueNotifier<int> _menuNotifier = ValueNotifier(0);
  AnimationController _animationController;
  bool isPlaying = false;

  @override
  void initState() {
    if (!widget.initiallyExpanded) if (mounted)
      setState(() {
        _expanded = false;
      });

    _setUpController(true);
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    super.initState();
  }

  void _setUpController(bool init) {
    controller = AutoScrollController(
      viewportBoundaryGetter: () => Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
      axis: Axis.vertical,
    );
  }

  Future _scrollToIndex(int value, {AutoScrollPosition position = AutoScrollPosition.middle}) async {
    try {
      controller.scrollToIndex(
        value,
        preferPosition: position,
      );
      // controller.highlight(value);
    } on Exception catch (e) {
      //print('Could not scroll to index: $value => $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 720) {
          final _showMenu = constraints.maxWidth < 1100;
          if (_showMenu) {
            _expanded = false;
          }
          return ValueListenableBuilder<int>(
            valueListenable: _menuNotifier,
            builder: (context, menu_value, _) => Material(
              child: Row(
                children: <Widget>[
                  if (_expanded)
                    Container(
                      width: 250,
                      child: Scaffold(
                        backgroundColor: widget?.backgroundColor,
                        appBar: AppBar(
                          title: widget?.title,
                          centerTitle: true,
                          elevation: 2.0,
                          automaticallyImplyLeading: false,
                          leading: IconButton(
                            icon: AnimatedIcon(
                              icon: AnimatedIcons.home_menu,
                              progress: _animationController,
                              semanticLabel: 'Show menu',
                            ), //Icon(widget.expandedIcon),
                            onPressed: () {
                              if (mounted)
                                setState(() {
                                  _expanded = false;
                                  isPlaying = !isPlaying;
                                  isPlaying ? _animationController.forward() : _animationController.reverse();
                                });
                            },
                          ),
                        ),
                        body: SectionsList(
                          sections: widget.sections,
                          sectionIndex: _sectionIndex,
                          sectionTap: (index) {
                            if (_sectionIndex != index) {
                              _menuNotifier.value = 0;
                              if (mounted)
                                setState(() {
                                  _sectionIndex = index;
                                });
                              _setUpController(false);
                            }
                          },
                        ),
                        bottomNavigationBar: widget?.bottomAppBar,
                      ),
                    ),
                  // Container(
                  //   width: 400,
                  //   child: Scaffold(
                  //     drawerScrimColor: Colors.transparent,
                  //     drawer: _showMenu
                  //         ? SectionsDrawer(
                  //             sections: widget.sections,
                  //             sectionIndex: _sectionIndex,
                  //             sectionChanged: (context, index) {
                  //               if (_sectionIndex != index) {
                  //                 if (mounted)
                  //                   setState(() {
                  //                     _sectionIndex = index;
                  //                   });
                  //                 _setUpController(false);
                  //                 Navigator.pop(context);
                  //               }
                  //             },
                  //           )
                  //         : null,
                  //     appBar: AppBar(
                  //       leading: _showMenu
                  //           ? MenuButton(scaffoldKey: _scaffoldKey)
                  //           : !_expanded
                  //               ? IconButton(
                  //                   icon: Icon(widget.collapsedIconData),
                  //                   onPressed: () {
                  //                     if (mounted)
                  //                       setState(() {
                  //                         _expanded = true;
                  //                       });
                  //                   },
                  //                 )
                  //               : null,
                  //       title: widget.sections[_sectionIndex].label,
                  //     ),
                  //     body: SectionList(
                  //       controller: controller,
                  //       section: widget.sections[_sectionIndex],
                  //       listIndex: _listIndex,
                  //       listTap: (index) {
                  //         if (_listIndex != index) {
                  //           if (mounted)
                  //             setState(() {
                  //               _listIndex = index;
                  //             });
                  //         }
                  //       },
                  //     ),
                  //     bottomNavigationBar: widget.sections[_sectionIndex]?.bottomAppBar,
                  //   ),
                  // ),
                  Expanded(
                    child: Container(
                      child: Stack(
                        children: <Widget>[
                          DetailsView(
                            automaticallyImplyLeading: false,
                            actions: [
                              IconButton(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                icon: Icon(MdiIcons.bellOutline),
                                onPressed: () {
                                  _menuNotifier.value = 2;
                                },
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  BlocBuilder<ProfileBloc, ProfileState>(
                                    builder: (context, state) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                        child: Text((state is ProfileLoaded) ? '#' + state.signUp.data.tag : '-----',
                                            style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.w600)),
                                      );
                                    },
                                  ),
                                  InkWell(
                                    onTap: () {
                                      _menuNotifier.value = 1;
                                    },
                                    radius: 15,
                                    // hoverColor: ColorSets.colorPrimaryLightYellow,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                      child: CircleAvatar(
                                        maxRadius: 20,
                                        backgroundColor: ColorSets.colorPrimaryWhite,
                                        child: IconTheme(
                                          data: IconThemeData(),
                                          child: Icon(
                                            Icons.account_circle,
                                            color: ColorSets.colorGrey,
                                            size: 40,
                                          ),
                                        ),
                                      ),
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  )
                                ],
                              )
                            ],
                            drawerScrimColor: Colors.transparent,
                            drawer: _showMenu
                                ? SectionsDrawer(
                                    sections: widget.sections,
                                    sectionIndex: _sectionIndex,
                                    sectionChanged: (context, index) {
                                      if (_sectionIndex != index) {
                                        if (mounted)
                                          setState(() {
                                            _sectionIndex = index;
                                          });
                                        _setUpController(false);
                                        Navigator.pop(context);
                                      }
                                    },
                                  )
                                : null,
                            scaffoldKey: _scaffoldKey,

                            // automaticallyImplyLeading: false,
                            leading: _showMenu
                                ? MenuButton(scaffoldKey: _scaffoldKey)
                                : !_expanded
                                    ? IconButton(
                                        icon: AnimatedIcon(
                                          icon: AnimatedIcons.home_menu,
                                          progress: _animationController,
                                          semanticLabel: 'Show menu',
                                        ), //widget.collapsedIconData,
                                        onPressed: () {
                                          if (mounted)
                                            setState(() {
                                              _expanded = true;
                                              // _expanded = false;
                                              isPlaying = !isPlaying;
                                              isPlaying
                                                  ? _animationController.forward()
                                                  : _animationController.reverse();
                                            });
                                        },
                                      )
                                    : null,
                            isFirst: _listIndex == 0,
                            isLast: widget.sections[_sectionIndex].itemCount == _listIndex + 1,
                            listIndex: _listIndex,
                            details: menu_value == 0
                                ? widget.sections[_sectionIndex].getDetails(context, _listIndex)
                                : menu_value == 1
                                    ? DetailsWidget(child: ProfileWebUI())
                                    : menu_value == 2
                                        ? DetailsWidget(child: NotificationWebUI())
                                        : DetailsWidget(child: EmptyWidgetUI()),
                            // showDetailsArrows: widget.showDetailsArrows,
                            // previous: () {
                            //   if (mounted)
                            //     setState(() {
                            //       _listIndex--;
                            //     });
                            //   _scrollToIndex(_listIndex);
                            // },
                            // next: () {
                            //   if (mounted)
                            //     setState(() {
                            //       _listIndex++;
                            //     });
                            //   _scrollToIndex(_listIndex);
                            // },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return Scaffold(
          drawer: SectionsDrawer(
            sections: widget.sections,
            sectionIndex: _sectionIndex,
            sectionChanged: (context, index) {
              if (_sectionIndex != index) {
                if (mounted)
                  setState(() {
                    _sectionIndex = index;
                  });

                _setUpController(false);
                Navigator.pop(context);
              }
            },
          ),
          appBar: AppBar(
            title: widget.sections[_sectionIndex]?.label,
          ),
          body:

              // DetailsView(
              //   isFirst: _listIndex == 0,
              //   isLast: widget.sections.isNotEmpty && _listIndex == widget.sections.length - 1,
              //   listIndex: _listIndex,
              //   details: widget.sections[_sectionIndex].getDetails(context, _listIndex),
              //   // showDetailsArrows: false,
              // ),

              SectionList(
            controller: controller,
            section: widget.sections[_sectionIndex],
            listIndex: _listIndex,
            listTap: (index) {
              if (_listIndex != index) {
                if (mounted) {
                  setState(() {
                    _listIndex = index;
                  });
                }
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) {
                    final _details = widget.sections[_sectionIndex].getDetails(context, _listIndex);
                    return DetailsView(
                      actions: [
                        IconButton(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          icon: Icon(MdiIcons.bellOutline),
                          onPressed: () {},
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BlocBuilder<ProfileBloc, ProfileState>(
                              builder: (context, state) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                  child: Text(
                                    (state is ProfileLoaded) ? '#${state.tag}' : '-----',
                                    style: AppTextStyles.h3style,
                                  ),
                                );
                              },
                            ),
                            InkWell(
                              onTap: () {},
                              radius: 25,
                              hoverColor: ColorSets.colorPrimaryLightYellow,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                child: CircleAvatar(
                                  maxRadius: 20,
                                  backgroundColor: ColorSets.colorPrimaryWhite,
                                  child: IconTheme(
                                    data: IconThemeData(),
                                    child: Icon(
                                      Icons.account_circle,
                                      color: ColorSets.colorPin,
                                      size: 40,
                                    ),
                                  ),
                                ),
                              ),
                              borderRadius: BorderRadius.circular(30),
                            )
                          ],
                        )
                      ],
                      isFirst: _listIndex == 0,
                      isLast: widget.sections.isNotEmpty && _listIndex == widget.sections.length - 1,
                      listIndex: _listIndex,
                      details: _details,
                      // showDetailsArrows: false,
                    );
                  },
                ));
              }
            },
          ),
          bottomNavigationBar: widget.sections[_sectionIndex]?.bottomAppBar,
        );
      },
    );
  }
}

class MenuButton extends StatelessWidget {
  const MenuButton({
    Key key,
    @required GlobalKey<ScaffoldState> scaffoldKey,
  })  : _scaffoldKey = scaffoldKey,
        super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.menu),
      onPressed: () {
        Scaffold.of(context).openDrawer();
        // _scaffoldKey.currentState.showBodyScrim(true, 0.5);
      },
    );
  }
}

class SectionsDrawer extends StatelessWidget {
  const SectionsDrawer({
    Key key,
    @required int sectionIndex,
    @required this.sectionChanged,
    @required this.sections,
  })  : _sectionIndex = sectionIndex,
        super(key: key);

  final List<MainSection> sections;

  final int _sectionIndex;

  final Function(BuildContext, int) sectionChanged;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SectionsList(
        sections: sections,
        sectionIndex: _sectionIndex,
        sectionTap: (index) => sectionChanged(context, index),
      ),
    );
  }
}

class MainSection {
  const MainSection({
    @required this.itemBuilder,
    @required this.itemCount,
    @required this.getDetails,
    @required this.icon,
    @required this.label,
    this.bottomAppBar,
  });

  final Widget bottomAppBar;
  final Icon icon;
  final int itemCount;
  final Text label;

  final Widget Function(BuildContext context, int index, bool selected) itemBuilder;

  final DetailsWidget Function(BuildContext context, int index) getDetails;
}

class DetailsWidget {
  const DetailsWidget({
    @required this.child,
    this.actions,
    this.title,
    this.bottomAppBar,
  });

  final List<Widget> actions;
  final Widget bottomAppBar;
  final Widget child;
  final Text title;
}
