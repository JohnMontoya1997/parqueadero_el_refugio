import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class ModuloIngresoScreen extends StatelessWidget {
  const ModuloIngresoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> vehiculos = [
      {'placa': 'ABC-123', 'tipo': 'Automóvil', 'hora': '08:30 AM'},
      {'placa': 'JFR-86D', 'tipo': 'Motocicleta', 'hora': '09:15 AM'},
      {'placa': 'XYZ-789', 'tipo': 'Automóvil', 'hora': '10:00 AM'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Control de Vehículos', style: TextStyle(color: Colors.white)),
        backgroundColor: AppColors.primaryDark,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Vehículos actualmente en el parqueadero:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textMain),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: vehiculos.length,
                itemBuilder: (context, index) {
                  final v = vehiculos[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      leading: Icon(
                        v['tipo'] == 'Motocicleta' ? Icons.two_wheeler : Icons.directions_car,
                        color: AppColors.accentOrange,
                      ),
                      title: Text('Placa: ${v['placa']}', style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text('Tipo: ${v['tipo']} | Ingreso: ${v['hora']}'),
                      trailing: const Icon(Icons.check_circle, color: AppColors.successGreen),
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