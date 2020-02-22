import 'package:flutter/material.dart';
import 'package:minhas_perguntas/Questoes.dart';
import 'package:minhas_perguntas/Resposta.dart';

class Questionario extends StatelessWidget {
  /* valor que será trazido da classe Home pelo _listaQuestao[_posicao]['texto'] */
  final String perguntaValor;

  /* valor que será trazido da classe Home pelo linha 92: List<Map<String, Object>> perRespostas =
        temPerguntaSelecionada ? _listaQuestao[_posicao]['resposta'] */
  final List<Map<String, Object>> perRespostas;

  /* Função da classe Home: neste caso vai na classe Home com o metodo novaQuestao(resp['pontuacao']) 
  e dado da pontuação para atualizar o estado. note que aqui é feito recebimento do parametro e  () =>
  a arrow serve para isso, que seja primeiro executada a função e depois o envio.
  */
  final Function(int) novaQuestao;

  // Construtor da classe {} as chaves servem para criar atributos normeados
  const Questionario({this.perguntaValor, this.perRespostas, this.novaQuestao});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Atributo de envio para a classe home
        Questoes(perguntaValor),
        //......perRespostas lista para transformação do Map e retorno para classe Home
        ...perRespostas.map((resp) {
          return Resposta(
              //Função recebida da classe questão e mais a explicação no atributo perRespostas acima
              novaQuestao: () => novaQuestao(resp['pontuacao']),
              //String para envio a classe Resposta
              pergunta: resp['texto']);
          //toList() é usado para transformar um map em uma lista. lembrado map é sem chave:valor como Json e Objeto
        }).toList(),
      ],
    );
  }
}
