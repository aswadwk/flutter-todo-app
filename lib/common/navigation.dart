import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class NavigationName {
  static String INFO = "info";
  static String INVITATION = "invitation";
  static String REQUEST_BUDGET = "request_budget";
  static String EXPENSES = "expenses";
  static String BUDGET = "budget";
  static String REPORTS = "reports";
  static String BINDING = "binding";
}

class Navigation {
  static intentWithData(String routeName, Object arguments) {
    navigatorKey.currentState?.pushNamed(routeName, arguments: arguments);
  }

  static back() => navigatorKey.currentState?.pop();
}
