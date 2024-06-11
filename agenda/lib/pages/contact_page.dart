import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app/app_asset.dart';
import '../models/contact.dart';
import '../provider/agenda_provider.dart';

class ContactPage extends StatefulWidget {
  final Contact? contact;

  const ContactPage({
    super.key,
    this.contact,
  });

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  bool _isLoading = false;

  @override
  void initState() {
    final contact = widget.contact;

    super.initState();

    _nameController.text = contact?.name ?? '';
    _emailController.text = contact?.email ?? '';
    _phoneController.text = contact?.phone ?? '';
  }

  void _formSubmit(BuildContext context) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final contact = Contact(
      id: widget.contact?.id ?? '',
      name: _nameController.text.trim(),
      email: _emailController.text.trim(),
      phone: _phoneController.text.trim(),
    );

    final provider = Provider.of<AgendaProvider>(
      context,
      listen: false,
    );
    final nav = Navigator.of(context);

    setState(() => _isLoading = true);
    try {
      await provider.save(contact);
      nav.pop();
    } catch (error) {
      showDialog<void>(
        context: context,
        builder: (context) => AlertDialog(
            title: const Text('Ocoreu um Erro'),
            content: Text(error.toString()),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Fechar'),
              )
            ]),
      );
    } finally {
      setState(() => _isLoading = false);
    }
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
        onPressed: () => _formSubmit(context),
        child: const Icon(Icons.save),
      ),
      body: !_isLoading
          ? Column(
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
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
