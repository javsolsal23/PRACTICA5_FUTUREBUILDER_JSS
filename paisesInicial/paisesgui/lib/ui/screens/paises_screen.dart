import 'package:flutter/material.dart';
import 'package:paisesgui/data/repositories/paises_repository_p4.dart';
import 'package:paisesgui/domain/entities/pais.dart';
import 'package:paisesgui/ui/screens/infopais_screen.dart';

class PaisesScreen extends StatelessWidget {
  PaisesScreen({super.key, required this.continente});

  // Referencia al repositorio, de donde obtendremos la lista de continentes
  final String continente;
  final PaisesRepository _repository = PaisesRepository();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text("Países de $continente"),
          ),
          body: Center(
          // Proporciona a _creaLlistaPaises la lista de paises de Europa
          child:
              _creaListaPaises(_repository.getPaises(continente))) 
    );
  }

  Widget _creaListaPaises(List<Pais> paises) {
    // Recibimos la lista de paises
    
    // TO-DO
    // Debemos utilizar un ListView.builder para recorrer la lista de países
    // y generar un widget personalizado de tipo PaisCard, con la imagen y el nombre.

    return 
    ListView.builder(
      itemCount: paises.length,
      itemBuilder: (context, index) {
        final pais = paises[index];
        return PaisCard(
          imagen: pais.imagen ?? '',
          nombre: pais.nombre,
        );
      },
    );
  }
}

class PaisCard extends StatelessWidget {
  // Este widget recibirá dos argumentos con nombre para construirse:
  // la imagen (imagen) y el nombre del país (nombre)
  const PaisCard({
    super.key,
    required this.imagen,
    required this.nombre,
  });

  final String imagen;
  final String nombre;

  @override
  Widget build(BuildContext context) {
    // TO-DO
    // Devuelve un widget de tipo Card, con el diseño que desees, pero
    // que muestre la imagen  (obtenida de Internet a partir de la url)
    // y el nombre del país.
    
    return InkWell(
    onTap: () {
      Navigator.push<void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => InfoPaisScreen(nombrePais: nombre),
        ),
      );
    },
    child: Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          Image.network(
            imagen,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 150,
          ),
          Positioned(
            bottom: 30,
            left: 30,
            child: Text(
              nombre,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
        ],
      ),
    )
    ); 
  }
}
