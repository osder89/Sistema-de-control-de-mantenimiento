import 'package:flutter/material.dart';
import 'package:logindeunaapp/src/blocs/login_doc.dart';

export 'package:logindeunaapp/src/blocs/login_doc.dart';

class Provider extends InheritedWidget {
  final loginBloc = LoginBloc();

  Provider({Key? key, required Widget child}) : super(key: key, child: child);
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
  static LoginBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<Provider>() as Provider)
        .loginBloc;
  }

//  Provider({required super.child});
}
