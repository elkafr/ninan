

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ninan/models/user.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:ninan/components/app_repo/app_state.dart';
import 'package:ninan/components/app_repo/navigation_state.dart';
import 'package:ninan/components/app_repo/progress_indicator_state.dart';
import 'package:ninan/components/buttons/custom_button.dart';
import 'package:ninan/components/connectivity/network_indicator.dart';
import 'package:ninan/components/gradient_app_bar/gradient_app_bar.dart';
import 'package:ninan/components/progress_indicator_component/progress_indicator_component.dart';
import 'package:ninan/components/response_handling/response_handling.dart';
import 'package:ninan/components/safe_area/page_container.dart';
import 'package:ninan/locale/localization.dart';
import 'package:ninan/services/access_api.dart';
import 'package:ninan/utils/app_colors.dart';
import 'package:ninan/utils/utils.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class RegisterCodeActivationScreen extends StatefulWidget {
  @override
  _RegisterCodeActivationScreenState createState() =>
      _RegisterCodeActivationScreenState();
}

class _RegisterCodeActivationScreenState
    extends State<RegisterCodeActivationScreen> with TickerProviderStateMixin {
  String _activationCode = '';
  double _height, _width;
  Services _services = Services();
  AppState _appState;
  NavigationState _navigationState;
  ProgressIndicatorState _progressIndicatorState;
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  Widget _buildPinView() {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: PinCodeTextField(
          length: 4,
          obsecureText: false,
          inactiveColor: Theme.of(context).primaryColor,
          selectedColor: Theme.of(context).primaryColor,
          animationType: AnimationType.fade,
          animationDuration: Duration(milliseconds: 300),
          borderRadius: BorderRadius.circular(5),
          activeColor: Theme.of(context).primaryColor,
          fieldWidth: 50,

          onCompleted: (v) {
            print("Completed");
          },
          onChanged: (value) {
            _activationCode = value;
            print(value);
          },
        ));
  }

  Widget _buildBodyItem() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: _height * 0.2,
        ),
        Image.asset(
          'assets/images/codeCheck.png',
        ),
        SizedBox(
          height: _height * 0.05,
        ),

        Container(
            margin: EdgeInsets.only(
                left: _width * 0.1, right: _width * 0.1, top: _height * 0.05),
            child: Center(
                child: Text(
              AppLocalizations.of(context).enterCodeToActivateAccount,
              style: TextStyle(
                color: cBlack,
                fontSize: 17
              ),
              textAlign: TextAlign.center,
            ))),
        SizedBox(
          height: _height * 0.02,
        ),
        Container(
          child: Text("00966-"+_appState.phoneSend,style: TextStyle(color: cPrimaryColor,fontSize: 15),),
        ),
        SizedBox(
          height: _height * 0.02,
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: _width * 0.1,
          ),
          child: _buildPinView(),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: _width * 0.1,
            vertical: _width * 0.09,
          ),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
             Text("???? ???????? ?? ",style: TextStyle(color: cText,fontSize: 15),),
             Padding(padding: EdgeInsets.all(3)),
             GestureDetector(
               child: Text("?????? ?????????? ??????????",style: TextStyle(color: cPrimaryColor,fontSize: 15),),
               onTap: () async{





                 _firebaseMessaging.getToken().then((token) async {
                   //       print('mobile token $token');
                   _progressIndicatorState.setIsLoading(true);
                   var results = await _services.get(
                     '${Utils.SENDCODE_URL}?user_phone=${_appState.phoneSend}&token=${_appState.tokenSend}&lang=${_appState.currentLang}&key=$cKey',
                   );
                   _progressIndicatorState.setIsLoading(false);
                   if (results['response'] == '1') {
                     showToast(results['message'], context);
                     _appState.setCurrentUser(User(userId:results['user_id'].toString() ));
                     // Navigator.pushNamed(context, '/register_code_activation_screen' );
                   } else {
                     showErrorDialog(results['message'], context);
                   }
                 });




               },
             )
           ],
         ),
        ),
        SizedBox(
          height: _height * 0.1,
        ),

        Container(
            height: 60,
          
            margin: EdgeInsets.symmetric(
              horizontal: _width * 0.01,
            ),
            child: CustomButton(
                btnLbl: AppLocalizations.of(context).activation,
                onPressedFunction: () async {
                  _progressIndicatorState.setIsLoading(true);
                  var results = await _services.get(
                      'https://ninanapp.com/app/api/active_code?user_id=${_appState.currentUser.userId}&user_code=$_activationCode&lang=${_appState.currentLang}&key=$cKey');
                  _progressIndicatorState.setIsLoading(false);
                  if (results['response'] == '1') {

                    _appState.setCurrentUser(
                        User.fromJson(results['user_details']));
                    _navigationState.upadateNavigationIndex(0);
                    Navigator.pushReplacementNamed(context, '/navigation');
                    showToast(results['message'], context);


                  } else {
                    showErrorDialog(results['message'], context);
                  }
                }))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    _appState = Provider.of<AppState>(context);
    _navigationState = Provider.of<NavigationState>(context);
    final appBar = AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
    );
    _height = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    _width = MediaQuery.of(context).size.width;
    _progressIndicatorState = Provider.of<ProgressIndicatorState>(context);
      return  NetworkIndicator( child:PageContainer(
      child: Scaffold(
        backgroundColor: cWhite,
          body: Stack(
            children: <Widget>[
            ListView(
              children: <Widget>[

                _buildBodyItem()
              ],
            ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: GradientAppBar(
                  appBarTitle: AppLocalizations.of(context).activateCode,
                
                  leading: IconButton(
                    icon: Image.asset(
                      'assets/images/back.png',
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            
            Center(
            child: ProgressIndicatorComponent(),
          )   ],
          )),
    ));
  
  }
}
