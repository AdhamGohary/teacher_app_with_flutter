import 'package:flutter/material.dart';

navigateAndRemove({required var context, required var screen}) {
  Navigator.of(context).pushNamedAndRemoveUntil(screen, (route) => false);
}
