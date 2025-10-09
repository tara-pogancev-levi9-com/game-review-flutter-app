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
class TranslationsSr implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsSr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.sr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <sr>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

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
	@override String get discover => 'Istraži';
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
	@override String get registrationEmailExistsError => 'Navedeni email je registrovan!';
	@override late final _TranslationsNavigationSr navigation = _TranslationsNavigationSr._(_root);
	@override String get NoGamesFound => 'Nema pronađenih igara';
	@override String get errorLoadingGames => 'Neuspešno učitavanje igara';
	@override String get errorLoadingMoreGames => 'Neuspešno učitavanje dodatnih igara';
	@override late final _TranslationsErrorsSr errors = _TranslationsErrorsSr._(_root);
	@override late final _TranslationsBrandingSr branding = _TranslationsBrandingSr._(_root);
}

// Path: navigation
class _TranslationsNavigationSr implements TranslationsNavigationEn {
	_TranslationsNavigationSr._(this._root);

	final TranslationsSr _root; // ignore: unused_field

	// Translations
	@override String get home => 'Početna';
	@override String get search => 'Pretraživanje';
	@override String get library => 'Biblioteka';
	@override String get profile => 'Profil';
}

// Path: errors
class _TranslationsErrorsSr implements TranslationsErrorsEn {
	_TranslationsErrorsSr._(this._root);

	final TranslationsSr _root; // ignore: unused_field

	// Translations
	@override String get requiredField => '{field} je obavezno';
	@override String get invalidEmail => 'Neispravan email';
	@override String get minLength => 'Minimum {n} karaktera';
	@override String get invalidCredentials => 'Neispravni podaci za prijavu';
	@override String get loginFailed => 'Prijava nije uspela, pokušaj ponovo';
	@override String get appFailedToStart => 'Aplikacija nije uspela da se pokrene. Ponovo pokreni i pokušaj opet.';
	@override String get gameNotFound => 'Igra nije pronađena';
	@override String get reviewsNotFound => 'Recenzije nisu pronađene';
}

// Path: branding
class _TranslationsBrandingSr implements TranslationsBrandingEn {
	_TranslationsBrandingSr._(this._root);

	final TranslationsSr _root; // ignore: unused_field

	// Translations
	@override String get title => 'PAW IGRE';
	@override String get tagline => 'Istraži. Oceni. Deli.';
	@override String get logoLabel => 'Logo aplikacije';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsSr {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'welcome': return 'Dobrodošao!';
			case 'greeting': return 'Zdravo, {name}!';
			case 'changeLanguage': return 'Promeni jezik';
			case 'appTitle': return 'Aplikacija za Recenzije Igara';
			case 'home': return 'Početna';
			case 'settings': return 'Podešavanja';
			case 'searchGames': return 'Pretraži igre';
			case 'favoriteGames': return 'Omiljene Igre';
			case 'recentReviews': return 'Nedavne Recenzije';
			case 'addReview': return 'Dodaj Recenziju';
			case 'myProfile': return 'Moj Profil';
			case 'logout': return 'Odjavi se';
			case 'login': return 'Prijava';
			case 'goodbye': return 'Doviđenja!';
			case 'king': return 'Kralj';
			case 'register': return 'Registruj se';
			case 'email': return 'Email';
			case 'password': return 'Lozinka';
			case 'confirmPassword': return 'Potvrdi Lozinku';
			case 'submit': return 'Pošalji';
			case 'username': return 'Korisničko Ime';
			case 'profileSettings': return 'Podešavanja Profila';
			case 'notifications': return 'Obaveštenja';
			case 'back': return 'Nazad';
			case 'next': return 'Dalje';
			case 'discover': return 'Istraži';
			case 'details': return 'Detalji';
			case 'ratings': return 'Ocene';
			case 'evaluation': return 'Evaluacija';
			case 'overall': return 'Sveukupno';
			case 'gameplay': return 'Igra';
			case 'graphics': return 'Grafika';
			case 'sound': return 'Zvuk';
			case 'story': return 'Priča';
			case 'value': return 'Vrednost';
			case 'pros': return 'Prednosti';
			case 'cons': return 'Nedostaci';
			case 'media': return 'Mediji';
			case 'discussions': return 'Diskusije';
			case 'save': return 'Sačuvaj';
			case 'edit': return 'Izmeni';
			case 'delete': return 'Obriši';
			case 'update': return 'Ažuriraj';
			case 'registrationError': return 'Greška, Pokušajte ponovo kasnije.';
			case 'passwordMismatch': return 'Lozinke se ne podudaraju!.';
			case 'passwordLength': return 'Lozinka mora imati minimum 8 karaktera!.';
			case 'emailInvalid': return 'Email adresa nije validna!.';
			case 'registrationSuccessful': return 'Registracija uspešna.';
			case 'registrationEmailExistsError': return 'Navedeni email je registrovan!';
			case 'navigation.home': return 'Početna';
			case 'navigation.search': return 'Pretraživanje';
			case 'navigation.library': return 'Biblioteka';
			case 'navigation.profile': return 'Profil';
			case 'NoGamesFound': return 'Nema pronađenih igara';
			case 'errorLoadingGames': return 'Neuspešno učitavanje igara';
			case 'errorLoadingMoreGames': return 'Neuspešno učitavanje dodatnih igara';
			case 'errors.requiredField': return '{field} je obavezno';
			case 'errors.invalidEmail': return 'Neispravan email';
			case 'errors.minLength': return 'Minimum {n} karaktera';
			case 'errors.invalidCredentials': return 'Neispravni podaci za prijavu';
			case 'errors.loginFailed': return 'Prijava nije uspela, pokušaj ponovo';
			case 'errors.appFailedToStart': return 'Aplikacija nije uspela da se pokrene. Ponovo pokreni i pokušaj opet.';
			case 'errors.gameNotFound': return 'Igra nije pronađena';
			case 'errors.reviewsNotFound': return 'Recenzije nisu pronađene';
			case 'branding.title': return 'PAW IGRE';
			case 'branding.tagline': return 'Istraži. Oceni. Deli.';
			case 'branding.logoLabel': return 'Logo aplikacije';
			default: return null;
		}
	}
}

