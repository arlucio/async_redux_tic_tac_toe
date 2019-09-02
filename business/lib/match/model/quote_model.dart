import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'quote_model.g.dart';

abstract class Quote implements Built<Quote, QuoteBuilder> {
  String get quoteText;
  String get quoteAuthor;
  String get senderName;
  String get senderLink;
  String get quoteLink;

  factory Quote([updates(QuoteBuilder b)]) = _$Quote;
  static Serializer<Quote> get serializer => _$quoteSerializer;
  Quote._();
}
