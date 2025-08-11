import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/menu_item.dart';

class MenuItemForm extends ConsumerStatefulWidget {
  const MenuItemForm({
    super.key,
    this.initialItem,
    required this.onSave,
  });

  final MenuItem? initialItem;
  final void Function(MenuItem item) onSave;

  @override
  ConsumerState<MenuItemForm> createState() => _MenuItemFormState();
}

class _MenuItemFormState extends ConsumerState<MenuItemForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _priceController;
  late TextEditingController _stockController;
  late bool _isSpecial;
  String? _imageUrl;
  bool _isUploading = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialItem?.name ?? '');
    _descriptionController = TextEditingController(text: widget.initialItem?.description ?? '');
    _priceController = TextEditingController(text: widget.initialItem?.price.toString() ?? '');
    _stockController = TextEditingController(text: widget.initialItem?.stockQty.toString() ?? '');
    _isSpecial = widget.initialItem?.isSpecial ?? false;
    _imageUrl = widget.initialItem?.imageUrl;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _stockController.dispose();
    super.dispose();
  }

  Future<void> _uploadImage() async {
    setState(() => _isUploading = true);
    try {
      // TODO: Implement image picker and upload
      // final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      // if (image != null) {
      //   final bytes = await image.readAsBytes();
      //   final url = await ref.read(imageUploadUrlProvider.future);
      //   await ref.read(uploadImageProvider(url, bytes).future);
      //   setState(() => _imageUrl = url);
      // }
    } finally {
      setState(() => _isUploading = false);
    }
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      final item = (widget.initialItem ?? MenuItem.empty()).copyWith(
        name: _nameController.text,
        description: _descriptionController.text,
        price: double.parse(_priceController.text),
        stockQty: int.parse(_stockController.text),
        isSpecial: _isSpecial,
        imageUrl: _imageUrl,
      );
      widget.onSave(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (_imageUrl != null)
            Stack(
              children: [
                Image.network(
                  _imageUrl!,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  right: 8,
                  top: 8,
                  child: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => setState(() => _imageUrl = null),
                  ),
                ),
              ],
            ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: _isUploading ? null : _uploadImage,
            icon: const Icon(Icons.upload),
            label: Text(_isUploading ? 'Uploading...' : 'Upload Image'),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Item Name'),
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
            decoration: const InputDecoration(labelText: 'Description'),
            maxLines: 3,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a description';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _priceController,
            decoration: const InputDecoration(
              labelText: 'Price',
              prefixText: '\$',
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
            ],
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a price';
              }
              final price = double.tryParse(value);
              if (price == null || price <= 0) {
                return 'Please enter a valid price';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _stockController,
            decoration: const InputDecoration(labelText: 'Stock Quantity'),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a stock quantity';
              }
              final quantity = int.tryParse(value);
              if (quantity == null || quantity < 0) {
                return 'Please enter a valid quantity';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          SwitchListTile(
            title: const Text('Special Item'),
            subtitle: const Text('Featured in specials section'),
            value: _isSpecial,
            onChanged: (value) => setState(() => _isSpecial = value),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: _handleSubmit,
            child: Text(widget.initialItem == null ? 'Add Item' : 'Update Item'),
          ),
        ],
      ),
    );
  }
}