import 'package:azapay/app/app.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/material.dart';

class ReferralCodeUI extends StatefulWidget {
  @override
  _ReferralCodeUIState createState() => _ReferralCodeUIState();
}

class _ReferralCodeUIState extends State<ReferralCodeUI> {
  final TextEditingController _referralController = TextEditingController();
  final FocusNode _referralnode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(AppStrings.referralOne),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(AppStrings.referralTwo,style: AppTextStyles.h3style),
            ),
          ),  
          Center(
            child: FormFieldUI(
              currentnode: _referralnode, 
              fieldController: _referralController, 
              hint: AppStrings.referralThree, 
              textInputAction: TextInputAction.done, 
              textInputType: TextInputType.number, 
              maxLength: null,
              errorText: '',
              onchanged: null),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:50.0,vertical: 10),
            child: ButtonArrow(
              navigatorfunc: (){
                
              }, 
              buttontitle: AppStrings.referralFour, 
              arrow: false, 
              buttontitleColor: ColorSets.colorPrimaryBlack),
          )
        ],
      ),
    );
  }
}