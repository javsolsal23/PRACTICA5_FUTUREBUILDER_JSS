

import 'package:flutter/material.dart';
import 'package:paisesgui/data/repositories/paises_repository_p4.dart';
import 'package:paisesgui/domain/entities/pais.dart';
import 'package:paisesgui/ui/widgets/my_weather_info.dart';

class InfoPaisDetalle extends StatelessWidget {
  InfoPaisDetalle({super.key, required this.nombrePais});

  final String nombrePais;
  final PaisesRepository _repository = PaisesRepository();


  @override
  Widget build(BuildContext context) {
    Pais pais = _repository.infoPais(nombrePais);

    // TO-DO
    // Añadir la información siguiente sobre el país:
    // Población (num. de habitantes), latitud y longitud.
    // Podéis combinar Column y Row para mostrar la información tabulada


    // Antes de la información, deberemos mostrar la información sobre el tiempo en el país,
    // mediante el widtget personalizado MyWeatherInfo(), que se os proporciona ya implementado
    return SingleChildScrollView(
        child: Column(
          children: [
            MyWeatherInfo(),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Población: '
                      ),
                      Text(
                        '${pais.poblacion}'
                      ),
                    ]
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Latitud: '
                      ),
                      Text(
                        '${pais.latitud}'
                      )
                    ]
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Longitud: '
                      ),
                      Text(
                        '${pais.longitud}'
                      )
                    ]
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
