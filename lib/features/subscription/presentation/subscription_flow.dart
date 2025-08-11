import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SubscriptionFlowScreen extends ConsumerStatefulWidget {
  const SubscriptionFlowScreen({super.key});

  @override
  ConsumerState<SubscriptionFlowScreen> createState() => _SubscriptionFlowScreenState();
}

class _SubscriptionFlowScreenState extends ConsumerState<SubscriptionFlowScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  
  String _selectedPlan = 'weekly_3';
  String _selectedPortion = 'regular';
  final List<String> _selectedDietary = [];
  String _selectedDeliveryDay = 'Monday';

  final List<Map<String, dynamic>> _plans = [
    {
      'id': 'weekly_3',
      'title': '3 Meals Per Week',
      'description': 'Perfect for trying our chef specials',
      'price': 89.99,
      'savings': 0,
    },
    {
      'id': 'weekly_5',
      'title': '5 Meals Per Week',
      'description': 'Great for busy weekdays',
      'price': 139.99,
      'savings': 10.00,
    },
    {
      'id': 'weekly_7',
      'title': '7 Meals Per Week',
      'description': 'Complete meal coverage',
      'price': 189.99,
      'savings': 25.00,
    },
  ];

  final List<String> _portionSizes = ['Small', 'Regular', 'Large'];
  final List<String> _dietaryOptions = [
    'Vegetarian',
    'Vegan',
    'Gluten-Free',
    'Keto',
    'Low-Carb',
    'Dairy-Free'
  ];
  final List<String> _deliveryDays = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday'
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Progress Indicator
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: List.generate(3, (index) {
                return Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                      right: index < 2 ? 8 : 0,
                    ),
                    height: 4,
                    decoration: BoxDecoration(
                      color: index <= _currentPage
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.outline,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                );
              }),
            ),
          ),
          
          // Page Content
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: [
                _buildPlanSelectionPage(),
                _buildPreferencesPage(),
                _buildSummaryPage(),
              ],
            ),
          ),
          
          // Navigation
          Container(
            padding: const EdgeInsets.all(16),
            child: SafeArea(
              child: Row(
                children: [
                  if (_currentPage > 0)
                    Expanded(
                      child: OutlinedButton(
                        onPressed: _previousPage,
                        child: const Text('Back'),
                      ),
                    ),
                  if (_currentPage > 0) const SizedBox(width: 16),
                  Expanded(
                    flex: _currentPage > 0 ? 1 : 1,
                    child: ElevatedButton(
                      onPressed: _currentPage < 2 ? _nextPage : _completeSubscription,
                      child: Text(_currentPage < 2 ? 'Continue' : 'Subscribe Now'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlanSelectionPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Choose Your Plan',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Select the meal plan that fits your lifestyle',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
          const SizedBox(height: 24),
          
          ..._plans.map((plan) => Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: Card(
              child: InkWell(
                onTap: () {
                  setState(() {
                    _selectedPlan = plan['id'];
                  });
                },
                borderRadius: BorderRadius.circular(24),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    border: _selectedPlan == plan['id']
                        ? Border.all(
                            color: Theme.of(context).colorScheme.primary,
                            width: 2,
                          )
                        : null,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Radio<String>(
                            value: plan['id'],
                            groupValue: _selectedPlan,
                            onChanged: (value) {
                              setState(() {
                                _selectedPlan = value!;
                              });
                            },
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  plan['title'],
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                Text(
                                  plan['description'],
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '\$${plan['price'].toStringAsFixed(2)}/week',
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              if (plan['savings'] > 0)
                                Text(
                                  'Save \$${plan['savings'].toStringAsFixed(2)}/week',
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                            ],
                          ),
                          if (plan['savings'] > 0)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.secondary,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                'BEST VALUE',
                                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                  color: Theme.of(context).colorScheme.onSecondary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
        ],
      ),
    );
  }

  Widget _buildPreferencesPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Preferences',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Customize your meal experience',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
          const SizedBox(height: 32),
          
          // Portion Size
          Text(
            'Portion Size',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 12),
          ...List.generate(_portionSizes.length, (index) {
            final portion = _portionSizes[index].toLowerCase();
            return RadioListTile<String>(
              title: Text(_portionSizes[index]),
              value: portion,
              groupValue: _selectedPortion,
              onChanged: (value) {
                setState(() {
                  _selectedPortion = value!;
                });
              },
              contentPadding: EdgeInsets.zero,
            );
          }),
          
          const SizedBox(height: 32),
          
          // Dietary Preferences
          Text(
            'Dietary Preferences',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _dietaryOptions.map((option) {
              final isSelected = _selectedDietary.contains(option);
              return FilterChip(
                label: Text(option),
                selected: isSelected,
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      _selectedDietary.add(option);
                    } else {
                      _selectedDietary.remove(option);
                    }
                  });
                },
              );
            }).toList(),
          ),
          
          const SizedBox(height: 32),
          
          // Delivery Day
          Text(
            'Preferred Delivery Day',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            value: _selectedDeliveryDay,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            items: _deliveryDays.map((day) {
              return DropdownMenuItem(
                value: day,
                child: Text(day),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedDeliveryDay = value!;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryPage() {
    final selectedPlanData = _plans.firstWhere((p) => p['id'] == _selectedPlan);
    
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order Summary',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Review your subscription details',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
          const SizedBox(height: 32),
          
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    selectedPlanData['title'],
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Portion Size: ${_selectedPortion.substring(0, 1).toUpperCase()}${_selectedPortion.substring(1)}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Delivery Day: $_selectedDeliveryDay',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  if (_selectedDietary.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      'Dietary Preferences: ${_selectedDietary.join(', ')}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Weekly Total',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        '\$${selectedPlanData['price'].toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  if (selectedPlanData['savings'] > 0)
                    Text(
                      'You save \$${selectedPlanData['savings'].toStringAsFixed(2)} per week!',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 24),
          
          Text(
            'Subscription Details',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 12),
          const Text('• Meals are prepared fresh weekly'),
          const Text('• Skip or pause anytime before Wednesday'),
          const Text('• Delivery every week on your chosen day'),
          const Text('• Cancel anytime with 1-week notice'),
          const Text('• 100% satisfaction guarantee'),
        ],
      ),
    );
  }

  void _nextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _completeSubscription() {
    // TODO: Implement Stripe checkout
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Subscription Created'),
        content: const Text(
          'Your subscription has been created! Payment integration with Stripe '
          'will be implemented in the next phase. You\'ll receive a confirmation '
          'email shortly.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}