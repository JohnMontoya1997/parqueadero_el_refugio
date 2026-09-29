import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class ModuloCuposScreen extends StatelessWidget {
  const ModuloCuposScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> celdas = [
      {'celda': 'Celda 01', 'estado': 'Ocupado', 'libre': false},
      {'celda': 'Celda 02', 'estado': 'Disponible', 'libre': true},
      {'celda': 'Celda 03', 'estado': 'Ocupado', 'libre': false},
      {'celda': 'Celda 04', 'estado': 'Disponible', 'libre': true},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa de Cupos - El Refugio', style: TextStyle(color: Colors.white)),
        backgroundColor: AppColors.primaryDark,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Estado de espacios en tiempo real',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textMain),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: celdas.length,
                itemBuilder: (context, index) {
                  var c = celdas[index];
                  bool esLibre = c['libre'];
                  return Card(
                    color: esLibre ? Colors.green[50] : Colors.red[50],
                    margin: const EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      leading: Icon(
                        esLibre ? Icons.lock_open : Icons.lock,
                        color: esLibre ? AppColors.successGreen : Colors.red,
                      ),
                      title: Text(c['celda'], style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text('Estado: ${c['estado']}'),
                      trailing: Text(
                        esLibre ? 'Libre' : 'Ocupado',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: esLibre ? AppColors.successGreen : Colors.red,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}