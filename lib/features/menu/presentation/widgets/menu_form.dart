import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/menu.dart';

class MenuForm extends ConsumerStatefulWidget {
  const MenuForm({
    super.key,
    this.initialMenu,
    required this.onSave,
  });

  final Menu? initialMenu;
  final void Function(Menu menu) onSave;

  @override
  ConsumerState<MenuForm> createState() => _MenuFormState();
}

class _MenuFormState extends ConsumerState<MenuForm> {
  final _formKey = GlobalKey<FormState>();
  late DateTime _date;
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late bool _isActive;

  @override
  void initState() {
    super.initState();
    _date = widget.initialMenu?.date ?? DateTime.now();
    _titleController = TextEditingController(text: widget.initialMenu?.title ?? '');
    _descriptionController = TextEditingController(text: widget.initialMenu?.description ?? '');
    _isActive = widget.initialMenu?.isActive ?? false;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      final menu = (widget.initialMenu ?? Menu.empty()).copyWith(
        title: _titleController.text,
        description: _descriptionController.text,
        date: _date,
        isActive: _isActive,
      );
      widget.onSave(menu);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: 'Menu Title'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a title';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _descriptionController,
            decoration: const InputDecoration(labelText: 'Description (Optional)'),
            maxLines: 3,
          ),
          const SizedBox(height: 16),
          ListTile(
            title: const Text('Menu Date'),
            subtitle: Text(_date.toString().split(' ')[0]),
            trailing: const Icon(Icons.calendar_today),
            onTap: () async {
              final selectedDate = await showDatePicker(
                context: context,
                initialDate: _date,
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 90)),
              );
              if (selectedDate != null) {
                setState(() => _date = selectedDate);
              }
            },
          ),
          const SizedBox(height: 16),
          SwitchListTile(
            title: const Text('Active'),
            subtitle: const Text('Menu is visible to customers'),
            value: _isActive,
            onChanged: (value) => setState(() => _isActive = value),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: _handleSubmit,
            child: Text(widget.initialMenu == null ? 'Create Menu' : 'Update Menu'),
          ),
        ],
      ),
    );
  }
}