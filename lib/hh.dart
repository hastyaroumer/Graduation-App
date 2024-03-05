import 'package:flutter/material.dart';

class hh extends StatefulWidget {
  const hh({super.key});

  @override
  State<hh> createState() => _hhState();
}

class _hhState extends State<hh> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
