import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'cart_view_model.dart';

final cartVM = ChangeNotifierProvider((_)=>CartViewModel());