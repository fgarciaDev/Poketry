import 'package:flutter/material.dart';
import 'package:poketry/data/providers/research_provider.dart';
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

    void sendSupportMessage() {
      if (_textController.text.isEmpty) return;
      final researcher = Provider.of<ResearchProvider>(context, listen: false);
      researcher.postResearchMessage(_textController.text, mockUserId);
      _textController.clear();
      researcher.postResearchMessage(
          'I will be providing you with an AI response in the future.',
          researchBotId);
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
                  // boxShadow: [
                  //   BoxShadow(
                  //     offset: Offset(0.0, 3.0),
                  //     color: Colors.redAccent,
                  //     blurRadius: 5.0,
                  //   ),
                  // ],
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
                        onSubmitted: (_) => sendSupportMessage(),
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
                onTap: sendSupportMessage,
                child: Icon(
                  Icons.send,
                  color: _sendDisabled ? Colors.red[200] : Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
