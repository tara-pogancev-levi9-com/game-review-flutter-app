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
	@override String get missingApiUrl => 'Nedostaje API_URL promenljiva';
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
	@override String get appFailedToStart => 'Aplikacija nije uspela da se pokrene:\n\n@{error}';
	@override late final _TranslationsLibrarySr library = _TranslationsLibrarySr._(_root);
	@override late final _TranslationsBrandingSr branding = _TranslationsBrandingSr._(_root);
	@override String get youHaveAlreadyReviewedThisGame => 'Već ste ocenili ovu igru';
	@override String get completed => 'Završeno';
	@override String get notStarted => 'Nije započeto';
	@override String get inProgress => 'U toku';
	@override String get abandoned => 'Napusteno';
	@override String get failedToSaveReview => 'Nije uspelo da se sačuva recenzija';
	@override String get reviewAddedSuccessfully => 'Ocena je uspešno dodata!';
	@override String get reviewTitle => 'Naslov ocene *';
	@override String get reviewTitleIsRequired => 'Naslov ocene je obavezan';
	@override String get reviewDescription => 'Opis ocene *';
	@override String get reviewDescriptionIsRequired => 'Opis ocene je obavezan';
	@override String get prosCons => 'Prednosti i mane';
	@override String get gamePros => 'Prednosti igre (odvojene zarezima)';
	@override String get gameCons => 'Mane igre (odvojene zarezima)';
	@override String get overallRating => 'Ukupna ocena *';
	@override String get individualRatings => 'Individualne ocene';
	@override String get miscellaneous => 'Razno';
	@override String get gameCompletion => 'Završetak igre (%)';
	@override String get completionStatus => 'Status završetka';
	@override String get inGameHours => 'Časovi u igri';
	@override String get pleaseEnterAValidNumber => 'Molimo unesite validan broj';
	@override String get iRecommendThisGame => 'Preporučujem ovu igru *';
	@override String get selectAGameFromYourLibrary => 'Izaberite igru iz vaše biblioteke...';
	@override String get completed100 => 'Završeno (100%)';
	@override String get notStarted0 => 'Nije započeto (0%)';
	@override late final _TranslationsGameServiceSr gameService = _TranslationsGameServiceSr._(_root);
	@override late final _TranslationsGameDetailsSr gameDetails = _TranslationsGameDetailsSr._(_root);
	@override String get gameReview => 'Recenzija';
	@override String get addComment => 'Dodaj komentar';
	@override String get reviewsNotFound => 'Recenzije nisu pronađene';
	@override String get wouldRecommend => 'Preporučuje';
	@override String get wouldNotRecommend => 'Ne preporučuje';
	@override String get likes => 'Lajkovi';
	@override String get playingRecord => 'Sati igranja';
	@override late final _TranslationsTimeSr time = _TranslationsTimeSr._(_root);
	@override String get gamesSection => 'Igre';
	@override String get reviewsSection => 'Recenzije';
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
	@override String get invalidCredentials => 'Neispravni podaci za prijavu';
	@override String get loginFailed => 'Prijava neuspešna. Pokušajte ponovo.';
	@override String get requiredField => '{field} je obavezan';
	@override String get invalidEmail => 'Nevažeća email adresa';
	@override String get minLength => 'Minimalno {n} karaktera';
	@override String get appFailedToStart => 'Aplikacija nije mogla da se pokrene. Molimo ponovo pokrenite i pokušajte ponovo.';
	@override String get gameNotFound => 'Igra nije pronađena';
	@override String get reviewsNotFound => 'Recenzije nisu pronađene';
	@override String get failedToFetchRecentReviews => 'Učitavanje nedavnih recenzija nije uspelo.';
	@override String get failedToLoadHome => 'Učitavanje početnih podataka nije uspelo.';
	@override String get failedToLoadComments => 'Učitavanje komentara nije uspelo.';
	@override String get authenticationFail => 'Autentifikacija nije uspela.';
	@override String get failedToProcessReview => 'Nije moglo da se obrade recenzija';
	@override String get unexpectedResponseFormat => 'Neočekivani format odgovora sa servera';
	@override String get genericError => 'Došlo je do greške. Molimo pokušajte ponovo.';
	@override String get failedToAddReview => 'Nije moglo da se doda recenzija';
	@override String get failedToUpdateReview => 'Nije moglo da se ažurira recenzija';
	@override String get failedToDeleteReview => 'Nije moglo da se obriše recenzija';
}

