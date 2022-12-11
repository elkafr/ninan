import 'package:flutter/material.dart';
import 'package:ninan/models/user.dart';
import 'package:ninan/models/category.dart';

class AppState extends ChangeNotifier {
  User _currentUser;
  void setCurrentUser(User currentUser) {
    _currentUser = currentUser;
    notifyListeners();
  }

  User get currentUser => _currentUser;



 bool _acceptTerms = false;

  void setAcceptTerms(bool acceptTerms) {
    _acceptTerms = acceptTerms;
    notifyListeners();
  }

  bool get acceptTerms => _acceptTerms;

 void  updateUserEmail(String newUserEmail){
   _currentUser.userEmail = newUserEmail;
   notifyListeners();
 }

 void  updateUserPhone(String newUserPhone){
   _currentUser.userPhone = newUserPhone;
   notifyListeners();
 }

  void  updateUserName(String newUserName){
   _currentUser.userName = newUserName;
   notifyListeners();
 }

  // current language from shared prefernces 'ar' or 'en'
  String _currentLang;
  
 void setCurrentLanguage(String currentLang) {
    _currentLang = currentLang;
    notifyListeners();
  }

  String get currentLang => _currentLang;
  // int _notificationLength = 0 ;


  // void updateNotification(int value ){
  //   _notificationLength = value;
  //   notifyListeners();
  // }

  // int get notificationLength => _notificationLength;


  String _phoneSend;

  void setCurrentPhoneSend(String phoneSend) {
    _phoneSend = phoneSend;
    notifyListeners();
  }

  String get phoneSend => _phoneSend;


  String _tokenSend;

  void setCurrentTokenSend(String tokenSend) {
    _tokenSend = tokenSend;
    notifyListeners();
  }

  String get tokenSend => _tokenSend;

   // update current cat
  Category  _selectedCat ;
  void setSelectedCat(Category selectedCat){
    _selectedCat = selectedCat;
    notifyListeners();
  }
  Category  get selectedCat => _selectedCat;

  // update current cat name
  String  _selectedCatName ;
  void setSelectedCatName(String selectedCatName){
    _selectedCatName = selectedCatName;
    notifyListeners();
  }
  String  get selectedCatName => _selectedCatName;


  // update current sub
  Category  _selectedSub ;
  void setSelectedSub(Category selectedSub){
    _selectedSub = selectedSub;
    notifyListeners();
  }
  Category  get selectedSub => _selectedSub;




  // filter provider
  int _filter;
  void setCurrentFilter(int filter) {
    _filter= filter;
    notifyListeners();
  }
  int get filter => _filter;





  // add note provider
  String _note;
  void setCurrentNote(String filter) {
    _note= filter;
    notifyListeners();
  }
  String get note => _note;


  // select pay method provider
  String _payMethod;
  void setCurrentPayMethod(String payMethod) {
    _payMethod= payMethod;
    notifyListeners();
  }
  String get payMethod => _payMethod;


  // cupone value provider
  String _cupone;
  void setCurrentCupone(String cupone) {
    _cupone= cupone;
    notifyListeners();
  }
  String get cupone => _cupone;



  // filter orders provider
  int _filterOrders;
  void setCurrentFilterOrders(int filterOrders) {
    _filterOrders= filterOrders;
    notifyListeners();
  }
  int get filterOrders => _filterOrders;



  // selectTab provider
  String _selectTab;
  void setCurrentSelectTab(String selectTab) {
    _selectTab= selectTab;
    notifyListeners();
  }
  String get selectTab => _selectTab;




}
