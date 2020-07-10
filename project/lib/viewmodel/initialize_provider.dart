import 'package:flutter_shop/viewmodel/category_view_model.dart';
import 'package:provider/provider.dart';

final providers = [
        ChangeNotifierProvider(create: (ctx) => CategoryViewModel())
];