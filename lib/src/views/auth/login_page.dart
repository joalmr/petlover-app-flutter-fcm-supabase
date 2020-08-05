import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:proypet/src/provider/login_store.dart';
import 'package:proypet/src/views/components/form_control/button_primary.dart';
import 'package:proypet/src/views/components/form_control/text_from.dart';
import 'package:proypet/src/views/components/snackbar.dart';
import 'package:proypet/src/views/components/transicion/fadeView.dart';
import 'package:proypet/src/views/components/wave_clipper.dart';
import 'package:proypet/src/styles/styles.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginSevenPageState createState() => _LoginSevenPageState();
}

class _LoginSevenPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  LoginStore loginStore = LoginStore();
  ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    disposer = reaction((_) => loginStore.respLogin, (respLogin) {
      if (respLogin['code'] == 200) {
        Navigator.pushReplacementNamed(context, 'navInicio');
      } else {
        mostrarSnackbar(respLogin['message'], colorRed, scaffoldKey);
      }
    });
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }

  void _onLogin() {
    setState(() {
      formKey.currentState.save();
      loginStore.getLogin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: AppBar(
            backgroundColor: colorMain,
            elevation: 0,
          )),
      body: FadeView(
        child: Form(
          key: formKey,
          child: ListView(
            children: <Widget>[
              WaveClipper(300.0, 180.0),
              SizedBox(height: 50.0),
              Observer(
                builder: (_) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: FormularioText(
                    hintText: 'Email',
                    icon: Icons.alternate_email,
                    onSaved: loginStore.setEmail,
                    valorInicial: null,
                    activo: !loginStore.loading,
                  ),
                ),
              ),
              Observer(
                builder: (_) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: FormularioText(
                    hintText: 'Contraseña',
                    icon: Icons.lock,
                    obscureText: !loginStore.passwordVisible,
                    iconSuf: InkWell(
                      child: Icon(loginStore.passwordVisible
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onTap: loginStore.togglePasswordVisibility,
                    ),
                    onSaved: loginStore.setPassword,
                    valorInicial: null,
                    activo: !loginStore.loading,
                  ),
                ),
              ),
              SizedBox(height: 25.0),
              Observer(builder: (_) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: buttonPri(
                      loginStore.loading ? 'Cargando..' : 'Iniciar sesión',
                      loginStore.loading ? null : _onLogin),
                );
              }),
              SizedBox(height: 20.0),
              Center(
                child: FlatButton(
                  onPressed: () => Navigator.pushNamed(context, 'olvidopass'),
                  child: Text(
                    "Olvidaste tu contraseña?".toUpperCase(),
                    style: TextStyle(
                        color: colorMain,
                        fontSize: 12,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Nuevo en Proypet?",
                      style: Theme.of(context).textTheme.subtitle2),
                  FlatButton(
                    onPressed: () => Navigator.pushNamed(context, 'registro'),
                    child: Text("Registrarse",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            .apply(color: colorMain)
                            .copyWith(decoration: TextDecoration.underline)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
