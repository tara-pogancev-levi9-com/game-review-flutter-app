///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsSr extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsSr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.sr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <sr>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	late final TranslationsSr _root = this; // ignore: unused_field

	@override 
	TranslationsSr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsSr(meta: meta ?? this.$meta);

	// Translations
	@override String get welcome => 'Dobrodošao!';
	@override String get greeting => 'Zdravo, {name}!';
	@override String get changeLanguage => 'Promeni jezik';
	@override String get appTitle => 'Aplikacija za Recenzije Igara';
	@override String get home => 'Početna';
	@override String get settings => 'Podešavanja';
	@override String get searchGames => 'Pretraži igre';
	@override String get favoriteGames => 'Omiljene Igre';
	@override String get recentReviews => 'Nedavne Recenzije';
	@override String get addReview => 'Dodaj Recenziju';
	@override String get myProfile => 'Moj Profil';
	@override String get logout => 'Odjavi se';
	@override String get login => 'Prijava';
	@override String get goodbye => 'Doviđenja!';
	@override String get king => 'Kralj';
	@override String get register => 'Registruj se';
	@override String get email => 'Email';
	@override String get password => 'Lozinka';
	@override String get confirmPassword => 'Potvrdi Lozinku';
	@override String get submit => 'Pošalji';
	@override String get username => 'Korisničko Ime';
	@override String get profileSettings => 'Podešavanja Profila';
	@override String get notifications => 'Obaveštenja';
	@override String get back => 'Nazad';
	@override String get next => 'Dalje';
	@override String get dicsover => 'Istraži';
	@override String get details => 'Detalji';
	@override String get ratings => 'Ocene';
	@override String get evaluation => 'Evaluacija';
	@override String get overall => 'Sveukupno';
	@override String get gameplay => 'Igra';
	@override String get graphics => 'Grafika';
	@override String get sound => 'Zvuk';
	@override String get story => 'Priča';
	@override String get value => 'Vrednost';
	@override String get pros => 'Prednosti';
	@override String get cons => 'Nedostaci';
	@override String get media => 'Mediji';
	@override String get discussions => 'Diskusije';
	@override String get save => 'Sačuvaj';
	@override String get edit => 'Izmeni';
	@override String get delete => 'Obriši';
	@override String get update => 'Ažuriraj';
	@override String get registrationError => 'Greška, Pokušajte ponovo kasnije.';
	@override String get passwordMismatch => 'Lozinke se ne podudaraju!.';
	@override String get passwordLength => 'Lozinka mora imati minimum 8 karaktera!.';
	@override String get emailInvalid => 'Email adresa nije validna!.';
	@override String get registrationSuccessful => 'Registracija uspešna.';
}
