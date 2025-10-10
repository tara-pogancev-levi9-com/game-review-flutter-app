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
	@override late final _TranslationsGameDetailsSr gameDetails = _TranslationsGameDetailsSr._(_root);
	@override late final _TranslationsReviewsSr reviews = _TranslationsReviewsSr._(_root);
	@override late final _TranslationsActionsSr actions = _TranslationsActionsSr._(_root);
	@override late final _TranslationsNavigationSr navigation = _TranslationsNavigationSr._(_root);
	@override String get NoGamesFound => 'Nema pronađenih igara';
	@override String get errorLoadingGames => 'Neuspešno učitavanje igara';
	@override String get errorLoadingMoreGames => 'Neuspešno učitavanje dodatnih igara';
	@override late final _TranslationsErrorsSr errors = _TranslationsErrorsSr._(_root);
	@override late final _TranslationsCommonSr common = _TranslationsCommonSr._(_root);
	@override late final _TranslationsBrandingSr branding = _TranslationsBrandingSr._(_root);
}

// Path: gameDetails
class _TranslationsGameDetailsSr implements TranslationsGameDetailsEn {
	_TranslationsGameDetailsSr._(this._root);

	final TranslationsSr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Detalji Igre';
	@override String get developer => 'Razvijač';
	@override String get publisher => 'Izdavač';
	@override String get released => 'Izdato';
	@override String get availableOn => 'Dostupno na';
	@override String get overallRecommendation => '{percentage}% igrača preporučuje ovu igru';
	@override String get addToWishlist => 'Dodaj u Listu Želja';
	@override String get removeFromWishlist => 'Ukloni iz Liste Želja';
	@override String get addToLibrary => 'Dodaj u Biblioteku';
	@override String get trackHours => 'Prati Sate';
	@override String get hoursPlayed => 'Sati Igranja';
	@override String get completionPercentage => 'Završeno %';
	@override String get lastPlayed => 'Poslednji Put Igrano';
	@override String get isFavorite => 'Omiljeno';
	@override String get reviewsCount => '{count} recenzija';
	@override String get wishlistCount => '{count} u listi želja';
	@override String get libraryCount => '{count} u biblioteci';
	@override String get noReviews => 'Još uvek nema recenzija';
	@override String get noGenres => 'Žanrovi nisu specificirani';
	@override String get noPlatforms => 'Platforme nisu specificirane';
	@override String get noDescription => 'Opis nije dostupan';
	@override String get noDeveloper => 'Razvijač nije specificiran';
	@override String get noPublisher => 'Izdavač nije specificiran';
	@override String get noReleaseDate => 'Datum izdavanja nije specificiran';
	@override String get statistics => 'Statistike';
	@override String get recentReviews => 'Nedavne recenzije';
	@override String get unknownUser => 'Nepoznat Korisnik';
	@override String get retry => 'Pokušaj ponovo';
	@override String get reviewComingSoon => 'Funkcionalnost recenzija uskoro!';
	@override String get shareComingSoon => 'Funkcionalnost deljenja uskoro!';
	@override String get addedToWishlist => 'Dodato u listu želja!';
	@override String get removedFromWishlist => 'Uklonjeno iz liste želja!';
	@override String get addedToLibrary => 'Dodato u biblioteku!';
	@override String get removedFromLibrary => 'Uklonjeno iz biblioteke!';
	@override String get alreadyInLibrary => 'Već je u biblioteci!';
	@override String get alreadyInWishlist => 'Već je u listi želja!';
	@override String get loginRequiredWishlist => 'Molimo prijavite se da biste dodali igre u listu želja';
	@override String get loginRequiredLibrary => 'Molimo prijavite se da biste dodali igre u biblioteku';
	@override String get loginRequiredToView => 'Molimo prijavite se da biste videli detalje igre';
}

// Path: reviews
class _TranslationsReviewsSr implements TranslationsReviewsEn {
	_TranslationsReviewsSr._(this._root);

	final TranslationsSr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Recenzije';
	@override String get addComment => 'Dodaj Komentar';
	@override String get like => 'Sviđa mi se';
	@override String get unlike => 'Ne sviđa mi se';
	@override String get reply => 'Odgovori';
	@override String get showMore => 'Prikaži Više';
	@override String get showLess => 'Prikaži Manje';
	@override String get hoursAgo => 'pre {hours}h';
	@override String get daysAgo => 'pre {days}d';
	@override String get weeksAgo => 'pre {weeks}n';
	@override String get monthsAgo => 'pre {months}mes';
	@override String get yearsAgo => 'pre {years}g';
	@override String get justNow => 'Upravo sada';
	@override String get playtimeHours => 'Vreme igranja: {hours} sati';
	@override String get completionStatus => 'Status: {status}';
	@override String get recommended => 'Preporučeno';
	@override String get notRecommended => 'Nije Preporučeno';
}

// Path: actions
class _TranslationsActionsSr implements TranslationsActionsEn {
	_TranslationsActionsSr._(this._root);

