import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo/provider/service_provider.dart';

class CardTodoListWidget extends ConsumerWidget {
  const CardTodoListWidget({super.key, required this.getIndex});

  final int getIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoData = ref.watch(fetchStreamProvider);
    return todoData.when(
      data: (data) => Center(child: Text("I have a date")),
      error: (error, stackTrace) => Center(child: Text(stackTrace.toString())),
      loading: () => Center(child: CircularProgressIndicator()),
    );
  }
}
