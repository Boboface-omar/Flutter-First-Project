import 'package:flutter/material.dart';
import 'package:flutter_lab/open_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const MessagePage(),
    );
  }
}

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final TextEditingController _messageController = TextEditingController();
  String answer = '';
  String? errorMessage;
  bool isLoading = false;

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _talkToGpt() async {
    final message = _messageController.text.trim();
    if (message.isEmpty) {
      setState(() {
        errorMessage = 'Écris un message avant d’envoyer.';
        answer = '';
      });
      return;
    }

    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final theAnswer = await getOpenRouterResponse(message);
      if (!mounted) return;
      setState(() {
        answer = theAnswer;
        isLoading = false;
      });
    } catch (error) {
      if (!mounted) return;
      setState(() {
        answer = '';
        errorMessage = error.toString().replaceFirst('Exception: ', '');
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ma première app'), centerTitle: true),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Écris ton message',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: _messageController,
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) => _talkToGpt(),
                  decoration: const InputDecoration(
                    labelText: 'Ton message',
                    hintText: 'Saisis ton texte ici',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                if (isLoading)
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: CircularProgressIndicator(),
                    ),
                  ),
                if (errorMessage != null)
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.red.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      errorMessage!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                if (answer.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.blue.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        answer,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ),
                const SizedBox(height: 12),
                Text(
                  'Appuie sur le bouton pour valider.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _talkToGpt,
        tooltip: 'Valider le message',
        child: const Icon(Icons.send),
      ),
    );
  }
}
