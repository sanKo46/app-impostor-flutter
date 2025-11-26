import 'package:flutter/material.dart';
import '../controllers/game_controller.dart';

class DifficultyScreen extends StatelessWidget {
  final Function(Difficulty difficulty) onSelect;

  const DifficultyScreen({super.key, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Elige dificultad")),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            _buildButton(context, "Fácil", Difficulty.easy),
            const SizedBox(height: 16),
            _buildButton(context, "Medio", Difficulty.medium),
            const SizedBox(height: 16),
            _buildButton(context, "Difícil", Difficulty.hard),
            const SizedBox(height: 16),
            _buildButton(context, "Libre (mezclado)", Difficulty.mixed),
            const SizedBox(height: 16),
            _buildButton(context, "Todos", Difficulty.all),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext ctx, String label, Difficulty value) {
    return ElevatedButton(
      onPressed: () => onSelect(value),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Text(label, style: const TextStyle(fontSize: 20)),
      ),
    );
  }
}
