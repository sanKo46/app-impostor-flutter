import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/game_controller.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double _opacity = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 120),
      () => setState(() => _opacity = 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    const purple = Color(0xFF8A2BE2);
    final game = Provider.of<GameController>(context, listen: false);

    return Scaffold(
      backgroundColor: const Color(0xFF1A152E),
      appBar: AppBar(
        title: const Text('Configuración'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: _opacity,
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _settingsTile(
                icon: Icons.restart_alt,
                title: 'Reiniciar partida',
                subtitle: 'Elimina roles, modo y resultados',
                color: purple,
                onTap: () {
                  game.resetGame();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text("Partida reiniciada."),
                      backgroundColor: purple,
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),

              _settingsTile(
                icon: Icons.info_outline,
                title: 'Información',
                subtitle: 'Reglas y funcionamiento del juego',
                color: purple,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      backgroundColor: const Color(0xFF241836),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      title: const Text(
                        'Información',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      content: const Text(
                        'Impostor Fútbol es un juego social donde un jugador es '
                        'el impostor y debe adivinar la categoría mientras los '
                        'demás intentan confundirse entre sí.',
                        style: TextStyle(color: Colors.white70),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cerrar'),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),

              _settingsTile(
                icon: Icons.code,
                title: 'Créditos',
                subtitle: 'Desarrollado por Ti',
                color: purple,
                onTap: () {},
              ),
              const SizedBox(height: 20),

              const Spacer(),

              Center(
                child: Text(
                  "Versión 1.0.0",
                  style: TextStyle(color: Colors.white.withOpacity(0.4)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ---------- WIDGET TARJETA DE AJUSTE ----------
  Widget _settingsTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1A152E),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: color.withOpacity(0.14)),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.06),
              blurRadius: 12,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 2),
                  Text(subtitle,
                      style: const TextStyle(color: Colors.white60, fontSize: 13)),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: Colors.white.withOpacity(0.4)),
          ],
        ),
      ),
    );
  }
}
