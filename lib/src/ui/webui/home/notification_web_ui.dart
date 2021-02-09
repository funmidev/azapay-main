import 'package:azapay/app/app.dart';
import 'package:azapay/src/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationWebUI extends StatefulWidget {
  @override
  _NotificationWebUIState createState() => _NotificationWebUIState();
}

class _NotificationWebUIState extends State<NotificationWebUI> {
  NotificationBloc _notificationBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _notificationBloc = context.bloc<NotificationBloc>();
    _notificationBloc.add(FetchFundRequest());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Center(
        child: ListView(
          children: [
            Center(
              child: Container(
                height: MediaQuery.of(context).size.width / 4,
                width: MediaQuery.of(context).size.width / 3,
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
                          AppStrings.notificationEmptySubTitle,
                          style: AppTextStyles.h3style,
                        ),
                      ],
                    ),
                  ),
                ),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: ColorSets.colorPin),
              ),
            )
          ],
        ),
      ),
    );
  }
}
