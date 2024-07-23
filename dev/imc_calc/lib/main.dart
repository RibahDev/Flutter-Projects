import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Home(),
        debugShowCheckedModeBanner: false,
      ),
    );

//Aqui adicionei um if caso seja masculino e um else caso seja feminino com as devidas condições e pesos de cada gênero.
class Pessoa {
  double peso;
  double altura;
  String genero;

  Pessoa({required this.peso, required this.altura, required this.genero});

  double calcularImc() {
    return peso / (altura * altura);
  }

  String classificarImc(double imc) {
    if (genero == 'masculino') {
      if (imc < 20.7)
        return 'Abaixo do peso';
      else if (imc < 26.4)
        return 'Peso ideal';
      else if (imc < 27.8)
        return 'Levemente acima do peso';
      else if (imc < 31.1)
        return 'Obesidade Grau I';
      else if (imc < 34.9)
        return 'Obesidade Grau II';
      else
        return 'Obesidade Grau III';
    } else {
      if (imc < 19.1)
        return 'Abaixo do peso';
      else if (imc < 25.8)
        return 'Peso ideal';
      else if (imc < 27.3)
        return 'Levemente acima do peso';
      else if (imc < 32.3)
        return 'Obesidade Grau I';
      else if (imc < 34.9)
        return 'Obesidade Grau II';
      else
        return 'Obesidade Grau III';
    }
  }

//Adicionei condições para cada indice ter a sua devida cor
  Color getColor(double imc) {
    if (genero == 'masculino') {
      if (imc < 20.7)
        return Colors.blue;
      else if (imc < 26.4)
        return Colors.green;
      else if (imc < 27.8)
        return Colors.yellow;
      else if (imc < 31.1)
        return Colors.orange;
      else
        return Colors.red;
    } else {
      if (imc < 19.1)
        return Colors.blue;
      else if (imc < 25.8)
        return Colors.green;
      else if (imc < 27.3)
        return Colors.yellow;
      else if (imc < 32.3)
        return Colors.orange;
      else
        return Colors.red;
    }
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  String _result = 'Informe seus dados';
  String _genero = 'masculino';

  @override
  void initState() {
    super.initState();
    resetFields();
  }

  void resetFields() {
    _weightController.text = '';
    _heightController.text = '';
    setState(() {
      _result = 'Informe seus dados';
    });
  }

  void calculateImc() {
    double weight = double.parse(_weightController.text);
    double height = double.parse(_heightController.text) /
        100; //Convertendo para metros para facilitar o preenchimento
    Pessoa pessoa = Pessoa(peso: weight, altura: height, genero: _genero);
    double imc = pessoa.calcularImc();
    String classificacao = pessoa.classificarImc(imc);

    setState(() {
      _result = 'IMC = ${imc.toStringAsPrecision(3)}\n$classificacao';
      _resultColor = pessoa.getColor(imc);
    });
  }

  Color _resultColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          padding: EdgeInsets.all(20.0), child: buildForm()),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text('Calculadora de IMC', style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.blue[400],
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.refresh),
          onPressed: () {
            resetFields();
          },
        )
      ],
    );
  }

  Form buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildTextFormField(
              label: 'Peso (kg)',
              error: 'Insira seu Peso!',
              controller: _weightController),
          buildTextFormField(
              controller: _heightController,
              error: 'Insira uma Altura!',
              label: 'Altura (cm)'),
          buildGenderSelector(),
          buildCalculateButton(),
          buildTextResult(),
        ],
      ),
    );
  }

  Padding buildCalculateButton() {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 36.0),
        //no exemplo foi utilizado RaisedButton porém recebi alguns erros e então vi em algumas pesquisas que agora se utiliza ElevatedButton no lugar
        child: ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              calculateImc();
            }
          },
          child: Text('CALCULAR', style: TextStyle(color: Colors.white)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue[900],
          ),
        ));
  }

  Padding buildTextResult() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 36.0),
      child: Text(
        _result,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: _resultColor,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

//adicionando botões radio para gêneros (consegui chegar nesse resultado atrvés de pesquisas principalmente em Stack Overflow)
  Row buildGenderSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Radio<String>(
          value: 'masculino',
          groupValue: _genero,
          onChanged: (String? value) {
            setState(() {
              _genero = value!;
            });
          },
        ),
        Text('Masculino'),
        Radio<String>(
          value: 'feminino',
          groupValue: _genero,
          onChanged: (String? value) {
            setState(() {
              _genero = value!;
            });
          },
        ),
        Text('Feminino'),
      ],
    );
  }

  TextFormField buildTextFormField(
      {required TextEditingController controller,
      required String error,
      required String label}) {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: label),
      controller: controller,
      validator: (text) {
        //tive que adicionar text == null pois estava constando erro ao executar o código
        return (text == null || text.isEmpty) ? error : null;
      },
    );
  }
}

//Tive algumas dificuldades no começo para entender os erros apresentados por conta de atualizações de alguns elementos e sintaxe, mas foi fácil de achar documentações e exemplos para ajustar o funcionamento. Ótimo desafio!
