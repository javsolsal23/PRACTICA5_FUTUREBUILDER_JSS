import 'package:flutter/material.dart';
import 'package:paisesgui/ui/screens/infopais_general.dart';
import 'package:paisesgui/ui/screens/infopais_detalle.dart';

class InfoPaisScreen extends StatefulWidget {
  const InfoPaisScreen({super.key, required this.nombrePais});

  final String nombrePais;

  @override
  State<InfoPaisScreen> createState() => _InfoPaisScreenState();
}

class _InfoPaisScreenState extends State<InfoPaisScreen> {
  
  int _indice = 0;

  @override
  Widget build(BuildContext context) {
    
    final paginas = [
      InfoPaisGeneral(nombrePais: widget.nombrePais),
      InfoPaisDetalle(nombrePais: widget.nombrePais),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _indice == 0 ? "Información General" : "Población y tiempo",
        ),
      ),
      body: paginas[_indice],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _indice,
        onDestinationSelected: (int i) {
          setState(() {
            _indice = i;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.info),
            label: "Información general",
          ),
          NavigationDestination(
            icon: Icon(Icons.wb_sunny),
            label: "Información detallada",
          ),
        ],
      ),
    );
  }
}