import 'package:flutter/material.dart';
import 'package:poketry/data/providers/poketry_provider.dart';
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
    final messages = Provider.of<PoketryProvider>(context).poketryMessages;
    final isLoading = Provider.of<PoketryProvider>(context).isLoading;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView.builder(
          reverse: true,
          itemCount: !isLoading ? messages.length : messages.length + 1,
          itemBuilder: (BuildContext context, int actualIndex) {
            final index = isLoading ? actualIndex - 1 : actualIndex;
            if (index < 0) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Center(child: CircularProgressIndicator.adaptive()),
              );
            } else {
              final isBotMsg = messages[index].userId == geminiId;
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
            }
          },
        ),
      ),
    );
  }
}
