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
	@override String get displayName => 'Prikazno ime';
	@override String get noImage => 'Nema Slike';
	@override String get saveImage => 'Sačuvaj Sliku ';
	@override String get changePassword => 'Promeni Lozinku';
	@override String get passwordChanged => 'Lozinka uspesno promenjena.';
	@override String get errorChangingPassword => 'Greska prilikom promene lozinke';
	@override String get userDataNotLoaded => 'Podatci korisnika nisu ucitani!';
	@override String get saveProfile => 'Sacuvaj profil';
	@override String get enterBio => 'Unesi biografiju';
	@override String get profileInfo => 'Informacije o profilu';
	@override String get profileSettings => 'Podešavanja Profila';
	@override String get notifications => 'Obaveštenja';
	@override String get addFriend => 'Dodaj prijatelja';
	@override String get friends => 'Prijatelji';
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
	@override String get avatarRemoved => 'Avatar uklonjen.';
	@override String get missingApiUrl => 'Nedostaje API_URL promenljiva';
	@override String get registrationError => 'Greška, Pokušajte ponovo kasnije.';
	@override String get passwordMismatch => 'Lozinke se ne podudaraju!.';
	@override String get passwordLength => 'Lozinka mora imati minimum 8 karaktera!.';
	@override String get addImages => 'Dodaj slike';
	@override String get noImagesSelected => 'Nema odabranih slika.';
	@override String get chooseImages => 'Odaberi slike.';
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
	@override String get appFailedToStart => 'Aplikacija nije uspela da se pokrene:\n\n@{error}';
	@override late final _TranslationsLibrarySr library = _TranslationsLibrarySr._(_root);
	@override late final _TranslationsCommonSr common = _TranslationsCommonSr._(_root);
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
	@override String get avatarUpdated => 'Avatar promenjen.';
	@override String get profileUpdated => 'Profil izmenjen.';
	@override String get gameReview => 'Recenzija';
	@override String get addComment => 'Dodaj komentar';
	@override String get reviewsNotFound => 'Recenzije nisu pronađene';
	@override String get wouldRecommend => 'Preporučio/la bih';
	@override String get wouldNotRecommend => 'Ne bih preporučio/la';
	@override String get likes => 'Lajkovi';
	@override String get playingRecord => 'h na rekordu';
	@override late final _TranslationsTimeSr time = _TranslationsTimeSr._(_root);
	@override late final _TranslationsDateTimeSr dateTime = _TranslationsDateTimeSr._(_root);
	@override String get gamesSection => 'Igre';
	@override String get reviewsSection => 'Recenzije';
	@override String get recommended => 'Preporučeno';
	@override String get swipeToSeeMore => 'Prevucite da vidite više';
	@override String get noResultsFound => 'Nema rezultata za "{{query}}"';
	@override String get retry => 'Pokušaj ponovo';
}

// Path: gameDetails
class _TranslationsGameDetailsSr implements TranslationsGameDetailsEn {
	_TranslationsGameDetailsSr._(this._root);

	final TranslationsSr _root; // ignore: unused_field

