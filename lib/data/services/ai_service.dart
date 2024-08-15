import 'package:google_generative_ai/google_generative_ai.dart';

abstract class AiService {
  Future<String?> generateContent(List<Content> prompt);
}

const geminiKey = 'AIzaSyDtZjK69J259VeXVzKpxGT6OVrLNuHJ0o0';

class AiServiceImpl extends AiService {
  final model = GenerativeModel(
    model: 'gemini-1.5-flash-latest',
    apiKey: geminiKey,
  );

  @override
  Future<String?> generateContent(List<Content> prompt) async {
    final response = await model.generateContent(prompt);
    return response.text;
  }
}
