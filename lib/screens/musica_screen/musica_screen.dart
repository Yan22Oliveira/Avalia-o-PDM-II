import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../api/api.dart';
import '../../helpers/helpers.dart';
import '../../models/models.dart';

import '../cadastrar_musica/cadastrar_musicas_screen.dart';
import 'componenes/card_musica.dart';

class MusicaScreen extends StatelessWidget {

  final Artista artista;
  MusicaScreen({required this.artista});

  @override
  Widget build(BuildContext context) {
    return Consumer<ListaMusicas>(

      builder: (_,listaMusicas,__){

        return Scaffold(
          backgroundColor: colorFundo,
          appBar: AppBar(
            title: Text(
              "Lista das Musicas - "+artista.nome,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 22,
              ),
            ),
            centerTitle: true,
            elevation: 0,
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: colorRedSalsa,
            tooltip: "Adicionar Musica",
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CadastrarMusicasScreen(artista: artista,),
                ),
              );
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),

          body: ListView.builder(

            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(16),
            itemCount: listaMusicas.listaMusicas.length,
            itemBuilder: (context,index){

              return CardMusica(
                musica: listaMusicas.listaMusicas[index],
                artista: artista,
              );

            },

          ),

        );

      },

    );
  }
}
