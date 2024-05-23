import 'package:flutter/material.dart';

import '../app/app_asset.dart';

class NewContactPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  NewContactPage({super.key});

  void _formValidation() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // if (contact != null) {
    //   _contactData['id'] = contact!.id;
    // }

    // _contactData['name'] = _nameController.text.trim();
    // _contactData['email'] = _emailController.text.trim();
    // _contactData['phone'] = _phoneController.text.trim();
  }

  String? _nameValidator(String? text) {
    if ((text == null) || text.isEmpty) {
      return 'Este campo é obrigatório';
    }
    return null;
  }

  String? _emailValidator(String? text) {
    final error = _nameValidator(text);
    if (error != null) {
      return error;
    }
    if (!(text!.contains('@'))) {
      return 'E-mail inválido';
    }

    return null;
  }

  String? _phoneValidator(String? text) {
    final error = _nameValidator(text);
    if (error != null) {
      return error;
    }
    if (int.tryParse(text!) == null) {
      return 'Número de telefone inválido';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Contato'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _formValidation,
        child: const Icon(Icons.save),
      ),
      body: Column(
        children: [
          Image.asset(
            AppImage.person.path,
            width: 120.0,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                    ),
                    controller: _nameController,
                    validator: _nameValidator,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'E-mail',
                    ),
                    controller: _emailController,
                    validator: _emailValidator,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Telefone',
                    ),
                    controller: _phoneController,
                    validator: _phoneValidator,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
