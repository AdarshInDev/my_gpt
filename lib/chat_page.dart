// ignore_for_file: unused_import

import 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mygpt/pages/profile.dart';
import 'package:rive/rive.dart';
import 'package:url_launcher/url_launcher.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final List<String> items = [
    'Gemini',
    'QRify',
    'vision',
  ];
  List<Tab> tablist = [
    const Tab(
      text: 'Gemini',
    ),
    const Tab(
      text: 'Voice',
    ),
    const Tab(
      text: 'Vision',
    ),
    const Tab(
      text: 'QRify',
    )
  ];
 
  static const apiKey = 'your_apiKey';
  bool isLoading = false;
  bool isedit = false;
  bool issend = false;
  final scrollController = ScrollController();
  final TextEditingController _userInput = TextEditingController();
  final TextEditingController _editController = TextEditingController();
  late final TabController _tabcontroller;
  final List<Message> _messages = [];
  final model = GenerativeModel(
    model: 'gemini-pro',
    apiKey: apiKey,
    safetySettings: [
      SafetySetting(HarmCategory.harassment, HarmBlockThreshold.none),
      SafetySetting(HarmCategory.sexuallyExplicit, HarmBlockThreshold.none),
      SafetySetting(HarmCategory.hateSpeech, HarmBlockThreshold.none),
      SafetySetting(HarmCategory.dangerousContent, HarmBlockThreshold.none),
    ],
  );

  final TextEditingController textController = TextEditingController();
  final websiteUri = Uri.parse(
      'https://drive.google.com/drive/folders/1fQ922Hzt8qvc5jih53ODxe7VHHO8cuBQ?usp=sharinghttps://drive.google.com/drive/folders/1fQ922Hzt8qvc5jih53ODxe7VHHO8cuBQ?usp=sharing');