	final TranslationsSr _root; // ignore: unused_field

	// Translations
	@override String get addToWishlist => 'Dodaj u Listu Želja';
	@override String get removeFromWishlist => 'Ukloni iz Liste Želja';
	@override String get addToLibrary => 'Dodaj u Biblioteku';
	@override String get removeFromLibrary => 'Ukloni iz Biblioteke';
	@override String get markAsFavorite => 'Označi kao Omiljeno';
	@override String get removeFromFavorites => 'Ukloni iz Omiljenih';
	@override String get trackProgress => 'Prati Napredak';
	@override String get writeReview => 'Napiši Recenziju';
	@override String get shareGame => 'Podeli Igru';
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
	@override String get failedToFetchGame => 'Neuspešno učitavanje igre';
	@override String get failedToFetchGames => 'Neuspešno učitavanje igara';
	@override String get failedToFetchGameStatistics => 'Neuspešno učitavanje statistika igre';
	@override String get failedToFetchRecentReviews => 'Neuspešno učitavanje nedavnih recenzija';
	@override String get failedToAddToWishlist => 'Neuspešno dodavanje u listu želja';
	@override String get failedToRemoveFromWishlist => 'Neuspešno uklanjanje iz liste želja';
	@override String get failedToAddToLibrary => 'Neuspešno dodavanje u biblioteku';
	@override String get failedToRemoveFromLibrary => 'Neuspešno uklanjanje iz biblioteke';
	@override String get failedToUpdateGameProgress => 'Neuspešno ažuriranje napretka igre';
	@override String get failedToFetchGameReviews => 'Neuspešno učitavanje recenzija igre';
	@override String get failedToFetchReviewComments => 'Neuspešno učitavanje komentara recenzije';
	@override String get failedToCreateReview => 'Neuspešno kreiranje recenzije';
	@override String get failedToAddComment => 'Neuspešno dodavanje komentara';
	@override String get failedToLikeReview => 'Neuspešno lajkovanje recenzije';
	@override String get failedToUnlikeReview => 'Neuspešno uklanjanje lajka recenzije';
	@override String get userNotAuthenticated => 'Korisnik nije autentifikovan';
	@override String get registrationEmailExistsError => 'Nalog sa ovim email-om već postoji';
	@override String get passwordLength => 'Lozinka mora imati minimum 8 karaktera';
	@override String get confirmPassword => 'Molimo potvrdite vašu lozinku';
	@override String get passwordMismatch => 'Lozinke se ne podudaraju';
}

// Path: common
class _TranslationsCommonSr implements TranslationsCommonEn {
	_TranslationsCommonSr._(this._root);

	final TranslationsSr _root; // ignore: unused_field

