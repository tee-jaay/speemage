import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

import 'package:spetext/colors.dart';

class SpeechScreen extends StatefulWidget {
  const SpeechScreen({Key? key}) : super(key: key);

  @override
  State<SpeechScreen> createState() => _SpeechScreenState();
}

class _SpeechScreenState extends State<SpeechScreen> {
  String text = "Press & hold the button, start speaking";
  bool isListening = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.sort_rounded,
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: bgColor,
        elevation: 0.0,
        title: const Text(
          'SpeeMage',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        margin: const EdgeInsets.only(bottom: 144),
        child: Text(
          text,
          textAlign: TextAlign.center,
          softWrap: true,
          style: const TextStyle(
            fontSize: 24,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      floatingActionButton: AvatarGlow(
        endRadius: 72.0,
        animate: isListening,
        duration: const Duration(milliseconds: 2000),
        glowColor: bgColor,
        repeat: true,
        repeatPauseDuration: const Duration(milliseconds: 100),
        child: GestureDetector(
          onTapDown: (details) => setState(() {
            isListening = true;
          }),
          onTapUp: (details) => setState(() {
            isListening = false;
          }),
          child: CircleAvatar(
            backgroundColor: bgColor,
            radius: 32,
            child: Icon(
              isListening ? Icons.mic : Icons.mic_none,
              color: Colors.white,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
