import 'package:flutter/material.dart';

class GeminiVoice extends StatefulWidget {
  const GeminiVoice({super.key});

  @override
  State<GeminiVoice> createState() => _GeminiVoiceState();
}

class _GeminiVoiceState extends State<GeminiVoice> {
  bool isbool = false;
  @override
  void initState() {
    super.initState();
    isbool = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple,
      child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Container(
            color: Colors.blue,
            height: 200,
            width: 200,
            child: const Center(
                child: Text(
              'Speak What you want to Ask',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
            ))),
        IconButton(
          icon: const Icon(Icons.mic_external_on_rounded),
          onPressed: () {
            setState(() {
              isbool == true;
            });
          },
        ),
      ]),
    );
  }
}
