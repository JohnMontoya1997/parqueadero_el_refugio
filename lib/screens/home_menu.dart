import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import 'modulo_ingreso.dart';
import 'modulo_cupos.dart';

class HomeMenuScreen extends StatelessWidget {
  const HomeMenuScreen({super.key});

  // Ventana modal informativa requerida por el instructor
  void _showInfoModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Información del Sistema'),
          content: const Text(
            'Parqueadero El Refugio v1.0\n\n'
            'Aplicación móvil desarrollada en Flutter para la gestión integral de ingresos, '
            'salidas, control de cupos y tarifas del parqueadero.',
          ),
          actions: [
            TextButton(
              child: const Text(
                'Cerrar',
                style: TextStyle(color: AppColors.accentOrange),
              ),
              onPressed: () {
                Navigator.of(context).pop();
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
        title: const Text(
          'Menú Principal - El Refugio',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.primaryDark,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.white),
            tooltip: 'Acerca de',
            onPressed: () => _showInfoModal(context), // Abre la ventana modal
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Cabecera descriptiva
          const Text(
            'Panel de Control',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.textMain,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Seleccione una de las opciones principales de gestión:',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 20),

          // Opción 1: Módulo de Ingresos y Salidas
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            margin: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 12,
              ),
              leading: const CircleAvatar(
                radius: 26,
                backgroundColor: AppColors.accentOrange,
                child: Icon(
                  Icons.directions_car_rounded,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              title: const Text(
                '1. Control de Ingresos y Salidas',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textMain,
                ),
              ),
              subtitle: const Text(
                'Registrar vehículos, placas, tipo y tiempos de estancia.',
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 18,
                color: AppColors.primaryDark,
              ),
              onTap: () {
                // Navegación hacia la primera funcionalidad principal
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ModuloIngresoScreen(),
                  ),
                );
              },
            ),
          ),

          // Opción 2: Módulo de Disponibilidad y Cupos
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            margin: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 12,
              ),
              leading: const CircleAvatar(
                radius: 26,
                backgroundColor: AppColors.successGreen,
                child: Icon(
                  Icons.local_parking_rounded,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              title: const Text(
                '2. Disponibilidad de Cupos',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textMain,
                ),
              ),
              subtitle: const Text(
                'Monitorear celdas libres, ocupadas y mapa de espacios en tiempo real.',
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 18,
                color: AppColors.primaryDark,
              ),
              onTap: () {
                // Navegación hacia la segunda funcionalidad principal
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ModuloCuposScreen(),
                  ),
                );
              },
            ),
          ),

          // Opción 3 adicional o sección de resumen visual (para que se note bien cargado el menú)
          Card(
            elevation: 2,
            color: AppColors.primaryDark,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.analytics_rounded,
                    color: AppColors.accentOrange,
                    size: 40,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Estado del Sistema',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Operando con normalidad. Conectado a base de datos local.',
                          style: TextStyle(color: Colors.white70, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