// Path: library
class _TranslationsLibrarySr implements TranslationsLibraryEn {
	_TranslationsLibrarySr._(this._root);

	final TranslationsSr _root; // ignore: unused_field

	// Translations
	@override String get latest => 'Najnovije';
	@override String get popular => 'Popularno';
	@override String get ownedGames => 'Moje igre';
	@override String get wishlist => 'Lista želja';
	@override String get myLibrary => 'Moja Biblioteka';
	@override String get gameAlreadyInWishlist => 'Igra je već na listi želja';
	@override String get gameAddedToWishlist => 'Igra je dodata na listu želja';
	@override String get failedToAddToWishlist => 'Dodavanje na listu želja nije uspelo';
	@override String get gameAlreadyInLibrary => 'Igra je već u biblioteci';
	@override String get gameAddedToLibrary => 'Igra je dodata u biblioteku';
	@override String get failedToAddToLibrary => 'Dodavanje u biblioteku nije uspelo';
	@override String get gameNotFoundInWishlist => 'Igra nije pronađena na listi želja';
	@override String get gameNotFoundInLibrary => 'Igra nije pronađena u biblioteci';
	@override String get wishlistAdditionFailed => 'Dodavanje na listu želja nije uspelo';
	@override String get libraryAdditionFailed => 'Dodavanje u biblioteku nije uspelo';
	@override String get failedToFetchGames => 'Učitavanje igara nije uspelo';
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

// Path: gameService
class _TranslationsGameServiceSr implements TranslationsGameServiceEn {
	_TranslationsGameServiceSr._(this._root);

	final TranslationsSr _root; // ignore: unused_field

	// Translations
	@override String get noTokenWishlist => 'Nije moguće dodati na listu želja - token nije pronađen';
	@override String get noTokenLibrary => 'Nije moguće dodati u biblioteku - token nije pronađen';
	@override String get noTokenFetchWishlist => 'Nije moguće učitati listu želja - token nije pronađen';
	@override String get noTokenFetchLibrary => 'Nije moguće učitati biblioteku - token nije pronađen';
	@override String get noTokenRemoveWishlist => 'Nije moguće ukloniti sa liste želja - token nije pronađen';
	@override String get noTokenRemoveLibrary => 'Nije moguće ukloniti iz biblioteke - token nije pronađen';
	@override String get gameAddedToWishlistSuccess => 'Igra je uspešno dodata na listu želja';
	@override String get gameAddedToLibrarySuccess => 'Igra je uspešno dodata u biblioteku';
	@override String get failedToAddToWishlistStatus => 'Dodavanje na listu želja nije uspelo';
	@override String get failedToAddToLibraryStatus => 'Dodavanje u biblioteku nije uspelo';
	@override String get failedToFetchLatestGames => 'Učitavanje najnovijih igara nije uspelo';
	@override String get failedToFetchPopularGames => 'Učitavanje popularnih igara nije uspelo';
	@override String get failedToAddGameToWishlist => 'Dodavanje igre na listu želja nije uspelo';
	@override String get failedToAddGameToLibrary => 'Dodavanje igre u biblioteku nije uspelo';
	@override String get failedToFetchWishlistGames => 'Učitavanje igara sa liste želja nije uspelo';
	@override String get failedToFetchLibraryGames => 'Učitavanje igara iz biblioteke nije uspelo';
	@override String get removedFromWishlist => 'Uklonjeno sa liste želja na serveru';
	@override String get removedFromLibrary => 'Uklonjeno iz biblioteke na serveru';
	@override String get failedToRemoveFromWishlist => 'Uklanjanje sa liste želja nije uspelo';
	@override String get failedToRemoveFromLibrary => 'Uklanjanje iz biblioteke nije uspelo';
}

// Path: gameDetails
class _TranslationsGameDetailsSr implements TranslationsGameDetailsEn {
	_TranslationsGameDetailsSr._(this._root);