	// Translations
	@override String get gameAlreadyInWishlist => 'Igra je već na listi želja';
	@override String get failedToAddToWishlist => 'Dodavanje na listu želja nije uspelo';
	@override String get gameAlreadyInLibrary => 'Igra je već u biblioteci';
	@override String get failedToAddToLibrary => 'Dodavanje u biblioteku nije uspelo';
	@override String get failedToRemoveFromWishlist => 'Uklanjanje sa liste želja nije uspelo';
	@override String get failedToRemoveFromLibrary => 'Uklanjanje iz biblioteke nije uspelo';
	@override String get addReviewComingSoon => 'Funkcija dodavanja recenzije uskoro stiže!';
	@override String get addToMyLibrary => 'Dodaj u moju biblioteku';
	@override String get removeFromMyLibrary => 'Ukloni iz moje biblioteke';
	@override String get addReview => 'Dodaj recenziju';
	@override String get recommendText => 'x% igrača preporučuje ovu igru';
	@override String get overall => 'Sveukupno';
	@override String get details => 'Detalji';
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
	@override String get addedToWishlist => 'Dodato na listu želja';
	@override String get removedFromWishlist => 'Uklonjeno iz liste želja!';
	@override String get addedToLibrary => 'Dodato u biblioteku!';
	@override String get removedFromLibrary => 'Uklonjeno iz biblioteke!';
	@override String get alreadyInLibrary => 'Već je u biblioteci!';
	@override String get alreadyInWishlist => 'Već je u listi želja!';
	@override String get loginRequiredWishlist => 'Molimo prijavite se da biste dodali igre u listu želja';
	@override String get loginRequiredLibrary => 'Molimo prijavite se da biste dodali igre u biblioteku';
	@override String get loginRequiredToView => 'Molimo prijavite se da biste videli detalje igre';
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
	@override String get failedToFetchGame => 'Neuspešno učitavanje igre';
	@override String get failedToFetchGames => 'Neuspešno učitavanje igara';
	@override String get failedToFetchGameStatistics => 'Neuspešno učitavanje statistika igre';
	@override String get failedToFetchRecentReviews => 'Neuspešno učitavanje nedavnih recenzija';
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
	@override String get requiredField => '{field} je obavezan';
	@override String get invalidEmail => 'Nevalidna email adresa';
	@override String get minLength => 'Minimalno {n} karaktera';
	@override String get invalidCredentials => 'Neispravni podaci za prijavu';
	@override String get loginFailed => 'Prijava neuspešna. Pokušajte ponovo.';
	@override String get appFailedToStart => 'Aplikacija nije uspela da se pokrene. Molimo vas da ponovo pokrenete i pokušate ponovo.';
	@override String get gameNotFound => 'Igra nije pronađena';
	@override String get reviewsNotFound => 'Recenzije nisu pronađene';
	@override String get failedToFetchRecentReviews => 'Učitavanje nedavnih recenzija nije uspelo.';
	@override String get failedToLoadHome => 'Učitavanje početnih podataka nije uspelo.';
	@override String get failedToLoadComments => 'Učitavanje komentara nije uspelo.';
	@override String get authenticationFail => 'Autentifikacija nije uspela.';
	@override String get failedToProcessReview => 'Nije uspelo obrada recenzije';
	@override String get unexpectedResponseFormat => 'Neočekivani format odgovora sa servera';
	@override String get genericError => 'Došlo je do greške. Molimo pokušajte ponovo.';
	@override String get failedToAddReview => 'Nije uspelo dodavanje recenzije';
	@override String get failedToUpdateReview => 'Nije uspelo ažuriranje recenzije';
	@override String get failedToDeleteReview => 'Nije uspelo brisanje recenzije';
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
	@override String get gameAlreadyInLibrary => 'Igra je već u biblioteci';
	@override String get gameAddedToLibrary => 'Igra je dodata u biblioteku';
	@override String get gameNotFoundInWishlist => 'Igra nije pronađena na listi želja';
	@override String get gameNotFoundInLibrary => 'Igra nije pronađena u biblioteci';
	@override String get wishlistAdditionFailed => 'Dodavanje na listu želja nije uspelo';
	@override String get libraryAdditionFailed => 'Dodavanje u biblioteku nije uspelo';
	@override String get reviewsNotFound => 'Recenzije nisu pronađene';
	@override String get failedToFetchGame => 'Nije uspelo preuzimanje igre';
	@override String get failedToFetchGames => 'Učitavanje igara nije uspelo';
	@override String get failedToFetchGameStatistics => 'Nije uspelo preuzimanje statistike igre';
	@override String get failedToFetchRecentReviews => 'Nije uspelo preuzimanje nedavnih recenzija';
	@override String get failedToAddToWishlist => 'Dodavanje na listu želja nije uspelo';
	@override String get failedToRemoveFromWishlist => 'Nije uspelo uklanjanje sa liste želja';
	@override String get failedToAddToLibrary => 'Dodavanje u biblioteku nije uspelo';
	@override String get failedToRemoveFromLibrary => 'Nije uspelo uklanjanje iz biblioteke';
	@override String get failedToUpdateGameProgress => 'Nije uspelo ažuriranje napretka igre';
	@override String get failedToFetchGameReviews => 'Nije uspelo preuzimanje recenzija igre';
	@override String get failedToFetchReviewComments => 'Nije uspelo preuzimanje komentara na recenzije';
	@override String get failedToCreateReview => 'Nije uspelo kreiranje recenzije';
	@override String get failedToAddComment => 'Nije uspelo dodavanje komentara';
	@override String get failedToLikeReview => 'Nije uspelo lajkovanje recenzije';
	@override String get failedToUnlikeReview => 'Nije uspelo uklanjanje lajka sa recenzije';
	@override String get userNotAuthenticated => 'Korisnik nije autentifikovan';
	@override String get registrationEmailExistsError => 'Nalog sa ovom email adresom već postoji';
	@override String get passwordLength => 'Lozinka mora imati najmanje 8 karaktera';
	@override String get confirmPassword => 'Molimo potvrdite vašu lozinku';
	@override String get passwordMismatch => 'Lozinke se ne poklapaju';
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
	@override String get failedToRemoveFromWishlist => 'Neuspešno uklanjanje iz liste želja';
	@override String get failedToRemoveFromLibrary => 'Neuspešno uklanjanje iz biblioteke';
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
	@override String get failedToFetchGame => 'Neuspešno učitavanje igre';
	@override String get failedToFetchGames => 'Neuspešno učitavanje igara';
	@override String get failedToFetchGameStatistics => 'Neuspešno učitavanje statistika igre';
	@override String get failedToFetchRecentReviews => 'Neuspešno učitavanje nedavnih recenzija';
	@override String get failedToAddToWishlist => 'Neuspešno dodavanje u listu želja';
	@override String get failedToAddToLibrary => 'Neuspešno dodavanje u biblioteku';
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

// Path: time
class _TranslationsTimeSr implements TranslationsTimeEn {
	_TranslationsTimeSr._(this._root);

