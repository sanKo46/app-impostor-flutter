import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/game_controller.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  bool _showResult = false;

  @override
  Widget build(BuildContext context) {
    final gc = Provider.of<GameController>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Resultado / Fin de ronda')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() => _showResult = !_showResult);
              },
              child: Text(_showResult ? 'Ocultar resultado' : 'Mostrar resultado'),
            ),

            const SizedBox(height: 16),

            // Animación de mostrar/ocultar
            AnimatedCrossFade(
              duration: const Duration(milliseconds: 300),
              crossFadeState: _showResult
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              firstChild: Column(
                children: [
                  Text('Secreto de la ronda:',
                      style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 8),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        gc.secret,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text('Impostor:', style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 8),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        gc.players[gc.impostorIndex].name,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
              secondChild: Container(), // vacío cuando oculto
            ),

            const Spacer(),

            ElevatedButton(
              onPressed: () {
                gc.reset();
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: const Text('Reiniciar partida'),
            ),
          ],
        ),
      ),
    );
  }
}
