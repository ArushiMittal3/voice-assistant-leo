import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:voice_assistant/color_manager.dart';
import 'package:voice_assistant/ai_methods.dart';
import 'package:voice_assistant/widgets/command_box.dart';
import 'package:voice_assistant/widgets/loaders.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final SpeechToText speech = SpeechToText();
  final GeminiMethods geminiMethods = GeminiMethods();
  String lastWords = '';
  bool speechEnabled = false;
  String? generateImageUrl;
  String? generatedContent;
  bool isOptions = true;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    initSpeech();
  }

  Future<void> initSpeech() async {
    //initailising the plugin and rebuilding the app
    await speech.initialize();
    setState(() {});
  }

  //each time to start listening
  Future<void> startListening() async {
    await speech.listen(onResult: onSpeechResult);
    setState(() {});
  }

  /// Manually stop the active speech recognition session
  Future<void> stopListening() async {
    await speech.stop();
    setState(() {});
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      lastWords = result.recognizedWords;
    });
  }

  @override
  void dispose() {
    super.dispose();
    speech.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black,
        backgroundColor: ColorManager.lightYellow,
        title: Bounce(child: const Text("Leo")),
        centerTitle: true,
        leading: const Icon(Icons.ac_unit),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               BounceInDown(
                 child: Center(
                        child: Image.asset(
                      'assets/images/leo.jpg',
                      height: 150,
                    )),
               ),
                  const SizedBox(height: 12),
              Stack(
                
                children: [
                 
                 Visibility(
                  visible: isLoading,
                  child: Loader()),
                  Column(
                    children: [
                      ZoomIn(
                        child: Container(
                          width: MediaQuery.sizeOf(context).width - 50,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(20)
                                  .copyWith(topLeft: Radius.zero)),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                  generatedContent != null
                                      ? generatedContent!
                                      : "How can I help you , Pookie?",
                                  style: TextStyle(
                                      fontFamily: 'Cera Pro',
                                      color: Colors.black87,
                                      fontSize: generatedContent != null ? 18 : 25),
                                  textAlign: generatedContent != null
                                      ? TextAlign.start
                                      : TextAlign.center),
                            ),
                          ),
                        ),
                      ),
                      
                      SlideInLeft(
                        duration: Duration(milliseconds: 1500),
                        child: Visibility(
                          visible: isOptions,
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Here are a few commands",
                                      style: TextStyle(
                                          fontFamily: 'Cera Pro',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    )),
                              ),
                              SlideInLeft(
                                duration: Duration(milliseconds: 2000),
                                child: CommandBox(
                                  color: ColorManager.darkYellow,
                                  heading: "ChatGpt",
                                  text:
                                      "A smarter way to stay organised and informed with ChatGpt",
                                ),
                              ),
                              SlideInLeft(
                                duration: Duration(milliseconds: 2500),
                                child: CommandBox(
                                  color: ColorManager.mediumYellow,
                                  heading: "Dall-E",
                                  text:
                                      "Get inspired and stay creative with your personal assistant powered by Dall-E",
                                ),
                              ),
                              SlideInLeft(
                                duration: Duration(milliseconds: 3000),
                                child: CommandBox(
                                  color: ColorManager.darkYellow,
                                  heading: "Smart voice Assistant",
                                  text:
                                      "Get the best of both worlds with a voice assistant powered by Dall-E and ChatGPT",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            if (await speech.hasPermission && speech.isNotListening) {
              print("start");
              await startListening();
            } else if (speech.isListening) {
              print("stop");

              await stopListening();

              await Future.delayed(Duration(milliseconds: 500));
              setState(() {
                isLoading = true;
                isOptions = false;
              });
              final content = await geminiMethods.isImageNeeded(lastWords);
              if (content.contains('https')) {
                generateImageUrl = content;
                generatedContent = null;
                
                setState(() {});
              } else {
                print("text set");
                generateImageUrl = null;
                generatedContent = content;

                setState(() {
                  isLoading = false;
                });
                
              }
            } else {
              print("init");
              initSpeech();
            }
          },
          backgroundColor: ColorManager.lightYellow,
          child:  Icon(speech.isListening?Icons.mic_off: Icons.mic)),
    );
  }
}
