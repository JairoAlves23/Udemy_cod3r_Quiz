import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  //Atributo que recebe o valor da perguntar que vem da classe Home
  final pontuacaoTotal;

  //Função que vem da classe HOme
  final reiniciarQuestionario;

  //Construtor
  const Resultado({this.pontuacaoTotal, this.reiniciarQuestionario});

  /* Metodo que retornar o valor que passado pela construtação do Widget 
  e faz a verificação da pontuação total 'get' serve getters dentro da classe para retornar valor
  */
  String get fraseResutado {
    if (pontuacaoTotal < 8) {
      return 'Parabéns !!!';
    } else if (pontuacaoTotal < 12) {
      return 'Você é bom !!!';
    } else if (pontuacaoTotal < 16) {
      return 'Impresionante !!!';
    } else {
      return 'Nível Jedi !!!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        /* Alinha o Center e FlatButton atraves do flex 'mainAxisAlignment', 
        chamar outro Widget MainAxisAlignment.center */
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              // Vem do metodo acima
              fraseResutado,
              style: TextStyle(fontSize: 28),
            ),
          ),
          FlatButton(
            //Função que vem da classe Home
            onPressed: reiniciarQuestionario,
            child: Text(
              "Reniciar?",
              style: TextStyle(color: Colors.blue, fontSize: 24),
            ),
          )
        ]);
  }
}
