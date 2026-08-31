dart
import 'package:flutter/material.dart';

class Question {
  final String text;
  final List<String> options;
  const Question(this.text, this.options);
}

class DiagnosticFlowPage extends StatefulWidget {
  const DiagnosticFlowPage({super.key});
  @override
  State<DiagnosticFlowPage> createState() => _DiagnosticFlowPageState();
}

class _DiagnosticFlowPageState extends State<DiagnosticFlowPage> {
  final questions = const [
    Question('O filamento não está saindo pelo nozzle?', ['Sim', 'Não']),
    Question('O motor do extrusor gira quando você manda extrudar?', ['Sim', 'Não', 'Não sei']),
    Question('O extrusor faz estalos repetidos?', ['Sim', 'Não', 'Não sei']),
    Question('A engrenagem deixa marcas profundas no filamento?', ['Sim', 'Não', 'Não sei']),
  ];

  final answers = <String>[];
  int index = 0;

  void answer(String value) {
    answers.add(value);
    if (index < questions.length - 1) {
      setState(() => index++);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ResultPage(answers: List.unmodifiable(answers)),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final q = questions[index];
    return Scaffold(
      appBar: AppBar(title: Text('Diagnóstico ${index + 1}/${questions.length}')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          LinearProgressIndicator(value: (index + 1) / questions.length),
          const SizedBox(height: 28),
          Text(q.text, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 24),
          for (final option in q.options)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: FilledButton.tonal(
                onPressed: () => answer(option),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(option),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  final List<String> answers;
  const ResultPage({super.key, required this.answers});

  String get diagnosis {
    if (answers.length >= 4 &&
        answers[1] == 'Sim' &&
        answers[2] == 'Sim' &&
        answers[3] == 'Sim') {
      return 'Possível obstrução do nozzle ou resistência no caminho de extrusão.';
    }
    if (answers.length >= 3 && answers[1] == 'Não') {
      return 'Possível problema no acionamento do extrusor ou no comando de extrusão.';
    }
    if (answers.length >= 4 && answers[3] == 'Sim') {
      return 'Possível patinação da engrenagem do extrusor.';
    }
    return 'São necessárias mais evidências para determinar a causa.';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Resultado')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Icon(Icons.search, size: 64),
          const SizedBox(height: 16),
          Text('Diagnóstico preliminar',
              style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(diagnosis, style: Theme.of(context).textTheme.titleLarge),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'O aplicativo deverá executar um teste orientado antes de confirmar a causa. '
            'Esta é uma primeira versão do motor de diagnóstico.',
          ),
        ],
      ),
    );
  }
}
