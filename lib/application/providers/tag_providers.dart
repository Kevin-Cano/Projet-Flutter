import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/task.dart';
import '../../infrastructure/seed/seed_data.dart';

final tagsProvider = Provider<List<TaskTag>>((ref) => SeedData.initialTags());
