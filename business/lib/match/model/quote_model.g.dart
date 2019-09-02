// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Quote> _$quoteSerializer = new _$QuoteSerializer();

class _$QuoteSerializer implements StructuredSerializer<Quote> {
  @override
  final Iterable<Type> types = const [Quote, _$Quote];
  @override
  final String wireName = 'Quote';

  @override
  Iterable<Object> serialize(Serializers serializers, Quote object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'quoteText',
      serializers.serialize(object.quoteText,
          specifiedType: const FullType(String)),
      'quoteAuthor',
      serializers.serialize(object.quoteAuthor,
          specifiedType: const FullType(String)),
      'senderName',
      serializers.serialize(object.senderName,
          specifiedType: const FullType(String)),
      'senderLink',
      serializers.serialize(object.senderLink,
          specifiedType: const FullType(String)),
      'quoteLink',
      serializers.serialize(object.quoteLink,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Quote deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new QuoteBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'quoteText':
          result.quoteText = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'quoteAuthor':
          result.quoteAuthor = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'senderName':
          result.senderName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'senderLink':
          result.senderLink = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'quoteLink':
          result.quoteLink = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Quote extends Quote {
  @override
  final String quoteText;
  @override
  final String quoteAuthor;
  @override
  final String senderName;
  @override
  final String senderLink;
  @override
  final String quoteLink;

  factory _$Quote([void Function(QuoteBuilder) updates]) =>
      (new QuoteBuilder()..update(updates)).build();

  _$Quote._(
      {this.quoteText,
      this.quoteAuthor,
      this.senderName,
      this.senderLink,
      this.quoteLink})
      : super._() {
    if (quoteText == null) {
      throw new BuiltValueNullFieldError('Quote', 'quoteText');
    }
    if (quoteAuthor == null) {
      throw new BuiltValueNullFieldError('Quote', 'quoteAuthor');
    }
    if (senderName == null) {
      throw new BuiltValueNullFieldError('Quote', 'senderName');
    }
    if (senderLink == null) {
      throw new BuiltValueNullFieldError('Quote', 'senderLink');
    }
    if (quoteLink == null) {
      throw new BuiltValueNullFieldError('Quote', 'quoteLink');
    }
  }

  @override
  Quote rebuild(void Function(QuoteBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  QuoteBuilder toBuilder() => new QuoteBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Quote &&
        quoteText == other.quoteText &&
        quoteAuthor == other.quoteAuthor &&
        senderName == other.senderName &&
        senderLink == other.senderLink &&
        quoteLink == other.quoteLink;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, quoteText.hashCode), quoteAuthor.hashCode),
                senderName.hashCode),
            senderLink.hashCode),
        quoteLink.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Quote')
          ..add('quoteText', quoteText)
          ..add('quoteAuthor', quoteAuthor)
          ..add('senderName', senderName)
          ..add('senderLink', senderLink)
          ..add('quoteLink', quoteLink))
        .toString();
  }
}

class QuoteBuilder implements Builder<Quote, QuoteBuilder> {
  _$Quote _$v;

  String _quoteText;
  String get quoteText => _$this._quoteText;
  set quoteText(String quoteText) => _$this._quoteText = quoteText;

  String _quoteAuthor;
  String get quoteAuthor => _$this._quoteAuthor;
  set quoteAuthor(String quoteAuthor) => _$this._quoteAuthor = quoteAuthor;

  String _senderName;
  String get senderName => _$this._senderName;
  set senderName(String senderName) => _$this._senderName = senderName;

  String _senderLink;
  String get senderLink => _$this._senderLink;
  set senderLink(String senderLink) => _$this._senderLink = senderLink;

  String _quoteLink;
  String get quoteLink => _$this._quoteLink;
  set quoteLink(String quoteLink) => _$this._quoteLink = quoteLink;

  QuoteBuilder();

  QuoteBuilder get _$this {
    if (_$v != null) {
      _quoteText = _$v.quoteText;
      _quoteAuthor = _$v.quoteAuthor;
      _senderName = _$v.senderName;
      _senderLink = _$v.senderLink;
      _quoteLink = _$v.quoteLink;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Quote other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Quote;
  }

  @override
  void update(void Function(QuoteBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Quote build() {
    final _$result = _$v ??
        new _$Quote._(
            quoteText: quoteText,
            quoteAuthor: quoteAuthor,
            senderName: senderName,
            senderLink: senderLink,
            quoteLink: quoteLink);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
