import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/game_controller.dart';
import 'reveal_screen.dart';
import 'difficulty_screen.dart';

class ModeScreen extends StatelessWidget {
  const ModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final gc = Provider.of<GameController>(context);

    void startGame() {
      gc.assignRoles();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const RevealScreen()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Elegir modo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: const Text('Jugador'),
              subtitle: const Text('Todos ven el mismo jugador excepto el impostor'),
              leading: const Icon(Icons.person),
              selected: gc.mode == GameMode.jugador,
              onTap: () => gc.setMode(GameMode.jugador),
            ),
            ListTile(
              title: const Text('Palabras'),
              subtitle: const Text('Modo palabras aleatorias'),
              leading: const Icon(Icons.shield),
              selected: gc.mode == GameMode.words,
              onTap: () => gc.setMode(GameMode.words),
            ),
            ListTile(
              title: const Text('Balón de Oro'),
              subtitle: const Text('Año del Balón de Oro'),
              leading: const Icon(Icons.emoji_events),
              selected: gc.mode == GameMode.balonoro,
              onTap: () => gc.setMode(GameMode.balonoro),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                if (gc.mode == GameMode.jugador) {
                  // PRIMERO pedir dificultad
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DifficultyScreen(
                        onSelect: (difficulty) {
                          gc.setDifficulty(difficulty);    // ← Guarda dificultad
                          Navigator.pop(context);          // Vuelve al ModeScreen
                          startGame();                     // Luego inicia partida
                        },
                      ),
                    ),
                  );
                } else {
                  // Otros modos no necesitan dificultad
                  startGame();
                }
              },
              child: const Text('Comenzar partida'),
            ),
          ],
        ),
      ),
    );
  }
}
