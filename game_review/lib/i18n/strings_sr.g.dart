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
	@override late final TranslationsNavigationSr navigation = TranslationsNavigationSr._(_root);
	@override String get NoGamesFound => 'Nema pronađenih igara';
	@override String get errorLoadingGames => 'Neuspešno učitavanje igara';
	@override String get errorLoadingMoreGames => 'Neuspešno učitavanje dodatnih igara';
	@override late final TranslationsErrorsSr errors = TranslationsErrorsSr._(_root);
	@override String get appFailedToStart => 'Aplikacija nije uspela da se pokrene:\n\n@{error}';
	@override late final TranslationsLibrarySr library = TranslationsLibrarySr._(_root);
	@override late final TranslationsGameServiceSr gameService = TranslationsGameServiceSr._(_root);
	@override late final TranslationsGameDetailsSr gameDetails = TranslationsGameDetailsSr._(_root);
	@override late final TranslationsBrandingSr branding = TranslationsBrandingSr._(_root);
	@override String get gameReview => 'Recenzija';
	@override String get addComment => 'Dodaj komentar';
	@override String get reviewsNotFound => 'Recenzije nisu pronađene';
	@override String get wouldRecommend => 'Preporučuje';
	@override String get wouldNotRecommend => 'Ne preporučuje';
	@override String get likes => 'Lajkovi';
	@override String get playingRecord => 'Sati igranja';
	@override late final TranslationsTimeSr time = TranslationsTimeSr._(_root);
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
}

// Path: navigation
class TranslationsNavigationSr extends TranslationsNavigationEn {
	TranslationsNavigationSr._(TranslationsSr root) : this._root = root, super.internal(root);

	final TranslationsSr _root; // ignore: unused_field

	// Translations
	@override String get home => 'Početna';
	@override String get search => 'Pretraživanje';
	@override String get library => 'Biblioteka';
	@override String get profile => 'Profil';
}

// Path: errors
class TranslationsErrorsSr extends TranslationsErrorsEn {
	TranslationsErrorsSr._(TranslationsSr root) : this._root = root, super.internal(root);

	final TranslationsSr _root; // ignore: unused_field

	// Translations
	@override String get invalidCredentials => 'Neispravni podaci za prijavu';
	@override String get loginFailed => 'Prijava neuspešna. Pokušajte ponovo.';
	@override String get failedToFetchRecentReviews => 'Učitavanje nedavnih recenzija nije uspelo.';
	@override String get failedToLoadHome => 'Učitavanje početnih podataka nije uspelo.';
	@override String get failedToLoadComments => 'Učitavanje komentara nije uspelo.';
	@override String get authenticationFail => 'Autentifikacija nije uspela.';
}

// Path: library
class TranslationsLibrarySr extends TranslationsLibraryEn {
	TranslationsLibrarySr._(TranslationsSr root) : this._root = root, super.internal(root);

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

// Path: gameService
class TranslationsGameServiceSr extends TranslationsGameServiceEn {
	TranslationsGameServiceSr._(TranslationsSr root) : this._root = root, super.internal(root);

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
class TranslationsGameDetailsSr extends TranslationsGameDetailsEn {
	TranslationsGameDetailsSr._(TranslationsSr root) : this._root = root, super.internal(root);

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
	@override String get loginFailed => 'Prijava nije uspela, pokušaj ponovo';
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

// Path: branding
class TranslationsBrandingSr extends TranslationsBrandingEn {
	TranslationsBrandingSr._(TranslationsSr root) : this._root = root, super.internal(root);

	final TranslationsSr _root; // ignore: unused_field

	// Translations
	@override String get title => 'PAW IGRE';
	@override String get tagline => 'Istraži. Oceni. Deli.';
	@override String get logoLabel => 'Logo aplikacije';
}

// Path: time
class TranslationsTimeSr extends TranslationsTimeEn {
	TranslationsTimeSr._(TranslationsSr root) : this._root = root, super.internal(root);

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