	// Translations
	@override String get goBack => 'Nazad';
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
			case 'gameDetails.title': return 'Detalji Igre';
			case 'gameDetails.developer': return 'Razvijač';
			case 'gameDetails.publisher': return 'Izdavač';
			case 'gameDetails.released': return 'Izdato';
			case 'gameDetails.availableOn': return 'Dostupno na';
			case 'gameDetails.overallRecommendation': return '{percentage}% igrača preporučuje ovu igru';
			case 'gameDetails.addToWishlist': return 'Dodaj u Listu Želja';
			case 'gameDetails.removeFromWishlist': return 'Ukloni iz Liste Želja';
			case 'gameDetails.addToLibrary': return 'Dodaj u Biblioteku';
			case 'gameDetails.trackHours': return 'Prati Sate';
			case 'gameDetails.hoursPlayed': return 'Sati Igranja';
			case 'gameDetails.completionPercentage': return 'Završeno %';
			case 'gameDetails.lastPlayed': return 'Poslednji Put Igrano';
			case 'gameDetails.isFavorite': return 'Omiljeno';
			case 'gameDetails.reviewsCount': return '{count} recenzija';
			case 'gameDetails.wishlistCount': return '{count} u listi želja';
			case 'gameDetails.libraryCount': return '{count} u biblioteci';
			case 'gameDetails.noReviews': return 'Još uvek nema recenzija';
			case 'gameDetails.noGenres': return 'Žanrovi nisu specificirani';
			case 'gameDetails.noPlatforms': return 'Platforme nisu specificirane';
			case 'gameDetails.noDescription': return 'Opis nije dostupan';
			case 'gameDetails.noDeveloper': return 'Razvijač nije specificiran';
			case 'gameDetails.noPublisher': return 'Izdavač nije specificiran';
			case 'gameDetails.noReleaseDate': return 'Datum izdavanja nije specificiran';
			case 'gameDetails.statistics': return 'Statistike';
			case 'gameDetails.recentReviews': return 'Nedavne recenzije';
			case 'gameDetails.unknownUser': return 'Nepoznat Korisnik';
			case 'gameDetails.retry': return 'Pokušaj ponovo';
			case 'gameDetails.reviewComingSoon': return 'Funkcionalnost recenzija uskoro!';
			case 'gameDetails.shareComingSoon': return 'Funkcionalnost deljenja uskoro!';
			case 'gameDetails.addedToWishlist': return 'Dodato u listu želja!';
			case 'gameDetails.removedFromWishlist': return 'Uklonjeno iz liste želja!';
			case 'gameDetails.addedToLibrary': return 'Dodato u biblioteku!';
			case 'gameDetails.removedFromLibrary': return 'Uklonjeno iz biblioteke!';
			case 'gameDetails.alreadyInLibrary': return 'Već je u biblioteci!';
			case 'gameDetails.alreadyInWishlist': return 'Već je u listi želja!';
			case 'gameDetails.loginRequiredWishlist': return 'Molimo prijavite se da biste dodali igre u listu želja';
			case 'gameDetails.loginRequiredLibrary': return 'Molimo prijavite se da biste dodali igre u biblioteku';
			case 'gameDetails.loginRequiredToView': return 'Molimo prijavite se da biste videli detalje igre';
			case 'reviews.title': return 'Recenzije';
			case 'reviews.addComment': return 'Dodaj Komentar';
			case 'reviews.like': return 'Sviđa mi se';
			case 'reviews.unlike': return 'Ne sviđa mi se';
			case 'reviews.reply': return 'Odgovori';
			case 'reviews.showMore': return 'Prikaži Više';
			case 'reviews.showLess': return 'Prikaži Manje';
			case 'reviews.hoursAgo': return 'pre {hours}h';
			case 'reviews.daysAgo': return 'pre {days}d';
			case 'reviews.weeksAgo': return 'pre {weeks}n';
			case 'reviews.monthsAgo': return 'pre {months}mes';
			case 'reviews.yearsAgo': return 'pre {years}g';
			case 'reviews.justNow': return 'Upravo sada';
			case 'reviews.playtimeHours': return 'Vreme igranja: {hours} sati';
			case 'reviews.completionStatus': return 'Status: {status}';
			case 'reviews.recommended': return 'Preporučeno';
			case 'reviews.notRecommended': return 'Nije Preporučeno';
			case 'actions.addToWishlist': return 'Dodaj u Listu Želja';
			case 'actions.removeFromWishlist': return 'Ukloni iz Liste Želja';
			case 'actions.addToLibrary': return 'Dodaj u Biblioteku';
			case 'actions.removeFromLibrary': return 'Ukloni iz Biblioteke';
			case 'actions.markAsFavorite': return 'Označi kao Omiljeno';
			case 'actions.removeFromFavorites': return 'Ukloni iz Omiljenih';
			case 'actions.trackProgress': return 'Prati Napredak';
			case 'actions.writeReview': return 'Napiši Recenziju';
			case 'actions.shareGame': return 'Podeli Igru';
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
			case 'errors.failedToFetchGame': return 'Neuspešno učitavanje igre';
			case 'errors.failedToFetchGames': return 'Neuspešno učitavanje igara';
			case 'errors.failedToFetchGameStatistics': return 'Neuspešno učitavanje statistika igre';
			case 'errors.failedToFetchRecentReviews': return 'Neuspešno učitavanje nedavnih recenzija';
			case 'errors.failedToAddToWishlist': return 'Neuspešno dodavanje u listu želja';
			case 'errors.failedToRemoveFromWishlist': return 'Neuspešno uklanjanje iz liste želja';
			case 'errors.failedToAddToLibrary': return 'Neuspešno dodavanje u biblioteku';
			case 'errors.failedToRemoveFromLibrary': return 'Neuspešno uklanjanje iz biblioteke';
			case 'errors.failedToUpdateGameProgress': return 'Neuspešno ažuriranje napretka igre';
			case 'errors.failedToFetchGameReviews': return 'Neuspešno učitavanje recenzija igre';
			case 'errors.failedToFetchReviewComments': return 'Neuspešno učitavanje komentara recenzije';
			case 'errors.failedToCreateReview': return 'Neuspešno kreiranje recenzije';
			case 'errors.failedToAddComment': return 'Neuspešno dodavanje komentara';
			case 'errors.failedToLikeReview': return 'Neuspešno lajkovanje recenzije';
			case 'errors.failedToUnlikeReview': return 'Neuspešno uklanjanje lajka recenzije';
			case 'errors.userNotAuthenticated': return 'Korisnik nije autentifikovan';
			case 'errors.registrationEmailExistsError': return 'Nalog sa ovim email-om već postoji';
			case 'errors.passwordLength': return 'Lozinka mora imati minimum 8 karaktera';
			case 'errors.confirmPassword': return 'Molimo potvrdite vašu lozinku';
			case 'errors.passwordMismatch': return 'Lozinke se ne podudaraju';
			case 'common.goBack': return 'Nazad';
			case 'branding.title': return 'PAW IGRE';
			case 'branding.tagline': return 'Istraži. Oceni. Deli.';
			case 'branding.logoLabel': return 'Logo aplikacije';
			default: return null;
		}
	}
}

