import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:intro_flutter_alr/modelos/receita.dart';
import 'package:intro_flutter_alr/telas/detalhes/detalhes.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return _construirHome();
  }

  Widget _construirHome() {
    return Scaffold(
      body: _construirListaCard(),
      appBar: _construirAppBar(),
    );
  }

  Widget _construirListaCard() {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString('assets/receitas.json'),
      builder: (context, snapshot) {
        List<dynamic> receitas = json.decode(snapshot.data.toString());

        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            Receita receita = Receita.fromJson(receitas[index]);

            return _construirCard(receita.titulo, receita.foto);
          },
          itemCount: receitas == null ? 0 : receitas.length,
        );
      },
    );
  }

  Widget _construirCard(titulo, foto) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Detalhes()));
        },
        child: SizedBox(
          height: 250.0,
          child: Card(
            margin: EdgeInsets.all(16.0),
            child: Column(children: [
              Stack(children: [
                _construirImagemCard(foto),
                _construirGradienteCard(),
                _construirTextoCard(titulo),
              ]),
            ]),
          ),
        ));
  }

  Widget _construirGradienteCard() {
    return Container(
      height: 218.0,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              colors: [
            Colors.transparent,
            Colors.deepOrange.withOpacity(0.7),
          ])),
    );
  }

  Widget _construirAppBar() {
    return AppBar(title: Text('Cozinhando em Casa'));
  }

  Widget _construirTextoCard(titulo) {
    return Positioned(
      bottom: 10.0,
      left: 10.0,
      child:
          Text(titulo, style: TextStyle(fontSize: 20.0, color: Colors.white)),
    );
  }

  Widget _construirImagemCard(foto) {
    return Image.asset(foto, fit: BoxFit.fill, height: 218.0);

    // return Image.network(
    //   'https://amp.receitadevovo.com.br/wp-content/uploads/2020/10/bolo-de-trigo-fofinho.jpg',
    //   fit: BoxFit.fill,
    //   height: 218.0,
    // );
  }
}