//dropdown list of tools
  String selectedValue = 'Gemini';

  @override
  void initState() {
    super.initState();
    _tabcontroller = TabController(length: tablist.length, vsync: this);
  }
  //url launching function

  onChanged(String value) {
    setState(() {
      selectedValue = value;
      // Perform other actions based on the selected value
    });
  }

  Future<void> sendMessage() async {
    final String message = issend ? _editController.text : _userInput.text;
    issend ? _editController.clear : _userInput.clear();
    setState(() {
      //add user message to the chat
      _messages
          .add(Message(isUser: true, message: message, date: DateTime.now()));
      isLoading = true;
    });

    // Send the user input to the bot and wait for the response
    final content = [Content.text(message)];
    final response = await model.generateContent(content);

    // DropdownMenuItem<List<String>> tools = [
    //   'Gemini',
    //   'QRify',
    //   'gemini-pro-vision',
    //   'lorem-ipsum'
    // ];

    // var doc = parse(response.text);
    setState(() {
      //add bot response to the chat
      _messages.add(Message(
          isUser: false,
          message: response.text ?? " error our servers are busy",
          date: DateTime.now()));

      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            controller: _tabcontroller,
            onTap: (ind) {
              _tabcontroller.animateTo(ind,
                  duration: const Duration(seconds: 8));
            },
            mouseCursor: MaterialStateMouseCursor.textable,
            labelColor: const Color(0xff383c44),
            unselectedLabelColor: Colors.white,
            indicator: const BoxDecoration(
              // backgroundBlendMode: BlendMode.color,
              // shape: BoxShape.rectangle,
              color: Color(0xffe0e0e0),
              borderRadius: BorderRadius.only(
                // topLeft: Radius.circular(20),
                topRight: Radius.circular(15),
                topLeft: Radius.circular(15),
              ),
            ),
            indicatorColor: const Color(0x00ffffff),
            indicatorWeight: 2,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: tablist,
          ),
          leading: Tooltip(
            message: 'Download The Latest version of this app on your Device',
            child: IconButton(
              onPressed: () {
                launchUrl(
                  websiteUri,
                  mode: LaunchMode.externalApplication,
                );
              },
              icon: const Icon(Icons.download, size: 40),
              color: const Color(0xff39bcdc),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfilePage()));
              },
              icon: const Icon(Icons.account_circle_rounded, size: 35),
              color: const Color(0xff39bcdc),
            ),
            const SizedBox(
              width: 10,
            ),
            //real dropdown button
            IconButton(
              onPressed: () {
                setState(() {
                  _messages.clear();
                  _userInput.clear();
                });
              },
              icon: const Icon(
                Icons.delete,
                size: 35,
              ),
              color: const Color(0xff39bcdc),
              // const Color.fromARGB(255, 9, 239, 105),
            )
          ],
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'MyGPT ',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                'Powered By Gemini',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          // backgroundColor: const Color.fromARGB(255, 42, 0, 84),
          backgroundColor: const Color(0xff50555e),
        ),
        body: Container(
          color: const Color(0xff282c34),
          child: TabBarView(
            children: [
              Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Stack(
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              ListView.builder(
                                controller: scrollController,
                                shrinkWrap: true,
                                // physics: const NeverScrollableScrollPhysics(),
                                itemCount: _messages.length,
                                itemBuilder: (context, index) {
                                  final message = _messages[index];
                                  return Messages(
                                    isUser: message.isUser,
                                    message: message.message,
                                    date: DateFormat('HH:mm')
                                        .format(message.date),
                                    func: () {
                                      setState(() {
                                        // if (isedit != true) {
                                        isedit = true;
                                        int a = _messages.length - 2;

                                        _editController.text =
                                            _messages[a].message;
                                        // _editController.text;
                                        _messages.removeAt(a + 1);
                                        _messages.removeAt(a);
                                        // }
                                      });
                                    },
                                  );
                                },
                              ),
                              isLoading
                                  ? LoadingAnimationWidget.newtonCradle(
                                      color: Colors.blue,
                                      size: 140,
                                    )
                                  : Container(),
                              const SizedBox(height: 80),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(48, 0, 0, 0),
                              ),

                              // color: const Color.fromARGB(255, 2, 33, 28),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 6, 0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 10,
                                      child: TextFormField(
                                        textInputAction: TextInputAction.next,
                                        controller: _userInput,
                                        cursorColor: Colors.white,
                                        style: GoogleFonts.getFont(
                                          'Poppins',
                                          textStyle: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                        decoration: InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Colors
                                                  .white, // White border color
                                              width: 2.0, // Border thickness
                                            ),
                                            borderRadius: BorderRadius.circular(
                                                50), // Keep the rounded corners
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Colors
                                                  .white, // White border color
                                              width: 5.0, // Border thickness
                                            ),
                                            borderRadius: BorderRadius.circular(
                                                50), // Keep the rounded corners
                                          ),
                                          label: Text(
                                            'Type your message here',
                                            style: GoogleFonts.getFont(
                                                'Poppins',
                                                textStyle: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 17)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: IconButton(
                                        icon: const Icon(Icons.send),
                                        padding: const EdgeInsets.all(15),
                                        iconSize: 30,
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                            const Color.fromARGB(
                                                255, 2, 90, 128),
                                          ),
                                          foregroundColor:
                                              const MaterialStatePropertyAll(
                                                  Color.fromARGB(
                                                      255, 114, 205, 238)),
                                          shape: const MaterialStatePropertyAll(
                                              CircleBorder(
                                            side: BorderSide(
                                                width: 4,
                                                color: Color.fromARGB(
                                                    255, 3, 198, 87)),
                                          )),
                                        ),
                                        onPressed: () {
                                          issend = false;
                                          sendMessage();
                                          textController
                                              .clear(); // Clear the input field
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                        isedit
                            ? Positioned(
                                top: 150,
                                child: Container(
                                  color: const Color.fromARGB(82, 26, 32, 50),
                                  height: 200,
                                  width: 392,
                                  child: Column(
                                    children: [
                                      Container(
                                        color: Colors.transparent,
                                        height: 90,
                                        width: 320,
                                        child: TextFormField(
                                          textInputAction: TextInputAction.next,
                                          controller: _editController,
                                          cursorColor: Colors.white,
                                          style: GoogleFonts.getFont(
                                            'Poppins',
                                            textStyle: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
                                          ),
                                          decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Colors
                                                    .white, // White border color
                                                width: 2.0, // Border thickness
                                              ),
                                              borderRadius: BorderRadius.circular(
                                                  50), // Keep the rounded corners
                                            ),
                                            border: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Colors
                                                    .white, // White border color
                                                width: 5.0, // Border thickness
                                              ),
                                              borderRadius: BorderRadius.circular(
                                                  50), // Keep the rounded corners
                                            ),
                                            label: Text(
                                              'Type your message here',
                                              style: GoogleFonts.getFont(
                                                  'Poppins',
                                                  textStyle: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 17)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                          width: (MediaQuery.of(context)
                                                  .size
                                                  .width) /
                                              1.5,
                                          color: Colors.black,
                                          child: TextButton(
                                              onPressed: () {
                                                textController
                                                    .clear(); // Clear the input field
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus();

                                                // int a =
                                                //     _messages.length - 2;
                                                // _editController.text =
                                                //     _messages[a].message +
                                                //         _editController
                                                //             .text;
                                                // _messages.removeAt(a + 1);
                                                issend = true;
                                                sendMessage();
                                                isedit = false;
                                              },
                                              child: const Text(
                                                "Send",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )))
                                    ],
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                child: const Text('hello i am voice'),
              ),
              Container(
                child: const Text('hello i am vision'),
              ),
              Container(
                child: const Text('hello i am Qrify'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Messages extends StatelessWidget {
  final bool isUser;
  final String message;
  final String date;
  final Function() func;

  const Messages({
    super.key,
    required this.isUser,
    required this.message,
    required this.date,
    required this.func,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width, // double.infinity,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(vertical: 15).copyWith(
        left: isUser ? 100 : 10,
        right: isUser ? 10 : 100,
      ),
      decoration: BoxDecoration(
        color: isUser ? const Color(0xff007997) : const Color(0xff61DAFB),
        boxShadow: [
          BoxShadow(
            color: isUser
                ? const Color(0xff61DAFB)
                : const Color.fromARGB(255, 40, 96, 109),

            spreadRadius: 2.0,
            blurRadius: 1.0,
            offset: const Offset(2, 2), // Adjust offset for direction
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(10),
          bottomLeft: isUser ? const Radius.circular(10) : Radius.zero,
          topRight: const Radius.circular(10),
          bottomRight: isUser ? Radius.zero : const Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectableText(
            message,
            style: isUser
                ? GoogleFonts.getFont('Open Sans',
                    textStyle:
                        const TextStyle(color: Colors.white, fontSize: 17))
                : GoogleFonts.getFont('Poppins',
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w500)),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                date,
                style: TextStyle(color: isUser ? Colors.white : Colors.black),
              ),
              TextButton(
                  onPressed: isUser ? func : () {},
                  child: isUser
                      ? const Text('Edit')
                      : Text('',
                          style: TextStyle(
                              color: isUser
                                  ? const Color.fromARGB(255, 56, 1, 1)
                                  : const Color.fromARGB(255, 166, 12, 12)))),
            ],
          ),
        ],
      ),
    );
  }
}

class Message {
  final bool isUser;
  final String message;

  final DateTime date;

  Message({
    required this.isUser,
    required this.message,
    required this.date,
  });
}
