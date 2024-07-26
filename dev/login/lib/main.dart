import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    resetFields();
  }

  void resetFields() {
    _userController.text = '';
    _passwordController.text = '';
  }
  
  void loginValidate() {
    String user = _userController.text;
    String password = _passwordController.text;

    if (user == 'admin' && password == 'admin123') {
      succesfulLogin(context);
    } else {
      badLogin(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
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
          buildTextFormField(
            label: 'Usuário',
            error: 'Insira um Nome de Usuário Correto!',
            controller: _userController,
          ),
          buildTextFormField(
            label: 'Senha',
            error: 'Insira uma Senha Correta!',
            controller: _passwordController,
            obscureText: true,
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
        child: const Text('Entrar', style: TextStyle(color: Colors.white)),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          backgroundColor: Colors.teal[400],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }

  Padding buildClearButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: resetFields,
        child: const Text('Limpar', style: TextStyle(color: Colors.white)),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
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

  TextFormField buildTextFormField({
    required TextEditingController controller,
    required String error,
    required String label,
    bool obscureText = false,
  }) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      controller: controller,
      obscureText: obscureText,
      validator: (text) {
        return (text == null || text.isEmpty) ? error : null;
      },
    );
  }
}
