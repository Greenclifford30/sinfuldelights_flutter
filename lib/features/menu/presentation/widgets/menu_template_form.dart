import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/predefined_menu.dart';
import '../../data/models/menu_item.dart';
import 'menu_item_form.dart';

class MenuTemplateForm extends ConsumerStatefulWidget {
  const MenuTemplateForm({
    super.key,
    this.initialTemplate,
    required this.onSave,
  });

  final PredefinedMenu? initialTemplate;
  final void Function(PredefinedMenu template) onSave;

  @override
  ConsumerState<MenuTemplateForm> createState() => _MenuTemplateFormState();
}

class _MenuTemplateFormState extends ConsumerState<MenuTemplateForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late List<MenuItem> _items;
  late bool _isActive;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialTemplate?.name ?? '');
    _descriptionController = TextEditingController(text: widget.initialTemplate?.description ?? '');
    _items = List.from(widget.initialTemplate?.items ?? []);
    _isActive = widget.initialTemplate?.isActive ?? false;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _handleAddItem() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 16,
          right: 16,
          top: 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Add Menu Item', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 16),
            MenuItemForm(
              onSave: (item) {
                setState(() => _items.add(item));
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _handleEditItem(int index) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 16,
          right: 16,
          top: 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Edit Menu Item', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 16),
            MenuItemForm(
              initialItem: _items[index],
              onSave: (item) {
                setState(() => _items[index] = item);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      final template = (widget.initialTemplate ?? PredefinedMenu.empty()).copyWith(
        name: _nameController.text,
        description: _descriptionController.text,
        items: _items,
        isActive: _isActive,
      );
      widget.onSave(template);
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
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Template Name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a name';
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
          SwitchListTile(
            title: const Text('Active'),
            subtitle: const Text('Template is available for use'),
            value: _isActive,
            onChanged: (value) => setState(() => _isActive = value),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Menu Items', style: TextStyle(fontSize: 18)),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: _handleAddItem,
              ),
            ],
          ),
          const SizedBox(height: 8),
          if (_items.isEmpty)
            const Center(
              child: Text('No items added yet'),
            )
          else
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _items.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(_items[index].name),
                subtitle: Text('\$${_items[index].price.toStringAsFixed(2)}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () => _handleEditItem(index),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        setState(() => _items.removeAt(index));
                      },
                    ),
                  ],
                ),
              ),
            ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: _handleSubmit,
            child: Text(
              widget.initialTemplate == null ? 'Create Template' : 'Update Template',
            ),
          ),
        ],
      ),
    );
  }
}