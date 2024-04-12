import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:velocity_x/velocity_x.dart';

import 'openai_service.dart';

class AIHandler {
  String lastWords = '';
  final OpenAIService openAIService = OpenAIService();
  String? generatedContent;
  Future<String> getResponse(String message) async {
    try {
      Future<String> res = openAIService.isArtPromptAPI(message);
      print(res);
      return res;
    } catch (e) {
      return e.toString();
    }
  }
  // final _openAI = OpenAI.instance.build(
  //   token: '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',
  //   baseOption: HttpSetup(
  //     receiveTimeout: const Duration(seconds: 60),
  //     connectTimeout: const Duration(seconds: 60),
  //   ),
  // );

  // Future<String> getResponse(String message) async {

  //   try {
  //     final request = ChatCompleteText(messages:  [

  //     ], maxToken: 200, model:GptTurboChatModel());

  //     final response = await _openAI.onChatCompletion(request: request);
  //     if (response != null) {
  //       return response.choices[0].message!.content.trim();
  //     }

  //     return 'Some thing went wrong';
  //   } catch (e) {
  //     return e.toString();
  //   }
  // }

  // void dispose() {

  //   // _openAI.close();

  // }
}
