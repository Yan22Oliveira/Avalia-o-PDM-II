import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../api/api.dart';
import '../../../helpers/helpers.dart';
import '../../../models/models.dart';

import '../../editar_musica/editar_musica_screen.dart';

class CardMusica extends StatelessWidget {

  final Artista artista;
  final Musica musica;
  CardMusica({required this.artista, required this.musica});

  @override
  Widget build(BuildContext context) {
    return Consumer2<DeletarMusica,ListaMusicas>(

      builder: (_,deletarMusica,listaMusicas,__){

        return GestureDetector(

          onTap: (){


          },

          child: Card(
            elevation: 3,
            color: Colors.white,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          (musica.nome),
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: colorMalachite,
                          ),
                        ),

                        const SizedBox(height: 8,),

                        Text(
                          "Estilo: "+musica.estilo,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),

                        const SizedBox(height: 4,),

                        Text(
                          "Duração: "+musica.duracao,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),

                      ],
                    ),
                  ),

                  Column(

                    children: [

                      IconButton(
                        onPressed: ()async{


                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => EditarMusicaScreen(
                                artista: artista,
                                musica: musica,
                              ),
                            ),
                          );

                        },
                        tooltip: "Editar",
                        icon: Icon(
                          Icons.edit,
                          color: colorBlueJeans,
                        ),
                      ),

                      IconButton(
                        onPressed: deletarMusica.loading?null:()async{

                          await deletarMusica.deleteDeletarMusica(
                            artista: artista,
                            musica: musica,
                          );
                          listaMusicas.getListaMusicas(idArtista: artista.id);

                        },
                        tooltip: "Deletar",
                        icon: Icon(
                          Icons.delete,
                          color: Colors.redAccent,
                        ),
                      ),

                    ],

                  )
                ],
              ),
            ),
          ),
        );

      },

    );
  }

}
