import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _construirHome();
  }

  Widget _construirHome() {
    return Scaffold(
      body: _construirCard(),
      appBar: _construirAppBar(),
    );
  }

  Widget _construirCard() {
    return SizedBox(
      height: 250.0,
      child: Card(
        margin: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Stack(
              children: [
                _construirImagemCard(),
                _construirTextoCard(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _construirAppBar() {
    return AppBar(
      title: Text('Cozinhando em Casa'),
    );
  }

  Widget _construirTextoCard() {
    return Positioned(
      bottom: 10.0,
      left: 10.0,
      child: Text(
        'Bolo de Laranja',
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }

  Widget _construirImagemCard() {
    return Image.network(
      'https://amp.receitadevovo.com.br/wp-content/uploads/2020/10/bolo-de-trigo-fofinho.jpg',
      fit: BoxFit.fill,
      height: 218.0,
    );
  }
}
