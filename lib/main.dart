import 'features/home_page.dart';

void main() => runApp(const MaintenanceApp());

class MaintenanceApp extends StatelessWidget {
  const MaintenanceApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '3D Maintenance AI',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1565C0)),
      ),
      home: const HomePage(),
    );
  }
}
