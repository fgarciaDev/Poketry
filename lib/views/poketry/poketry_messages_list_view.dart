import 'package:flutter/material.dart';
import 'package:poketry/data/providers/research_provider.dart';
import 'package:provider/provider.dart';

class PoketryMessagesListView extends StatefulWidget {
  const PoketryMessagesListView({super.key});

  @override
  State<StatefulWidget> createState() => _PoketryMessagesListViewState();
}

class _PoketryMessagesListViewState extends State<PoketryMessagesListView> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final messages = Provider.of<ResearchProvider>(context).researchMessages;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView.builder(
          reverse: true,
          itemCount: messages.length,
          itemBuilder: (BuildContext context, int index) {
            final isBotMsg = messages[index].userId == researchBotId;

            return Align(
              alignment:
                  isBotMsg ? Alignment.centerLeft : Alignment.centerRight,
              child: Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(8.0),
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.8,
                ),
                decoration: BoxDecoration(
                  color: isBotMsg
                      ? theme.colorScheme.primaryContainer
                      : Colors.grey[300],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  messages[index].message,
                  style: theme.textTheme.bodyLarge!.copyWith(
                      color: isBotMsg
                          ? theme.colorScheme.onPrimaryContainer
                          : Colors.black),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
