import 'package:flutter/material.dart';
import 'package:intro_flutter_alr/modelos/receita.dart';

class Detalhes extends StatelessWidget {
  final Receita receita;

  Detalhes({Key key, @required this.receita}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _construirDetalhes();
  }

  Widget _construirDetalhes() {
    return Scaffold(
      body: ListView(
        children: [
          _construirImagemDetalhes(receita.foto),
          _construirTituloDetalhes(receita.titulo),
          _construirLinhaIconesDetalhes(
              '${receita.porcoes} porções', receita.tempoPreparo),
          _construirSubtituloDetalhes('Ingredientes'),
          _construirTextoDetalhes(receita.ingredientes),
          Padding(padding: EdgeInsets.fromLTRB(0, 5.0, 0, 5.0)),
          _construirSubtituloDetalhes('Modo de Preparo'),
          _construirTextoDetalhes(receita.modoPreparo)
        ],
      ),
      appBar: _construirAppBar(),
    );
  }

  Widget _construirImagemDetalhes(foto) {
    return Image.asset(foto);
  }

  Widget _construirTituloDetalhes(titulo) {
    return Center(
      child: Text(
        titulo,
        style: TextStyle(color: Colors.deepOrange, fontSize: 30.0),
      ),
    );
  }

  Widget _construirLinhaIconesDetalhes(rendimento, tempoPreparo) {
    return Row(children: [
      _construirColunaIconesDetalhes(Icons.restaurant, rendimento),
      _construirColunaIconesDetalhes(Icons.timer, tempoPreparo)
    ]);
  }

  Widget _construirColunaIconesDetalhes(icone, texto) {
    return Expanded(
      child: Column(children: [
        Icon(icone, color: Colors.deepOrange),
        Text(
          texto,
          style: TextStyle(
            color: Colors.deepOrange,
            fontWeight: FontWeight.bold,
          ),
        )
      ]),
    );
  }

  Widget _construirSubtituloDetalhes(subtitulo) {
    return Center(
      child: Text(
        subtitulo,
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }

  Widget _construirTextoDetalhes(texto) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Text(texto),
    );
  }

  Widget _construirAppBar() {
    return AppBar(
      title: Text('Cozinhando em Casa'),
    );
  }
}
