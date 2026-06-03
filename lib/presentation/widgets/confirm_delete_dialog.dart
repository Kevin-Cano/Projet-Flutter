import 'package:flutter/material.dart';

Future<bool> showConfirmDeleteDialog(
  BuildContext context, {
  required String itemName,
}) async {
  final result = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Confirmer la suppression'),
      content: Text('Supprimer « $itemName » ? Cette action est irréversible.'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('Annuler'),
        ),
        FilledButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text('Supprimer'),
        ),
      ],
    ),
  );
  return result ?? false;
}
