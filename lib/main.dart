import 'package:flutter/material.dart';
import 'package:podify/auth/auth_view_model.dart';
import 'package:podify/screens/welcome.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
      ],
      child: const MaterialApp(
        home: Welcome(),
      ),
    ),
  );
}
