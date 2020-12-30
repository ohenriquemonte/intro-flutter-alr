import 'package:flutter/material.dart';

class Detalhes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _construirDetalhes();
  }

  Widget _construirDetalhes() {
    return Scaffold(
      body: Column(
        children: [
          _construirImagemDetalhes('assets/images/ratatouille.jpg'),
          _construirTituloDetalhes('Ratatouille'),
          _construirLinhaIconesDetalhes('2-3 porções', '50min'),
          _construirSubtituloDetalhes('Ingredientes'),
          _construirTextoDetalhes('Aqui serão exibidos os ingredientes'),
          //   Padding(padding: EdgeInsets.fromLTRB(0, 5.0, 0, 5.0)),
          _construirSubtituloDetalhes('Modo de Preparo'),
          _construirTextoDetalhes(
              'Aqui será exibido o modo de preparo dessa receita!')
        ],
      ),
      appBar: _construirAppBar(),
    );
  }

  Widget _construirImagemDetalhes(foto) {
    return Image.asset(foto);
  }

  Widget _construirTituloDetalhes(titulo) {
    return Text(
      titulo,
      style: TextStyle(color: Colors.deepOrange, fontSize: 30.0),
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
    return Text(
      subtitulo,
      style: TextStyle(fontSize: 20.0),
    );
  }

  Widget _construirTextoDetalhes(texto) {
    return Text(texto);
  }

  Widget _construirAppBar() {
    return AppBar(
      title: Text('Cozinhando em Casa'),
    );
  }
}
