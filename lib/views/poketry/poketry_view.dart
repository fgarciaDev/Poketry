import 'package:flutter/material.dart';
import 'package:poketry/views/poketry/poketry_message_textfield.dart';
import 'package:poketry/views/poketry/poketry_messages_list_view.dart';

class PoketryView extends StatefulWidget {
  const PoketryView({super.key});

  @override
  State<PoketryView> createState() => _PoketryViewState();
}

class _PoketryViewState extends State<PoketryView> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        PoketryMessagesListView(),
        PoketryMessageTextfield(),
      ],
    );
  }
}
