import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'modulo_ingreso.dart';
import 'modulo_cupos.dart';

class HomeMenuScreen extends StatelessWidget {
  const HomeMenuScreen({super.key});

  // Método para desplegar la Ventana Modal informativa requerida
  void _showAboutModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Acerca de El Refugio'),
          content: const Text('Módulo móvil para el control de ingresos de vehículos y visualización de cupos en tiempo real.'),
          actions: [
            TextButton(
              child: const Text('Entendido', style: TextStyle(color: AppColors.accentOrange)),
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el modal al dar clic
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menú Principal - El Refugio', style: TextStyle(color: Colors.white)),
        backgroundColor: AppColors.primaryDark,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.white),
            onPressed: () => _showAboutModal(context), // Clic para abrir el modal
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Seleccione una funcionalidad:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textMain),
          ),
          const SizedBox(height: 16),
          
          // Opción 1 que lleva al Módulo de Ingresos
          Card(
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: AppColors.accentOrange,
                child: Icon(Icons.directions_car, color: Colors.white),
              ),
              title: const Text('1. Control de Ingresos y Salidas', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text('Registrar placas y tipo de vehículo.'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ModuloIngresoScreen()),
                );
              },
            ),
          ),
          const SizedBox(height: 12),

          // Opción 2 que lleva al Módulo de Cupos
          Card(
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: AppColors.successGreen,
                child: Icon(Icons.local_parking, color: Colors.white),
              ),
              title: const Text('2. Disponibilidad de Cupos', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text('Monitorear espacios libres y ocupados.'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ModuloCuposScreen()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}