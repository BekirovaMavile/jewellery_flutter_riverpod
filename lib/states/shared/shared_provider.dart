import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jewellry_shop/states/shared/shared_notifier.dart';
import 'package:jewellry_shop/states/shared/shared_state.dart';


final sharedProvider = StateNotifierProvider<SharedNotifier, SharedState>((ref) => SharedNotifier());