	final TranslationsSr _root; // ignore: unused_field

	// Translations
	@override String get addedToWishlist => 'Dodato na listu želja';
	@override String get gameAlreadyInWishlist => 'Igra je već na listi želja';
	@override String get failedToAddToWishlist => 'Dodavanje na listu želja nije uspelo';
	@override String get addedToLibrary => 'Dodato u moju biblioteku';
	@override String get gameAlreadyInLibrary => 'Igra je već u biblioteci';
	@override String get failedToAddToLibrary => 'Dodavanje u biblioteku nije uspelo';
	@override String get removedFromWishlist => 'Uklonjeno sa liste želja';
	@override String get failedToRemoveFromWishlist => 'Uklanjanje sa liste želja nije uspelo';
	@override String get removedFromLibrary => 'Uklonjeno iz biblioteke';
	@override String get failedToRemoveFromLibrary => 'Uklanjanje iz biblioteke nije uspelo';
	@override String get addReviewComingSoon => 'Funkcija dodavanja recenzije uskoro stiže!';
	@override String get addToWishlist => 'Dodaj na listu želja';
	@override String get addToMyLibrary => 'Dodaj u moju biblioteku';
	@override String get removeFromWishlist => 'Ukloni sa liste želja';
	@override String get removeFromMyLibrary => 'Ukloni iz moje biblioteke';
	@override String get addReview => 'Dodaj recenziju';
	@override String get recommendText => 'x% igrača preporučuje ovu igru';
	@override String get overall => 'Sveukupno';
	@override String get details => 'Detalji';
	@override String get developer => 'Programer';
	@override String get publisher => 'Izdavač';
	@override String get released => 'Objavljeno';
	@override String get availableOn => 'Dostupno na';
	@override String get recentReviews => 'Nedavne recenzije';
	@override String get requiredField => '{field} je obavezno';
	@override String get invalidEmail => 'Neispravan email';
	@override String get minLength => 'Minimum {n} karaktera';
	@override String get invalidCredentials => 'Neispravni podaci za prijavu';
	@override String get appFailedToStart => 'Aplikacija nije uspela da se pokrene. Ponovo pokreni i pokušaj opet.';
	@override String get gameNotFound => 'Igra nije pronađena';
	@override String get reviewsNotFound => 'Recenzije nisu pronađene';
	@override String get failedToProcessReview => 'Nije uspelo da se obradi recenzija';
	@override String get unexpectedResponseFormat => 'Neočekivani format odgovora sa servera';
	@override String get genericError => 'Došlo je do greške. Molimo pokušajte ponovo.';
	@override String get failedToAddReview => 'Nije uspelo da se doda recenzija';
	@override String get failedToUpdateReview => 'Nije uspelo da se ažurira recenzija';
	@override String get failedToDeleteReview => 'Nije uspelo da se obriše recenzija';
}

// Path: time
class _TranslationsTimeSr implements TranslationsTimeEn {
	_TranslationsTimeSr._(this._root);

	final TranslationsSr _root; // ignore: unused_field

