import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/predefined_menu.dart';
import '../controllers/menu_controller.dart';
import '../widgets/menu_template_form.dart';

class AdminMenuTemplatesScreen extends ConsumerWidget {
  const AdminMenuTemplatesScreen({super.key});

  void _handleCreateTemplate(BuildContext context, WidgetRef ref) {
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
            const Text('Create Template', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 16),
            MenuTemplateForm(
              onSave: (template) async {
                await ref.read(menuTemplateControllerProvider.notifier)
                    .createTemplate(template);
                if (context.mounted) Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final templatesAsync = ref.watch(menuTemplateControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Templates'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _handleCreateTemplate(context, ref),
          ),
        ],
      ),
      body: templatesAsync.when(
        data: (templates) => _TemplateList(templates: templates),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Text('Error: ${error.toString()}'),
        ),
      ),
    );
  }
}

class _TemplateList extends ConsumerWidget {
  const _TemplateList({required this.templates});

  final List<PredefinedMenu> templates;

  void _handleEditTemplate(BuildContext context, WidgetRef ref, PredefinedMenu template) {
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
            const Text('Edit Template', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 16),
            MenuTemplateForm(
              initialTemplate: template,
              onSave: (updatedTemplate) async {
                await ref.read(menuTemplateControllerProvider.notifier)
                    .createTemplate(updatedTemplate);
                if (context.mounted) Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _handleApplyTemplate(BuildContext context, WidgetRef ref, PredefinedMenu template) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 90)),
    ).then((date) async {
      if (date != null) {
        await ref.read(menuTemplateControllerProvider.notifier)
            .applyTemplate(template.templateId, date);
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Template applied successfully')),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (templates.isEmpty) {
      return const Center(
        child: Text('No templates found. Create one to get started.'),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        await ref.read(menuTemplateControllerProvider.notifier).refreshTemplates();
      },
      child: ListView.builder(
        itemCount: templates.length,
        itemBuilder: (context, index) {
          final template = templates[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(template.name),
                  subtitle: Text(
                    '${template.items.length} items • Created ${template.createdAt.toString().split(' ')[0]}',
                  ),
                  trailing: PopupMenuButton(
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: const Text('Edit'),
                        onTap: () => _handleEditTemplate(context, ref, template),
                      ),
                      PopupMenuItem(
                        child: const Text('Apply to Date'),
                        onTap: () => _handleApplyTemplate(context, ref, template),
                      ),
                    ],
                  ),
                ),
                if (template.description != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(template.description!),
                  ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text('Items:', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                ...template.items.map((item) => ListTile(
                  dense: true,
                  title: Text(item.name),
                  trailing: Text('\$${item.price.toStringAsFixed(2)}'),
                )),
              ],
            ),
          );
        },
      ),
    );
  }
}