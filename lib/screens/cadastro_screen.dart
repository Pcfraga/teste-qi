import 'package:flutter/material.dart';

class CadastroScreen extends StatelessWidget {
  const CadastroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Agenda',
          style: TextStyle(color: Colors.white), // Define a cor do texto como branca
        ),
        backgroundColor: const Color.fromARGB(255, 3, 58, 176),
        centerTitle: true, // Centraliza o título
        leading: const SizedBox.shrink(), // Remove o ícone de sanduíche
        automaticallyImplyLeading: false, // Garante que o ícone de voltar não seja adicionado automaticamente
      ),
      backgroundColor: const Color.fromARGB(255, 3, 58, 10076),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Campo de Nome
              _buildTextField(
                label: 'Nome',
                obscureText: false,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16),

              // Campo de Email
              _buildTextField(
                label: 'Email',
                obscureText: false,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16),

              // Campo de Senha
              _buildTextField(
                label: 'Senha',
                obscureText: true,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16),

              // Campo de Repita a Senha
              _buildTextField(
                label: 'Repita a Senha',
                obscureText: true,
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(height: 20),
              
              // Botão de Cadastro
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login'); // Navega para LoginScreen
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color.fromARGB(255, 88, 17, 212),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                child: const Text('Cadastrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required bool obscureText,
    required TextInputAction textInputAction,
  }) {
    return Column(
      children: [
        TextField(
          textAlign: TextAlign.center,
          obscureText: obscureText,
          textInputAction: textInputAction,
          decoration: InputDecoration(
            border: const UnderlineInputBorder(),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            contentPadding: const EdgeInsets.only(bottom: 10),
            labelText: label,
            labelStyle: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
