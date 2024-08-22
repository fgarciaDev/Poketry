import 'package:flutter/material.dart';
import 'package:poketry/data/providers/poketry_provider.dart';
import 'package:provider/provider.dart';

class PoketryMessageTextfield extends StatefulWidget {
  const PoketryMessageTextfield({super.key});

  @override
  State<PoketryMessageTextfield> createState() =>
      _PoketryMessageTextfieldState();
}

class _PoketryMessageTextfieldState extends State<PoketryMessageTextfield> {
  final _textController = TextEditingController();
  bool _sendDisabled = true;

  @override
  void initState() {
    super.initState();
    _textController.addListener(() {
      setState(() {
        _sendDisabled = _textController.text.isEmpty;
      });
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final poketry = Provider.of<PoketryProvider>(context, listen: false);

    void sendPoketryMessage() {
      debugPrint('isLoading: ${poketry.isLoading}');
      if (_textController.text.isEmpty || poketry.isLoading) return;
      poketry.postPoketryMessage(_textController.text, userId);
      _textController.clear();
    }

    return Container(
      color: colorScheme.surfaceContainer,
      height: 60.0,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 6.0),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(35.0)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: TextField(
                        controller: _textController,
                        decoration: const InputDecoration(
                          hintText: 'Enter your message...',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                        ),
                        onSubmitted: (_) => sendPoketryMessage(),
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 4.0),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: InkWell(
                onTap: sendPoketryMessage,
                child: Icon(
                  Icons.send,
                  color: _sendDisabled || poketry.isLoading
                      ? Colors.red[200]
                      : Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