	final TranslationsSr _root; // ignore: unused_field

	// Translations
	@override String get secondsAgo => 'pre sekund/e';
	@override String get minutesAgo => 'pre minut/a';
	@override String get hoursAgo => 'pre sat/a';
	@override String get daysAgo => 'pre dan/a';
	@override String get weeksAgo => 'pre nedelj/a';
	@override String get monthsAgo => 'pre mesec/a';
	@override String get yearsAgo => 'pre godinu/dana';
}

// Path: dateTime
class _TranslationsDateTimeSr implements TranslationsDateTimeEn {
	_TranslationsDateTimeSr._(this._root);

	final TranslationsSr _root; // ignore: unused_field

	// Translations
	@override String get daysAgo => 'pre {days}d';
	@override String get hoursAgo => 'pre {hours}h';
	@override String get minutesAgo => 'pre {minutes}m';
	@override String get justNow => 'upravo sada';
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
			case 'displayName': return 'Prikazno ime';
			case 'noImage': return 'Nema Slike';
			case 'saveImage': return 'Sačuvaj Sliku ';
			case 'changePassword': return 'Promeni Lozinku';
			case 'passwordChanged': return 'Lozinka uspesno promenjena.';
			case 'errorChangingPassword': return 'Greska prilikom promene lozinke';
			case 'userDataNotLoaded': return 'Podatci korisnika nisu ucitani!';
			case 'saveProfile': return 'Sacuvaj profil';
			case 'enterBio': return 'Unesi biografiju';
			case 'profileInfo': return 'Informacije o profilu';
			case 'profileSettings': return 'Podešavanja Profila';
			case 'notifications': return 'Obaveštenja';
			case 'addFriend': return 'Dodaj prijatelja';
			case 'friends': return 'Prijatelji';
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
			case 'avatarRemoved': return 'Avatar uklonjen.';
			case 'missingApiUrl': return 'Nedostaje API_URL promenljiva';
			case 'registrationError': return 'Greška, Pokušajte ponovo kasnije.';
			case 'passwordMismatch': return 'Lozinke se ne podudaraju!.';
			case 'passwordLength': return 'Lozinka mora imati minimum 8 karaktera!.';
			case 'addImages': return 'Dodaj slike';
			case 'noImagesSelected': return 'Nema odabranih slika.';
			case 'chooseImages': return 'Odaberi slike.';
			case 'emailInvalid': return 'Email adresa nije validna!.';
			case 'registrationSuccessful': return 'Registracija uspešna.';
			case 'registrationEmailExistsError': return 'Navedeni email je registrovan!';
			case 'gameDetails.gameAlreadyInWishlist': return 'Igra je već na listi želja';
			case 'gameDetails.failedToAddToWishlist': return 'Dodavanje na listu želja nije uspelo';
			case 'gameDetails.gameAlreadyInLibrary': return 'Igra je već u biblioteci';
			case 'gameDetails.failedToAddToLibrary': return 'Dodavanje u biblioteku nije uspelo';
			case 'gameDetails.failedToRemoveFromWishlist': return 'Uklanjanje sa liste želja nije uspelo';
			case 'gameDetails.failedToRemoveFromLibrary': return 'Uklanjanje iz biblioteke nije uspelo';
			case 'gameDetails.addReviewComingSoon': return 'Funkcija dodavanja recenzije uskoro stiže!';
			case 'gameDetails.addToMyLibrary': return 'Dodaj u moju biblioteku';
			case 'gameDetails.removeFromMyLibrary': return 'Ukloni iz moje biblioteke';
			case 'gameDetails.addReview': return 'Dodaj recenziju';
			case 'gameDetails.recommendText': return 'x% igrača preporučuje ovu igru';
			case 'gameDetails.overall': return 'Sveukupno';
			case 'gameDetails.details': return 'Detalji';
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
			case 'gameDetails.addedToWishlist': return 'Dodato na listu želja';
			case 'gameDetails.removedFromWishlist': return 'Uklonjeno iz liste želja!';
			case 'gameDetails.addedToLibrary': return 'Dodato u biblioteku!';
			case 'gameDetails.removedFromLibrary': return 'Uklonjeno iz biblioteke!';
			case 'gameDetails.alreadyInLibrary': return 'Već je u biblioteci!';
			case 'gameDetails.alreadyInWishlist': return 'Već je u listi želja!';
			case 'gameDetails.loginRequiredWishlist': return 'Molimo prijavite se da biste dodali igre u listu želja';
			case 'gameDetails.loginRequiredLibrary': return 'Molimo prijavite se da biste dodali igre u biblioteku';
			case 'gameDetails.loginRequiredToView': return 'Molimo prijavite se da biste videli detalje igre';
			case 'gameDetails.requiredField': return '{field} je obavezno';
			case 'gameDetails.invalidEmail': return 'Neispravan email';
			case 'gameDetails.minLength': return 'Minimum {n} karaktera';
			case 'gameDetails.invalidCredentials': return 'Neispravni podaci za prijavu';
			case 'gameDetails.loginFailed': return 'Prijava nije uspela, pokušaj ponovo';
			case 'gameDetails.appFailedToStart': return 'Aplikacija nije uspela da se pokrene. Ponovo pokreni i pokušaj opet.';
			case 'gameDetails.gameNotFound': return 'Igra nije pronađena';
			case 'gameDetails.reviewsNotFound': return 'Recenzije nisu pronađene';
			case 'gameDetails.failedToProcessReview': return 'Nije uspelo da se obradi recenzija';
			case 'gameDetails.unexpectedResponseFormat': return 'Neočekivani format odgovora sa servera';
			case 'gameDetails.genericError': return 'Došlo je do greške. Molimo pokušajte ponovo.';
			case 'gameDetails.failedToAddReview': return 'Nije uspelo da se doda recenzija';
			case 'gameDetails.failedToUpdateReview': return 'Nije uspelo da se ažurira recenzija';
			case 'gameDetails.failedToDeleteReview': return 'Nije uspelo da se obriše recenzija';
			case 'gameDetails.failedToFetchGame': return 'Neuspešno učitavanje igre';
			case 'gameDetails.failedToFetchGames': return 'Neuspešno učitavanje igara';
			case 'gameDetails.failedToFetchGameStatistics': return 'Neuspešno učitavanje statistika igre';
			case 'gameDetails.failedToFetchRecentReviews': return 'Neuspešno učitavanje nedavnih recenzija';
			case 'gameDetails.failedToUpdateGameProgress': return 'Neuspešno ažuriranje napretka igre';
			case 'gameDetails.failedToFetchGameReviews': return 'Neuspešno učitavanje recenzija igre';
			case 'gameDetails.failedToFetchReviewComments': return 'Neuspešno učitavanje komentara recenzije';
			case 'gameDetails.failedToCreateReview': return 'Neuspešno kreiranje recenzije';
			case 'gameDetails.failedToAddComment': return 'Neuspešno dodavanje komentara';
			case 'gameDetails.failedToLikeReview': return 'Neuspešno lajkovanje recenzije';
			case 'gameDetails.failedToUnlikeReview': return 'Neuspešno uklanjanje lajka recenzije';
			case 'gameDetails.userNotAuthenticated': return 'Korisnik nije autentifikovan';
			case 'gameDetails.registrationEmailExistsError': return 'Nalog sa ovim email-om već postoji';
			case 'gameDetails.passwordLength': return 'Lozinka mora imati minimum 8 karaktera';
			case 'gameDetails.confirmPassword': return 'Molimo potvrdite vašu lozinku';
			case 'gameDetails.passwordMismatch': return 'Lozinke se ne podudaraju';
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
			case 'errors.requiredField': return '{field} je obavezan';
			case 'errors.invalidEmail': return 'Nevalidna email adresa';
			case 'errors.minLength': return 'Minimalno {n} karaktera';
			case 'errors.invalidCredentials': return 'Neispravni podaci za prijavu';
			case 'errors.loginFailed': return 'Prijava neuspešna. Pokušajte ponovo.';
			case 'errors.appFailedToStart': return 'Aplikacija nije uspela da se pokrene. Molimo vas da ponovo pokrenete i pokušate ponovo.';
			case 'errors.gameNotFound': return 'Igra nije pronađena';
			case 'errors.reviewsNotFound': return 'Recenzije nisu pronađene';
			case 'errors.failedToFetchRecentReviews': return 'Učitavanje nedavnih recenzija nije uspelo.';
			case 'errors.failedToLoadHome': return 'Učitavanje početnih podataka nije uspelo.';
			case 'errors.failedToLoadComments': return 'Učitavanje komentara nije uspelo.';
			case 'errors.authenticationFail': return 'Autentifikacija nije uspela.';
			case 'errors.failedToProcessReview': return 'Nije uspelo obrada recenzije';
			case 'errors.unexpectedResponseFormat': return 'Neočekivani format odgovora sa servera';
			case 'errors.genericError': return 'Došlo je do greške. Molimo pokušajte ponovo.';
			case 'errors.failedToAddReview': return 'Nije uspelo dodavanje recenzije';
			case 'errors.failedToUpdateReview': return 'Nije uspelo ažuriranje recenzije';
			case 'errors.failedToDeleteReview': return 'Nije uspelo brisanje recenzije';
			case 'appFailedToStart': return 'Aplikacija nije uspela da se pokrene:\n\n@{error}';
			case 'library.latest': return 'Najnovije';
			case 'library.popular': return 'Popularno';
			case 'library.ownedGames': return 'Moje igre';
			case 'library.wishlist': return 'Lista želja';
			case 'library.myLibrary': return 'Moja Biblioteka';
			case 'library.gameAlreadyInWishlist': return 'Igra je već na listi želja';
			case 'library.gameAddedToWishlist': return 'Igra je dodata na listu želja';
			case 'library.gameAlreadyInLibrary': return 'Igra je već u biblioteci';
			case 'library.gameAddedToLibrary': return 'Igra je dodata u biblioteku';
			case 'library.gameNotFoundInWishlist': return 'Igra nije pronađena na listi želja';
			case 'library.gameNotFoundInLibrary': return 'Igra nije pronađena u biblioteci';
			case 'library.wishlistAdditionFailed': return 'Dodavanje na listu želja nije uspelo';
			case 'library.libraryAdditionFailed': return 'Dodavanje u biblioteku nije uspelo';
			case 'library.reviewsNotFound': return 'Recenzije nisu pronađene';
			case 'library.failedToFetchGame': return 'Nije uspelo preuzimanje igre';
			case 'library.failedToFetchGames': return 'Učitavanje igara nije uspelo';
			case 'library.failedToFetchGameStatistics': return 'Nije uspelo preuzimanje statistike igre';
			case 'library.failedToFetchRecentReviews': return 'Nije uspelo preuzimanje nedavnih recenzija';
			case 'library.failedToAddToWishlist': return 'Dodavanje na listu želja nije uspelo';
			case 'library.failedToRemoveFromWishlist': return 'Nije uspelo uklanjanje sa liste želja';
			case 'library.failedToAddToLibrary': return 'Dodavanje u biblioteku nije uspelo';
			case 'library.failedToRemoveFromLibrary': return 'Nije uspelo uklanjanje iz biblioteke';
			case 'library.failedToUpdateGameProgress': return 'Nije uspelo ažuriranje napretka igre';
			case 'library.failedToFetchGameReviews': return 'Nije uspelo preuzimanje recenzija igre';
			case 'library.failedToFetchReviewComments': return 'Nije uspelo preuzimanje komentara na recenzije';
			case 'library.failedToCreateReview': return 'Nije uspelo kreiranje recenzije';
			case 'library.failedToAddComment': return 'Nije uspelo dodavanje komentara';
			case 'library.failedToLikeReview': return 'Nije uspelo lajkovanje recenzije';
			case 'library.failedToUnlikeReview': return 'Nije uspelo uklanjanje lajka sa recenzije';
			case 'library.userNotAuthenticated': return 'Korisnik nije autentifikovan';
			case 'library.registrationEmailExistsError': return 'Nalog sa ovom email adresom već postoji';
			case 'library.passwordLength': return 'Lozinka mora imati najmanje 8 karaktera';
			case 'library.confirmPassword': return 'Molimo potvrdite vašu lozinku';
			case 'library.passwordMismatch': return 'Lozinke se ne poklapaju';
			case 'common.goBack': return 'Nazad';
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
			case 'gameService.failedToRemoveFromWishlist': return 'Neuspešno uklanjanje iz liste želja';
			case 'gameService.failedToRemoveFromLibrary': return 'Neuspešno uklanjanje iz biblioteke';
			case 'gameService.loginFailed': return 'Prijava nije uspela, pokušaj ponovo';
			case 'gameService.appFailedToStart': return 'Aplikacija nije uspela da se pokrene. Ponovo pokreni i pokušaj opet.';
			case 'gameService.gameNotFound': return 'Igra nije pronađena';
			case 'gameService.reviewsNotFound': return 'Recenzije nisu pronađene';
			case 'gameService.failedToProcessReview': return 'Nije uspelo da se obradi recenzija';
			case 'gameService.unexpectedResponseFormat': return 'Neočekivani format odgovora sa servera';
			case 'gameService.genericError': return 'Došlo je do greške. Molimo pokušajte ponovo.';
			case 'gameService.failedToAddReview': return 'Nije uspelo da se doda recenzija';
			case 'gameService.failedToUpdateReview': return 'Nije uspelo da se ažurira recenzija';
			case 'gameService.failedToDeleteReview': return 'Nije uspelo da se obriše recenzija';
			case 'gameService.failedToFetchGame': return 'Neuspešno učitavanje igre';
			case 'gameService.failedToFetchGames': return 'Neuspešno učitavanje igara';
			case 'gameService.failedToFetchGameStatistics': return 'Neuspešno učitavanje statistika igre';
			case 'gameService.failedToFetchRecentReviews': return 'Neuspešno učitavanje nedavnih recenzija';
			case 'gameService.failedToAddToWishlist': return 'Neuspešno dodavanje u listu želja';
			case 'gameService.failedToAddToLibrary': return 'Neuspešno dodavanje u biblioteku';
			case 'gameService.failedToUpdateGameProgress': return 'Neuspešno ažuriranje napretka igre';
			case 'gameService.failedToFetchGameReviews': return 'Neuspešno učitavanje recenzija igre';
			case 'gameService.failedToFetchReviewComments': return 'Neuspešno učitavanje komentara recenzije';
			case 'gameService.failedToCreateReview': return 'Neuspešno kreiranje recenzije';
			case 'gameService.failedToAddComment': return 'Neuspešno dodavanje komentara';
			case 'gameService.failedToLikeReview': return 'Neuspešno lajkovanje recenzije';
			case 'gameService.failedToUnlikeReview': return 'Neuspešno uklanjanje lajka recenzije';
			case 'gameService.userNotAuthenticated': return 'Korisnik nije autentifikovan';
			case 'gameService.registrationEmailExistsError': return 'Nalog sa ovim email-om već postoji';
			case 'gameService.passwordLength': return 'Lozinka mora imati minimum 8 karaktera';
			case 'gameService.confirmPassword': return 'Molimo potvrdite vašu lozinku';
			case 'gameService.passwordMismatch': return 'Lozinke se ne podudaraju';
			case 'avatarUpdated': return 'Avatar promenjen.';
			case 'profileUpdated': return 'Profil izmenjen.';
			case 'gameReview': return 'Recenzija';
			case 'addComment': return 'Dodaj komentar';
			case 'reviewsNotFound': return 'Recenzije nisu pronađene';
			case 'wouldRecommend': return 'Preporučio/la bih';
			case 'wouldNotRecommend': return 'Ne bih preporučio/la';
			case 'likes': return 'Lajkovi';
			case 'playingRecord': return 'h na rekordu';
			case 'time.secondsAgo': return 'pre sekund/e';
			case 'time.minutesAgo': return 'pre minut/a';
			case 'time.hoursAgo': return 'pre sat/a';
			case 'time.daysAgo': return 'pre dan/a';
			case 'time.weeksAgo': return 'pre nedelj/a';
			case 'time.monthsAgo': return 'pre mesec/a';
			case 'time.yearsAgo': return 'pre godinu/dana';
			case 'dateTime.daysAgo': return 'pre {days}d';
			case 'dateTime.hoursAgo': return 'pre {hours}h';
			case 'dateTime.minutesAgo': return 'pre {minutes}m';
			case 'dateTime.justNow': return 'upravo sada';
			case 'gamesSection': return 'Igre';
			case 'reviewsSection': return 'Recenzije';
			case 'recommended': return 'Preporučeno';
			case 'swipeToSeeMore': return 'Prevucite da vidite više';
			case 'noResultsFound': return 'Nema rezultata za "{{query}}"';
			case 'retry': return 'Pokušaj ponovo';
			default: return null;
		}
	}
}