	// Translations
	@override String get secondsAgo => 'sekund/a';
	@override String get minutesAgo => 'minut/a';
	@override String get hoursAgo => 'sat/a';
	@override String get daysAgo => 'dan/a';
	@override String get weeksAgo => 'nedelj/a';
	@override String get monthsAgo => 'mesec/a';
	@override String get yearsAgo => 'godina/a';
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
			case 'missingApiUrl': return 'Nedostaje API_URL promenljiva';
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
			case 'errors.invalidCredentials': return 'Neispravni podaci za prijavu';
			case 'errors.loginFailed': return 'Prijava neuspešna. Pokušajte ponovo.';
			case 'errors.requiredField': return '{field} je obavezan';
			case 'errors.invalidEmail': return 'Nevažeća email adresa';
			case 'errors.minLength': return 'Minimalno {n} karaktera';
			case 'errors.appFailedToStart': return 'Aplikacija nije mogla da se pokrene. Molimo ponovo pokrenite i pokušajte ponovo.';
			case 'errors.gameNotFound': return 'Igra nije pronađena';
			case 'errors.reviewsNotFound': return 'Recenzije nisu pronađene';
			case 'errors.failedToFetchRecentReviews': return 'Učitavanje nedavnih recenzija nije uspelo.';
			case 'errors.failedToLoadHome': return 'Učitavanje početnih podataka nije uspelo.';
			case 'errors.failedToLoadComments': return 'Učitavanje komentara nije uspelo.';
			case 'errors.authenticationFail': return 'Autentifikacija nije uspela.';
			case 'errors.failedToProcessReview': return 'Nije moglo da se obrade recenzija';
			case 'errors.unexpectedResponseFormat': return 'Neočekivani format odgovora sa servera';
			case 'errors.genericError': return 'Došlo je do greške. Molimo pokušajte ponovo.';
			case 'errors.failedToAddReview': return 'Nije moglo da se doda recenzija';
			case 'errors.failedToUpdateReview': return 'Nije moglo da se ažurira recenzija';
			case 'errors.failedToDeleteReview': return 'Nije moglo da se obriše recenzija';
			case 'appFailedToStart': return 'Aplikacija nije uspela da se pokrene:\n\n@{error}';
			case 'library.latest': return 'Najnovije';
			case 'library.popular': return 'Popularno';
			case 'library.ownedGames': return 'Moje igre';
			case 'library.wishlist': return 'Lista želja';
			case 'library.myLibrary': return 'Moja Biblioteka';
			case 'library.gameAlreadyInWishlist': return 'Igra je već na listi želja';
			case 'library.gameAddedToWishlist': return 'Igra je dodata na listu želja';
			case 'library.failedToAddToWishlist': return 'Dodavanje na listu želja nije uspelo';
			case 'library.gameAlreadyInLibrary': return 'Igra je već u biblioteci';
			case 'library.gameAddedToLibrary': return 'Igra je dodata u biblioteku';
			case 'library.failedToAddToLibrary': return 'Dodavanje u biblioteku nije uspelo';
			case 'library.gameNotFoundInWishlist': return 'Igra nije pronađena na listi želja';
			case 'library.gameNotFoundInLibrary': return 'Igra nije pronađena u biblioteci';
			case 'library.wishlistAdditionFailed': return 'Dodavanje na listu želja nije uspelo';
			case 'library.libraryAdditionFailed': return 'Dodavanje u biblioteku nije uspelo';
			case 'library.failedToFetchGames': return 'Učitavanje igara nije uspelo';
			case 'branding.title': return 'PAW IGRE';
			case 'branding.tagline': return 'Istraži. Oceni. Deli.';
			case 'branding.logoLabel': return 'Logo aplikacije';
			case 'youHaveAlreadyReviewedThisGame': return 'Već ste ocenili ovu igru';
			case 'completed': return 'Završeno';
			case 'notStarted': return 'Nije započeto';
			case 'inProgress': return 'U toku';
			case 'abandoned': return 'Napusteno';
			case 'failedToSaveReview': return 'Nije uspelo da se sačuva recenzija';
			case 'reviewAddedSuccessfully': return 'Ocena je uspešno dodata!';
			case 'reviewTitle': return 'Naslov ocene *';
			case 'reviewTitleIsRequired': return 'Naslov ocene je obavezan';
			case 'reviewDescription': return 'Opis ocene *';
			case 'reviewDescriptionIsRequired': return 'Opis ocene je obavezan';
			case 'prosCons': return 'Prednosti i mane';
			case 'gamePros': return 'Prednosti igre (odvojene zarezima)';
			case 'gameCons': return 'Mane igre (odvojene zarezima)';
			case 'overallRating': return 'Ukupna ocena *';
			case 'individualRatings': return 'Individualne ocene';
			case 'miscellaneous': return 'Razno';
			case 'gameCompletion': return 'Završetak igre (%)';
			case 'completionStatus': return 'Status završetka';
			case 'inGameHours': return 'Časovi u igri';
			case 'pleaseEnterAValidNumber': return 'Molimo unesite validan broj';
			case 'iRecommendThisGame': return 'Preporučujem ovu igru *';
			case 'selectAGameFromYourLibrary': return 'Izaberite igru iz vaše biblioteke...';
			case 'completed100': return 'Završeno (100%)';
			case 'notStarted0': return 'Nije započeto (0%)';
			case 'gameService.noTokenWishlist': return 'Nije moguće dodati na listu želja - token nije pronađen';
			case 'gameService.noTokenLibrary': return 'Nije moguće dodati u biblioteku - token nije pronađen';
			case 'gameService.noTokenFetchWishlist': return 'Nije moguće učitati listu želja - token nije pronađen';
			case 'gameService.noTokenFetchLibrary': return 'Nije moguće učitati biblioteku - token nije pronađen';
			case 'gameService.noTokenRemoveWishlist': return 'Nije moguće ukloniti sa liste želja - token nije pronađen';
			case 'gameService.noTokenRemoveLibrary': return 'Nije moguće ukloniti iz biblioteke - token nije pronađen';
			case 'gameService.gameAddedToWishlistSuccess': return 'Igra je uspešno dodata na listu želja';
			case 'gameService.gameAddedToLibrarySuccess': return 'Igra je uspešno dodata u biblioteku';
			case 'gameService.failedToAddToWishlistStatus': return 'Dodavanje na listu želja nije uspelo';
			case 'gameService.failedToAddToLibraryStatus': return 'Dodavanje u biblioteku nije uspelo';
			case 'gameService.failedToFetchLatestGames': return 'Učitavanje najnovijih igara nije uspelo';
			case 'gameService.failedToFetchPopularGames': return 'Učitavanje popularnih igara nije uspelo';
			case 'gameService.failedToAddGameToWishlist': return 'Dodavanje igre na listu želja nije uspelo';
			case 'gameService.failedToAddGameToLibrary': return 'Dodavanje igre u biblioteku nije uspelo';
			case 'gameService.failedToFetchWishlistGames': return 'Učitavanje igara sa liste želja nije uspelo';
			case 'gameService.failedToFetchLibraryGames': return 'Učitavanje igara iz biblioteke nije uspelo';
			case 'gameService.removedFromWishlist': return 'Uklonjeno sa liste želja na serveru';
			case 'gameService.removedFromLibrary': return 'Uklonjeno iz biblioteke na serveru';
			case 'gameService.failedToRemoveFromWishlist': return 'Uklanjanje sa liste želja nije uspelo';
			case 'gameService.failedToRemoveFromLibrary': return 'Uklanjanje iz biblioteke nije uspelo';
			case 'gameDetails.addedToWishlist': return 'Dodato na listu želja';
			case 'gameDetails.gameAlreadyInWishlist': return 'Igra je već na listi želja';
			case 'gameDetails.failedToAddToWishlist': return 'Dodavanje na listu želja nije uspelo';
			case 'gameDetails.addedToLibrary': return 'Dodato u moju biblioteku';
			case 'gameDetails.gameAlreadyInLibrary': return 'Igra je već u biblioteci';
			case 'gameDetails.failedToAddToLibrary': return 'Dodavanje u biblioteku nije uspelo';
			case 'gameDetails.removedFromWishlist': return 'Uklonjeno sa liste želja';
			case 'gameDetails.failedToRemoveFromWishlist': return 'Uklanjanje sa liste želja nije uspelo';
			case 'gameDetails.removedFromLibrary': return 'Uklonjeno iz biblioteke';
			case 'gameDetails.failedToRemoveFromLibrary': return 'Uklanjanje iz biblioteke nije uspelo';
			case 'gameDetails.addReviewComingSoon': return 'Funkcija dodavanja recenzije uskoro stiže!';
			case 'gameDetails.addToWishlist': return 'Dodaj na listu želja';
			case 'gameDetails.addToMyLibrary': return 'Dodaj u moju biblioteku';
			case 'gameDetails.removeFromWishlist': return 'Ukloni sa liste želja';
			case 'gameDetails.removeFromMyLibrary': return 'Ukloni iz moje biblioteke';
			case 'gameDetails.addReview': return 'Dodaj recenziju';
			case 'gameDetails.recommendText': return 'x% igrača preporučuje ovu igru';
			case 'gameDetails.overall': return 'Sveukupno';
			case 'gameDetails.details': return 'Detalji';
			case 'gameDetails.developer': return 'Programer';
			case 'gameDetails.publisher': return 'Izdavač';
			case 'gameDetails.released': return 'Objavljeno';
			case 'gameDetails.availableOn': return 'Dostupno na';
			case 'gameDetails.recentReviews': return 'Nedavne recenzije';
			case 'gameDetails.requiredField': return '{field} je obavezno';
			case 'gameDetails.invalidEmail': return 'Neispravan email';
			case 'gameDetails.minLength': return 'Minimum {n} karaktera';
			case 'gameDetails.invalidCredentials': return 'Neispravni podaci za prijavu';
			case 'gameDetails.appFailedToStart': return 'Aplikacija nije uspela da se pokrene. Ponovo pokreni i pokušaj opet.';
			case 'gameDetails.gameNotFound': return 'Igra nije pronađena';
			case 'gameDetails.reviewsNotFound': return 'Recenzije nisu pronađene';
			case 'gameDetails.failedToProcessReview': return 'Nije uspelo da se obradi recenzija';
			case 'gameDetails.unexpectedResponseFormat': return 'Neočekivani format odgovora sa servera';
			case 'gameDetails.genericError': return 'Došlo je do greške. Molimo pokušajte ponovo.';
			case 'gameDetails.failedToAddReview': return 'Nije uspelo da se doda recenzija';
			case 'gameDetails.failedToUpdateReview': return 'Nije uspelo da se ažurira recenzija';
			case 'gameDetails.failedToDeleteReview': return 'Nije uspelo da se obriše recenzija';
			case 'gameReview': return 'Recenzija';
			case 'addComment': return 'Dodaj komentar';
			case 'reviewsNotFound': return 'Recenzije nisu pronađene';
			case 'wouldRecommend': return 'Preporučuje';
			case 'wouldNotRecommend': return 'Ne preporučuje';
			case 'likes': return 'Lajkovi';
			case 'playingRecord': return 'Sati igranja';
			case 'time.secondsAgo': return 'sekund/a';
			case 'time.minutesAgo': return 'minut/a';
			case 'time.hoursAgo': return 'sat/a';
			case 'time.daysAgo': return 'dan/a';
			case 'time.weeksAgo': return 'nedelj/a';
			case 'time.monthsAgo': return 'mesec/a';
			case 'time.yearsAgo': return 'godina/a';
			case 'gamesSection': return 'Igre';
			case 'reviewsSection': return 'Recenzije';
			default: return null;
		}
	}
}

