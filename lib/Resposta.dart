import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  //Atributo que recebe o valor da perguntar que vem da classe Home
  final String pergunta;

  /* Função nova questão que é referida dentro da classe Home e Questionario, verificar 
  explicação na classe questionario*/
  final Function novaQuestao;

  //Construtor
  const Resposta({this.pergunta, this.novaQuestao});

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: dentro do Container para ocupar todo espaço da tela
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        //Função na explicação do atribuito acima
        onPressed: novaQuestao,
        // Valor que vem da classe home e chegar aqui atraves do construtor
        child: Text(pergunta),
      ),
    );
  }
}
