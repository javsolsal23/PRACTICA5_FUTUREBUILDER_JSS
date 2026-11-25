
import 'package:flutter/material.dart';
import 'package:paisesgui/data/repositories/paises_repository_p4.dart';
import 'package:paisesgui/domain/entities/pais.dart';

class InfoPaisGeneral extends StatelessWidget {
  InfoPaisGeneral({super.key, required this.nombrePais});

  final String nombrePais;  

    // Referencia al repositorio, de donde obtendremos la lista de continentes
  final PaisesRepository _repository = PaisesRepository();


  @override
  Widget build(BuildContext context) {

    // Recogemos el país del repositorio
    Pais pais = _repository.infoPais(nombrePais);
    
    // TO-DO
    // Añadir la información siguiente sobre el país:
    // Imagen, nombre, capital y descripción, de forma similar a como se muestra en el enunciado

    // Podéis utilizar los widgets y contenedores que consideréis oportunos (Containers, SingleChildScrollView, Columns, etc)
    // Debéis tener en cuenta no sobrepasar los límites y dibujar fuera del espacio disponible
    // Para comprobar que no os salís, podéis probar a girar el dispositivo (si lo estáis haciendo sobre Android)

    return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                pais.imagen ?? '',
                width: 300,
                height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 50.0,
                right: 50.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pais.nombre,
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Capital: ${pais.capital}',
                    style: const TextStyle(fontSize: 16,
                    color: Color.fromARGB(255, 100, 99, 99)),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: Text(
                      pais.descripcion ?? '',
                      textAlign: TextAlign.justify,
                      style: const TextStyle(fontSize: 10),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  }
}
