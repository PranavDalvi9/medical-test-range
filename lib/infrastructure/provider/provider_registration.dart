import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medical_test_range/infrastructure/provider/home_provider/home_provider.dart';

final homeProvider = ChangeNotifierProvider((ref) => HomeProvider());
