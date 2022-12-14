


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ninan/components/buttons/custom_button.dart';
import 'package:ninan/components/dialogs/location_dialog.dart';
import 'package:ninan/models/category.dart';
import 'package:ninan/models/location.dart';
import 'package:ninan/utils/app_colors.dart';
import 'package:ninan/utils/app_colors.dart';
import 'package:ninan/components/app_repo/progress_indicator_state.dart';
import 'package:ninan/components/app_repo/navigation_state.dart';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ninan/screens/home/components/home_appbar.dart';
import 'package:ninan/screens/home/home1_screen.dart';
import 'package:ninan/screens/location/addLocation_screen.dart';
import 'package:provider/provider.dart';
import 'package:ninan/components/app_data/shared_preferences_helper.dart';
import 'package:ninan/components/app_repo/app_state.dart';
import 'package:ninan/components/connectivity/network_indicator.dart';
import 'package:ninan/components/custom_text_form_field/custom_text_form_field.dart';
import 'package:ninan/components/gradient_app_bar/gradient_app_bar.dart';
import 'package:ninan/components/no_data/no_data.dart';
import 'package:ninan/components/safe_area/page_container.dart';
import 'package:ninan/locale/localization.dart';
import 'package:ninan/services/access_api.dart';
import 'package:ninan/utils/app_colors.dart';
import 'package:ninan/models/category.dart';
import 'package:ninan/models/store.dart';
import 'package:ninan/utils/utils.dart';
import 'package:ninan/components/app_repo/store_state.dart';
import 'package:ninan/components/store_card/store_card_item.dart';
import 'package:ninan/screens/home/components/slider_images.dart';
import 'package:ninan/screens/home/components/category_item1.dart';
import 'package:ninan/components/app_repo/progress_indicator_state.dart';
import 'package:ninan/components/progress_indicator_component/progress_indicator_component.dart';

class FilterDoneOrders extends StatefulWidget {
  const FilterDoneOrders({Key key}) : super(key: key);
  @override
  _FilterDoneOrdersState createState() => _FilterDoneOrdersState();
}

class _FilterDoneOrdersState extends State<FilterDoneOrders> {
  Services _services = Services();
  Future<List<Location>> _locationList;
  AppState _appState;
  NavigationState _navigationState;
  ProgressIndicatorState _progressIndicatorState;
  bool _initialRun = true;







  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initialRun) {
      _initialRun = false;
      _appState = Provider.of<AppState>(context);
      _navigationState = Provider.of<NavigationState>(context);
      _progressIndicatorState = Provider.of<ProgressIndicatorState>(context);

    }
  }



  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
          padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Container(
                height: 30,
                child: Image.asset('assets/images/bottomTop.png'),
              ),

              Container(
                padding: EdgeInsets.only(right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("?????? ?????????????? ??????????????",style: TextStyle(color: cText,fontSize: 16,fontWeight: FontWeight.bold),),
                    Padding(padding: EdgeInsets.all(5)),
                    Text("?????? ?????????????? ?????????????? ?????? ????????????",style: TextStyle(color: cHintColor,fontSize: 13),),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.all(8)),
              Expanded(child: Column(
                children: <Widget>[

                  ListTile(
                    leading: _appState.filterOrders==11?Image.asset("assets/images/actCheck.png"):Image.asset("assets/images/nonCheck.png"),
                    title: GestureDetector(
                      child: Text("????????"),
                      onTap: (){

                        _appState.setCurrentFilterOrders(11);
                        _navigationState.upadateNavigationIndex(1);
                        Navigator.pushNamed(context, '/navigation');

                      },
                    ),
                  ),



                  ListTile(
                    leading: _appState.filterOrders==5?Image.asset("assets/images/actCheck.png"):Image.asset("assets/images/nonCheck.png"),
                    title: GestureDetector(
                      child: Text("???? ??????????????"),
                      onTap: (){
                        _appState.setCurrentFilterOrders(5);
                        _navigationState.upadateNavigationIndex(1);
                        Navigator.pushNamed(context, '/navigation');

                      },
                    ),
                  ),



                  ListTile(

                    leading: _appState.filterOrders==4?Image.asset("assets/images/actCheck.png"):Image.asset("assets/images/nonCheck.png"),
                    title: GestureDetector(
                      child: Text("???? ??????????????"),
                      onTap: (){
                        _appState.setCurrentFilterOrders(4);
                        _navigationState.upadateNavigationIndex(1);
                        Navigator.pushNamed(context, '/navigation');

                      },
                    ),
                  ),





                ],
              )

              ),




            ],
          ));
    });
  }
}
