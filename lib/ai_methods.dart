// ignore_for_file: avoid_print

import 'dart:typed_data';

import 'package:brain_fusion/brain_fusion.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

class GeminiMethods {
  final gemini = Gemini.instance;
  final AI imageAI = AI();
  final List<Content> messages = [];

  Future<String> isImageNeeded(String prompt) async {
    print("$prompt is image");
    try {
      var value = await gemini.text(
          "$prompt Does this message want to generate an AI picture, image, art or anything similar? Simply answer with a yes or no.");

      String? content = value?.output;

      if (content != null &&
          (content.toLowerCase() == 'yes' || content.toLowerCase() == 'yes.')) {
        print("yes\n");
        final res = await brainFusionImage(prompt);
        String im = res.toString();
        print(im);
        return im;
      } else {
        print("no\nr");
        final res = await geminiText(prompt);
        return res;
      }
    } catch (e) {
      print(e);
      return 'Error processing the request';
    }
  }

  Future<String> geminiText(String prompt) async {
    messages.add(Content(parts: [Parts(text: prompt)], role: 'user'));
    print("$prompt gemini text");
    try {
      var value = await gemini.chat(messages);
      messages.add(
          Content(parts: [Parts(text: value?.output ?? '')], role: 'model'));
      print(value?.output);
      return value?.output ?? 'No response';
    } catch (e) {
      print(e);
      return 'Error processing the request';
    }
  }

  Future<Uint8List> brainFusionImage(String prompt) async {
    Uint8List image =
        await imageAI.runAI(prompt, AIStyle.anime, Resolution.r1x1);
    return image;
  }
}
