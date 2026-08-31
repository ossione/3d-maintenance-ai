import 'package:flutter/material.dart';
import 'diagnostic_flow_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('3D Maintenance AI')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text('Olá! 👋', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 8),
          const Text('Assistente de manutenção e diagnóstico de impressoras 3D.'),
          const SizedBox(height: 24),
          Card(
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const DiagnosticFlowPage()),
              ),
              child: const Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  children: [
                    Icon(Icons.build_circle_outlined, size: 60),
                    SizedBox(height: 12),
                    Text('NOVO DIAGNÓSTICO',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text('Começar diagnóstico de um problema de extrusão.'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
