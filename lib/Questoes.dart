import 'package:flutter/material.dart';

class Questoes extends StatelessWidget {
  
  //Atributo que recebe o valor da perguntar que vem da classe Home
  final String perguntaValor;
  //Construtor
  Questoes(this.perguntaValor);

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: dentro do Container para ocupar todo espaço da tela
      width: double.infinity,
      child: Text(
        //Atributo de envio para classe Home
        perguntaValor,
        // Dentro do widget Text dá estilo para texto com widget TextStyle
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
