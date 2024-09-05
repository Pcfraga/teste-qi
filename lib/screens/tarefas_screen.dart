import 'package:flutter/material.dart';

class TarefasScreen extends StatelessWidget {
  const TarefasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tarefas'),
        backgroundColor: const Color.fromARGB(255, 62, 11, 216), // Define o fundo azul do AppBar
      ),
      backgroundColor: const Color.fromARGB(255, 47, 33, 243), // Define o fundo azul para a tela inteira
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: 10, // Ajuste para o número real de tarefas
          itemBuilder: (context, index) {
            final tarefa = {
              'title': 'Tarefa ${index + 1}',
              'date': '2024-08-29',
              'time': '14:00',
              'description': 'Descrição da Tarefa ${index + 1}',
            };

            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16.0),
                title: Text(
                  tarefa['title']!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text('Data: ${tarefa['date']!}\nHora: ${tarefa['time']!}'),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/tarefaDetalhes',
                    arguments: tarefa,
                  );
                },
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                      child: const Text(
                        'Editar',
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () {
                        // Implemente a lógica de edição aqui
                      },
                    ),
                    TextButton(
                      child: const Text(
                        'Excluir',
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () {
                        _showDeleteConfirmationDialog(context);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/taskForm'); // Navega para a tela de formulário de tarefa
        },
        backgroundColor: Colors.white, // Cor de fundo branca para o botão
        child: const Icon(Icons.add, color: Colors.blue), // Ícone azul
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar Exclusão'),
          content: const Text('Você tem certeza que deseja excluir esta tarefa?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Excluir'),
              onPressed: () {
                // Implemente a lógica de exclusão aqui
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
