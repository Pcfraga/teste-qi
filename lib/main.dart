import 'package:flutter/material.dart';
import 'package:myapp/screens/cadastro_screen.dart'; // Corrigido o nome dos arquivos para snake_case
import 'package:myapp/screens/details_screen.dart';
import 'package:myapp/screens/login_screen.dart';
import 'package:myapp/screens/tarefas_screen.dart'; // Corrigido o nome dos arquivos para snake_case
import 'package:myapp/screens/task_form_screen.dart'; // Corrigido o nome dos arquivos para snake_case
import 'package:myapp/screens/editscreens.dart'; // Corrigido o nome do arquivo para snake_case

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tarefas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/cadastro': (context) => const CadastroScreen(),
        '/tarefas': (context) => const TarefasScreen(),
        '/tarefaDetalhes': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map<String, String>?;
          return DetailsScreen(
            tarefaTitle: args?['title'] ?? '',
            tarefaDate: args?['date'] ?? '',
            tarefaTime: args?['time'] ?? '',
            tarefaDescription: args?['description'] ?? '',
          );
        },
        '/editTask': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map<String, String>?;
          return EditScreen(
            tarefaTitle: args?['title'] ?? '',
            tarefaDate: args?['date'] ?? '',
            tarefaTime: args?['time'] ?? '',
            tarefaDescription: args?['description'] ?? '',
          );
        },
        '/taskForm': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map<String, String>?;
          return TaskFormScreen(
            initialTitle: args?['title'],
            initialDate: args?['date'],
            initialTime: args?['time'],
            initialDescription: args?['description'],
          );
        },
      },
    );
  }
}
