import 'package:examen_final_guevara_rec/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScanTiles extends StatelessWidget {

  const ScanTiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TrenesProvider trenesProvider = Provider.of<TrenesProvider>(context);
    final trenes = trenesProvider.TrenesPrincipales;

    return ListView.builder(itemCount: trenes.length,
      itemBuilder: (_,index ) => Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.red,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: const Icon(
                Icons.delete_forever, 
                color: Colors.white),
            ),
          ),),
        onDismissed: (DismissDirection direction) {
          Provider.of<TrenesProvider>(context, listen: false).deleteTren(trenes[index].id as String);
        },
        child: ListTile(
          leading: Icon(Icons.train),
          title: Text(trenes[index].nom),
          subtitle: Text(trenes[index].id.toString()),
          trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.grey),
          onTap: () => (){},
        ),
      ),
    );
  }
}