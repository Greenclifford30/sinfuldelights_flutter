import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CateringFormScreen extends ConsumerStatefulWidget {
  const CateringFormScreen({super.key});

  @override
  ConsumerState<CateringFormScreen> createState() => _CateringFormScreenState();
}

class _CateringFormScreenState extends ConsumerState<CateringFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _eventDateController = TextEditingController();
  final _guestCountController = TextEditingController();
  final _budgetController = TextEditingController();
  final _descriptionController = TextEditingController();
  
  DateTime? _selectedDate;
  String _selectedCuisineType = 'American';
  String _selectedServiceType = 'Drop-off';
  
  final List<String> _cuisineTypes = [
    'American',
    'Italian',
    'Mexican',
    'Asian',
    'Mediterranean',
    'Fusion',
    'Other'
  ];
  
  final List<String> _serviceTypes = [
    'Drop-off',
    'Buffet Service',
    'Plated Service',
    'Family Style'
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _eventDateController.dispose();
    _guestCountController.dispose();
    _budgetController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Catering Request',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 8),
              Text(
                'Tell us about your event and we\'ll create a custom quote',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                ),
              ),
              const SizedBox(height: 32),
              
              // Contact Information
              Text(
                'Contact Information',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email Address',
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  prefixIcon: Icon(Icons.phone),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),
              
              // Event Details
              Text(
                'Event Details',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              
              TextFormField(
                controller: _eventDateController,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Event Date',
                  prefixIcon: Icon(Icons.calendar_today),
                  suffixIcon: Icon(Icons.arrow_drop_down),
                ),
                onTap: _selectDate,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select an event date';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              
              TextFormField(
                controller: _guestCountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Number of Guests',
                  prefixIcon: Icon(Icons.people),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the number of guests';
                  }
                  if (int.tryParse(value) == null || int.parse(value) <= 0) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              
              DropdownButtonFormField<String>(
                value: _selectedCuisineType,
                decoration: const InputDecoration(
                  labelText: 'Cuisine Preference',
                  prefixIcon: Icon(Icons.restaurant),
                ),
                items: _cuisineTypes.map((type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCuisineType = value!;
                  });
                },
              ),
              const SizedBox(height: 16),
              
              DropdownButtonFormField<String>(
                value: _selectedServiceType,
                decoration: const InputDecoration(
                  labelText: 'Service Type',
                  prefixIcon: Icon(Icons.room_service),
                ),
                items: _serviceTypes.map((type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedServiceType = value!;
                  });
                },
              ),
              const SizedBox(height: 16),
              
              TextFormField(
                controller: _budgetController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Budget per Person (\$)',
                  prefixIcon: Icon(Icons.attach_money),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your budget';
                  }
                  if (double.tryParse(value) == null || double.parse(value) <= 0) {
                    return 'Please enter a valid amount';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              
              TextFormField(
                controller: _descriptionController,
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: 'Additional Details',
                  hintText: 'Tell us more about your event, dietary restrictions, special requests, etc.',
                  prefixIcon: Icon(Icons.description),
                ),
              ),
              const SizedBox(height: 32),
              
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('Submit Request'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 7)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _eventDateController.text = '${picked.month}/${picked.day}/${picked.year}';
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // TODO: Send to API
      
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Request Submitted'),
          content: const Text(
            'Thank you for your catering request! We\'ll review your information '
            'and get back to you within 24 hours with a custom quote.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _resetForm();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  void _resetForm() {
    _formKey.currentState!.reset();
    _nameController.clear();
    _emailController.clear();
    _phoneController.clear();
    _eventDateController.clear();
    _guestCountController.clear();
    _budgetController.clear();
    _descriptionController.clear();
    setState(() {
      _selectedDate = null;
      _selectedCuisineType = 'American';
      _selectedServiceType = 'Drop-off';
    });
  }
}