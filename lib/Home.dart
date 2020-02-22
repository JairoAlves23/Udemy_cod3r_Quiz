import 'package:flutter/material.dart';
import 'package:minhas_perguntas/Questionario.dart';
import 'package:minhas_perguntas/Resultado.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Estado da posição do array lista questão
  var _posicao = 0;

  // Estado para calclular a pontuação do QUIZ
  var _pontuacaoTotal = 0;

  /* Lista com um map das questões. verificar como a criação foi feita:
    **** List<Map<String, Object>> ***
    List<>=igual a lista completa 
    Map<String, Object> = / 
    String = chave como 'texto', 'resposta', 'pontuacao'
    Object = é o valor do objeto: 'Qual sua cor favorita', Preto'
    ou seja uma lista de array que esta dentro de um objeto
   */
  final List<Map<String, Object>> _listaQuestao = const [
    {
      'texto': 'Qual sua cor favorita',
      'resposta': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 5},
        {'texto': 'Verde', 'pontuacao': 3},
        {'texto': 'Branco', 'pontuacao': 1},
      ]
    },
    {
      'texto': 'Qual seu Animal Favorito',
      'resposta': [
        {'texto': 'Cachorro', 'pontuacao': 10},
        {'texto': 'Gato', 'pontuacao': 5},
        {'texto': 'Coelho', 'pontuacao': 3},
        {'texto': 'Cobra', 'pontuacao': 1},
      ]
    },
    {
      'texto': 'Qual sua carro favorito',
      'resposta': [
        {'texto': 'Corsa', 'pontuacao': 10},
        {'texto': 'Fiat', 'pontuacao': 5},
        {'texto': 'Bmw', 'pontuacao': 3},
        {'texto': 'Ferrari', 'pontuacao': 1},
      ]
    },
  ];

  /* Metodo setState para alterar a variaveis. 
 int pontuação é parametro para envio da pontuação total. 
 este parametro vem do _listaQuestao estanciado na classe Questionario e depois
 será enviado pelo construtor pela classe Resultado através da variavel _pontuacaoTotal
 */
  void _novaQuestao(int pontuacao) {
    setState(() {
      _posicao++;
      _pontuacaoTotal += pontuacao;
    });
  }

  /* 
    zera o estado das variaveis para reinicar o questionario. neste acaso será enviado 
    essa funação pelo construtor da classe Resultado para fazer algumas verificações e
    reiniciar o jogo.
   */
  void _reiniciarQuestionario() {
    setState(() {
      _posicao = 0;
      _pontuacaoTotal = 0;
    });
  }

  /* Metodo para verificar o estado da variaveis 
  e passar o resultado para validação e não deixar a aplicação quebrar com um erro, pois ela não pode 
  passar o tamanho do array _listaQuestao*/
  bool get temPerguntaSelecionada {
    return _posicao < _listaQuestao.length;
  }

  @override
  Widget build(BuildContext context) {
    /* Lista com todas as respostas e pontuações que será enviada pelo construtor Questionario
    ***temPerguntaSelecionada*** resultado do metodo temPerguntaSelecionada
    */
    List<Map<String, Object>> perRespostas =
        temPerguntaSelecionada ? _listaQuestao[_posicao]['resposta'] : null;

    return Scaffold(
        appBar: AppBar(
          title: Text("Minhas Perguntas"),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                /* 
                _novaQuestao metodo enviado para questionario 
                Pq não passar o parametro nesta chamada: Pq essa verificação não é feita aqui 
                nessa classe e sim na classe Questionario
                */
                novaQuestao: _novaQuestao,
                /* Lista com todas as respostas e pontuações que será enviada pelo construtor Questionario*/
                perRespostas: perRespostas,
                /* String com as perguntas que será enviada pelo construtor Questionario*/
                perguntaValor: _listaQuestao[_posicao]['texto'],
              )
            : Resultado(
                /* Valor com o resultado do setState que será enviada pelo construtor Resultado */
                pontuacaoTotal: _pontuacaoTotal,
                /* Função que será enviada pelo construtor Resultado para chamar do construtor resultado */
                reiniciarQuestionario: _reiniciarQuestionario));
  }
}
