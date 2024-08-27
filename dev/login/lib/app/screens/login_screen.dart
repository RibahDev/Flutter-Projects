import 'package:flutter/material.dart';
import 'package:login/app/core/mixins/validators_mixin.dart';
import 'package:login/routes/app_routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidatorsMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isShowing = false;

  @override
  void initState() {
    super.initState();
    resetFields();
  }

  @override
  void dispose() {
    _userController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: buildForm(),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text(
        'Login',
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.teal[400],
    );
  }

  Form buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(labelText: 'Usuário'),
            controller: _userController,
            validator: isNotEmpty,
          ),
          TextFormField(
            decoration: InputDecoration(
                labelText: 'Senha',
                suffixIcon: IconButton(
                    onPressed: toggleIsShowing,
                    icon: Icon(
                        isShowing ? Icons.visibility_off : Icons.visibility))),
            controller: _passwordController,
            obscureText: !isShowing,
            validator: (value) => combine([
              () => isNotEmpty(value),
              () => isValidPassword(value)
            ]),
          ),
          buildLoginButton(),
          buildClearButton(),
        ],
      ),
    );
  }

  Padding buildLoginButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            FocusScope.of(context).unfocus();
            loginValidate();
          }
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          backgroundColor: Colors.teal[400],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: const Text('Entrar', style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Padding buildClearButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: resetFields,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: const Text('Limpar', style: TextStyle(color: Colors.white)),
      ),
    );
  }

  void resetFields() {
    _userController.text = '';
    _passwordController.text = '';
  }

  void loginValidate() {
    String user = _userController.text;
    String password = _passwordController.text;

    if (user == 'admin' && password == 'admin123') {
      Navigator.of(context).pushReplacementNamed(AppRoutes.home);
    } else {
      badLogin(context);
    }
  }

  void succesfulLogin(BuildContext context) {
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    AlertDialog alerta = AlertDialog(
      title: const Text("Login"),
      content: const Text("Login realizado com Sucesso!"),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }

  void badLogin(BuildContext context) {
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    AlertDialog alerta = AlertDialog(
      title: const Text("Login"),
      content: const Text("Login errado, tente novamente"),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }

  void toggleIsShowing() {
    setState(() {
      isShowing = !isShowing;
    });
  }
}
