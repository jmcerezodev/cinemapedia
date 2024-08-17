import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  

  Stream <String> getLoadMessages(){

    final List<String> messages = [
    'Cargarndo Peliculas',
    'Comprando Palomitas',
    'Cargando Populares',
    'No te desesperes estamos Cargando las peliculas',
    'No pirates las peliculas',
  ];

    return Stream.periodic(const Duration(milliseconds: 1200), (step) {
      return messages[step];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          const Text('Espere Porfavor'),
          const SizedBox(height: 10),
          const CircularProgressIndicator(strokeWidth: 2),
          const SizedBox(height: 10),

          StreamBuilder(
            stream: getLoadMessages(), 
            builder: (context, snapshot) {
              if(!snapshot.hasData) return const Text('Cargando..');

              return Text(snapshot.data!);
            },
          ),

        ],
      ),
    );
  }
}