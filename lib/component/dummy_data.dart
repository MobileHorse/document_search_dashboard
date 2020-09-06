import 'package:document_search_dashboard/model/document_model.dart';
import 'package:document_search_dashboard/model/match_model.dart';

class DummyData {
  static final List<String> dummyChips = [
    "Nuvem", "São Paulo", "Google", "API", "Consultoria", "2020", "Ibirapuera", "Revista", "Inteligencia Artificial", "Brasil", "Passaros", "Document AI", "Veja", "Rio de Janeiro", "Metro", "Rotas"
  ];

  static final List<MatchModel> dummyMatches = [
    MatchModel(4, DocumentModel("document_1.pdf", "Transcription 1", ["tag1", "tag2", "tag3"], "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50")),
    MatchModel(2, DocumentModel("document_2.pdf", "Transcription 2", ["tag1", "tag2", "tag3"], "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50")),
    MatchModel(3, DocumentModel("document_3.pdf", "Transcription 3", ["tag1", "tag2", "tag3"], "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50")),
    MatchModel(4, DocumentModel("document_4.pdf", "Transcription 4", ["tag1", "tag2", "tag3"], "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50")),
    MatchModel(6, DocumentModel("document_5.pdf", "Transcription 5", ["tag1", "tag2", "tag3"], "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50")),
    MatchModel(5, DocumentModel("document_6.pdf", "Transcription 6", ["tag1", "tag2", "tag3"], "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50")),
    MatchModel(8, DocumentModel("document_7.pdf", "Transcription 7", ["tag1", "tag2", "tag3"], "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50")),
    MatchModel(34, DocumentModel("document_8.pdf", "Transcription 8", ["tag1", "tag2", "tag3"], "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50")),
    MatchModel(6, DocumentModel("document_9.pdf", "Transcription 9", ["tag1", "tag2", "tag3"], "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50")),
    MatchModel(9, DocumentModel("document_10.pdf", "Transcription 10", ["tag1", "tag2", "tag3"], "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50")),
    MatchModel(6, DocumentModel("document_11.pdf", "Transcription 11", ["tag1", "tag2", "tag3"], "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50")),
    MatchModel(23, DocumentModel("document_12.pdf", "Transcription 12", ["tag1", "tag2", "tag3"], "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50")),
  ];
}