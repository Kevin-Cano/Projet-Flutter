import 'package:flutter/material.dart';

class ProjectFormResult {
  const ProjectFormResult({required this.name, required this.colorValue});

  final String name;
  final int colorValue;
}

class ProjectFormDialog extends StatefulWidget {
  const ProjectFormDialog({super.key});

  @override
  State<ProjectFormDialog> createState() => _ProjectFormDialogState();
}

class _ProjectFormDialogState extends State<ProjectFormDialog> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  int _color = 0xFF6750A4;

  static const _colors = [
    0xFF6750A4,
    0xFF00695C,
    0xFFE65100,
    0xFF1565C0,
    0xFFB3261E,
    0xFF5D4037,
  ];

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Nouveau projet'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _name,
              decoration: const InputDecoration(labelText: 'Nom *'),
              validator: (v) =>
                  v == null || v.trim().isEmpty ? 'Nom obligatoire' : null,
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              children: _colors.map((c) {
                final selected = _color == c;
                return GestureDetector(
                  onTap: () => setState(() => _color = c),
                  child: CircleAvatar(
                    radius: selected ? 18 : 14,
                    backgroundColor: Color(c),
                    child: selected ? const Icon(Icons.check, size: 16) : null,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Annuler'),
        ),
        FilledButton(
          onPressed: () {
            if (!_formKey.currentState!.validate()) return;
            Navigator.pop(
              context,
              ProjectFormResult(name: _name.text.trim(), colorValue: _color),
            );
          },
          child: const Text('Créer'),
        ),
      ],
    );
  }
}
