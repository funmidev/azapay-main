import 'package:azapay/app/app.dart';
import 'package:azapay/src/blocs/blocs.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileHeaderWebUI extends StatefulWidget {
  const ProfileHeaderWebUI({
    Key key,
  }) : super(key: key);

  @override
  _ProfileHeaderWebUIState createState() => _ProfileHeaderWebUIState();
}

class _ProfileHeaderWebUIState extends State<ProfileHeaderWebUI> {
  ProfileBloc _profileBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _profileBloc = context.bloc<ProfileBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return Row(
          children: [
            InkWell(
              onTap: () {
                _profileBloc.add(ProfileImage());
              },
              child: CircleAvatar(
                backgroundColor: ColorSets.colorPrimaryWhite,
                child: Icon(
                  Icons.account_circle,
                  color: ColorSets.colorGrey,
                  size: 80,
                ),
                maxRadius: 40,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  (state is ProfileLoaded) ? state.signUp.data.lastName + state.signUp.data.firstName : '----------',
                  style: AppTextStyles.h2style,
                ),
                Text((state is ProfileLoaded) ? '${state.signUp?.data?.phone}' : AppStrings.empty,
                    style: AppTextStyles.h3style),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 6,
                      height: MediaQuery.of(context).size.width / 35,
                      child: BorderButtonUI(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        title: AppStrings.settingsWebchangePhoto,
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 6,
                      height: MediaQuery.of(context).size.width / 35,
                      child: BorderButtonUI(
                        backgroundColor: ColorSets.colorPrimaryLightYellow,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        title: AppStrings.settingsWebremovePhoto,
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ],
            )
            //todo: profile
          ],
        );
      },
    );
  }
}
