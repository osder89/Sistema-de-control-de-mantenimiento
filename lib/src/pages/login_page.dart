import 'package:flutter/material.dart';
import 'package:logindeunaapp/src/blocs/provide.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        _crearfondo(context),
        _loginform(context),
      ],
    ));
  }

  Widget _loginform(BuildContext context) {
    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(children: [
        SafeArea(
            child: Container(
          height: 180.0,
        )),
        Container(
          width: size.width * 0.85,
          margin: EdgeInsets.symmetric(vertical: 30.0),
          padding: EdgeInsets.symmetric(vertical: 50.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 3.0,
                    offset: Offset(0.0, 5.0),
                    spreadRadius: 3.0)
              ]),
          child: Column(children: [
            Text(
              'INGRESO DE USUARIO',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 60.0),
            _crearemail(bloc),
            SizedBox(height: 30.0),
            _password(bloc),
            SizedBox(height: 30.0),
            _crearBoton()
          ]),
        ),
        Text('¿Olvidaste tu contraseña?'),
        SizedBox(height: 100.0),
        Text('Resgistrate'),
        SizedBox(height: 100.0)
      ]),
    );
  }

  Widget _crearemail(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                icon: Icon(
                  Icons.alternate_email,
                  color: Colors.blueAccent,
                ),
                hintText: 'ejemplo@correo.com',
                labelText: 'Correo Electronico',
                counterText: snapshot.data,
                 errorText:snapshot.hasError ? snapshot.error.toString() : null 
                 ),
            onChanged: bloc.changeEmail,
          ),
        );
      },
    );
  }

  Widget _password(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(
                Icons.lock_outline,
                color: Colors.blueAccent,
              ),
              labelText: 'Contraseña',
             // counterText: snapshot.data, //esto despues quitar para que no se vea la contra
            //  errorText: snapshot.error.toString()
                errorText: snapshot.hasError ? snapshot.error.toString() : null
            ),
            onChanged: bloc.changePassword , //esto igual 
          ),
        );
      },
    );
  }

  Widget _crearBoton() {
    return ElevatedButton(
      onPressed: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
        child: Text('Ingresar'),
      ),
    );
  }

  Widget _crearfondo(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fondoMorado = Container(
      // es el codigo del fondo
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
        Color.fromRGBO(0, 80, 63, 1.0),
        Color.fromRGBO(0, 70, 178, 1.0)
      ])),
    );

    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Color.fromRGBO(255, 255, 255, 0.05)),
    );

    return Stack(
      children: [
        fondoMorado,
        Positioned(
          top: 90.0,
          left: 30.0,
          child: circulo,
        ),
        Positioned(
          top: -40.0,
          right: -30.0,
          child: circulo,
        ),
        Positioned(
          bottom: -50.0,
          right: -10.0,
          child: circulo,
        ),
        Positioned(
          bottom: 120.0,
          right: 20.0,
          child: circulo,
        ),
        Positioned(
          bottom: -50.0,
          left: -20.0,
          child: circulo,
        ),
        Container(
          padding: EdgeInsets.only(top: 80.0),
          child: Column(
            children: [
              Icon(Icons.person_pin_circle, color: Colors.white, size: 100.0),
              SizedBox(height: 10.0, width: double.infinity),
              Text('SI MANTENIMIENTO AUTOMOTRIZ',
                  style: TextStyle(color: Colors.white, fontSize: 25.0))
            ],
          ),
        ),
      ],
    );
  }
}
