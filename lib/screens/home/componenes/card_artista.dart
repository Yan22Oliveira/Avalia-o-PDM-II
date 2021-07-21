import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../api/api.dart';
import '../../../helpers/helpers.dart';
import '../../../models/models.dart';

import '../../musica_screen/musica_screen.dart';
import '../../editar_artista/editar_artista_screen.dart';

class CardArtista extends StatelessWidget {

  final Artista artista;
  CardArtista({required this.artista});

  @override
  Widget build(BuildContext context) {
    return Consumer3<DeletarArtista,ListaMusicas,ListaArtistas>(

      builder: (_,deletarArtista,listaMusicas,listaArtistas,__){

        return GestureDetector(

          onTap: (){

            listaMusicas.getListaMusicas(idArtista: artista.id);

            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MusicaScreen(artista: artista,),
              ),
            );
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
              child: Column(
                children: [
                  Row(
                    children: [

                      Expanded(
                        child: Image.network(
                          artista.imagem,
                          fit: BoxFit.cover,
                          height: 160,
                          width: 160,
                        ),
                      ),

                      const SizedBox(width: 4,),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(
                              artista.nome,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),

                            const SizedBox(height: 8,),

                            Text(
                              artista.email,
                              style: TextStyle(
                                fontSize: 20,
                               fontWeight: FontWeight.w300,
                              ),
                            ),

                            const SizedBox(height: 4,),

                            Text(
                              artista.senha,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),
                            ),

                            Row(

                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [

                                IconButton(
                                  onPressed: deletarArtista.loading?null:()async{

                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => EditarArtistaScreen(artista: artista),
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
                                  onPressed: deletarArtista.loading?null:()async{

                                    await deletarArtista.deleteDeletarArtista(
                                      artista: artista,
                                    );

                                    listaArtistas.getListaArtistas();

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
                      const SizedBox(width: 4,),
                    ],
                  ),

                ],
              ),
            ),
          ),
        );

      },

    );
  }

}
