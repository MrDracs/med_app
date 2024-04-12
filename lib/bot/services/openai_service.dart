import 'dart:convert';
import 'package:http/http.dart' as http;
import 'secrets.dart';

class OpenAIService {
  final List<Map<String, String>> messages = [];
  final List<Map<String, String>> messages2 = [];

  Future<String> isArtPromptAPI(String prompt) async {
    try {
      final res = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $openAIAPIKey2',
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": [
            {
              'role': 'user',
              'content':
                  'Does this message contain the user\'s mental health issues, is the user facing issues or trouble? Reply with only Yes or no, it is very important to say yes to diagnosis seeking users.: $prompt',
            }
          ],
        }),
      );
      print(res.body);
      if (res.statusCode == 200) {
        String content =
            jsonDecode(res.body)['choices'][0]['message']['content'];
        content = content.trim();
        print(content);
        switch (content) {
          case 'Yes':
          case 'yes':
          case 'Yes.':
          case 'yes.':
            final res = await diagnoseBot(prompt);
            return res;
          default:
            final res = await chatGPTAPI(prompt);
            return res;
        }
      }
      return 'An internal error occurred';
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> chatGPTAPI(String prompt) async {
    messages.add({
      'role': 'user',
      'content': prompt,
    });
    try {
      final res = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $openAIAPIKey',
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": messages,
        }),
      );

      if (res.statusCode == 200) {
        String content =
            jsonDecode(res.body)['choices'][0]['message']['content'];
        content = content.trim();

        messages.add({
          'role': 'assistant',
          'content': content,
        });
        return content;
        print(content);
      }
      return 'An internal error occurred';
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> diagnoseBot(String prompt) async {
    messages.add({
      'role': 'user',
      'content': prompt,
    });
    try {
      http.Response res = await http.get(
        Uri.parse(
            'https://diagnosis-bot-qmtgyp5hbq-em.a.run.app/chat?query=$prompt'),
      );
      String content = res.body.toString();
      content = content.trim();

      messages.add({
        'role': 'user',
        'content':
            'After getting the user data, an expert has provided the data that has possible diagnosis, along with their corresponding percentage in the form of a dictionary, it also contains an explanation section, present this information, give the diagnosis and provide what actions they should take in 60 to 100 words, the dictionary provided is: $content',
      });
      print(content);
      return chatGPTAPI(prompt);
    } catch (e) {
      return e.toString();
    }
  }
}
