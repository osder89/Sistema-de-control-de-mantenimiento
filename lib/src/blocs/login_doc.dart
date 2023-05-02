import 'dart:async';

import 'package:logindeunaapp/src/blocs/validators.dart';

class LoginBloc with Validators{
  final _emailcontroler = StreamController<String>.broadcast();
  final _passwordcontroler = StreamController<String>.broadcast();

  //recuperar la salida del stream
  Stream<String> get emailStream => _emailcontroler.stream.transform(validarEmail);
  Stream<String> get passwordStream => _passwordcontroler.stream.transform( validarPassword );

  //insertar valores al stream
  Function(String) get changeEmail => _emailcontroler.sink.add;
  Function(String) get changePassword => _passwordcontroler.sink.add;

  dispose() {
    _emailcontroler.close();
     _passwordcontroler.close();
  }
}
