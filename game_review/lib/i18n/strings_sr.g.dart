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
	@override late final TranslationsAppSr app = TranslationsAppSr._(_root);
	@override late final TranslationsCommonSr common = TranslationsCommonSr._(_root);
	@override late final TranslationsNavigationSr navigation = TranslationsNavigationSr._(_root);
	@override late final TranslationsAuthSr auth = TranslationsAuthSr._(_root);
	@override late final TranslationsProfileSr profile = TranslationsProfileSr._(_root);
	@override late final TranslationsHomeSr home = TranslationsHomeSr._(_root);
	@override late final TranslationsSearchSr search = TranslationsSearchSr._(_root);
	@override late final TranslationsLibrarySr library = TranslationsLibrarySr._(_root);
	@override late final TranslationsGameDetailsSr gameDetails = TranslationsGameDetailsSr._(_root);
	@override late final TranslationsReviewsSr reviews = TranslationsReviewsSr._(_root);
	@override late final TranslationsRatingsSr ratings = TranslationsRatingsSr._(_root);
	@override late final TranslationsGameStatusSr gameStatus = TranslationsGameStatusSr._(_root);
	@override late final TranslationsActionsSr actions = TranslationsActionsSr._(_root);
	@override late final TranslationsTimeSr time = TranslationsTimeSr._(_root);
	@override late final TranslationsDateTimeSr dateTime = TranslationsDateTimeSr._(_root);
	@override late final TranslationsGameServiceSr gameService = TranslationsGameServiceSr._(_root);
	@override late final TranslationsErrorsSr errors = TranslationsErrorsSr._(_root);
	@override late final TranslationsSettingsSr settings = TranslationsSettingsSr._(_root);
	@override late final TranslationsMediaSr media = TranslationsMediaSr._(_root);
}

// Path: app
class TranslationsAppSr extends TranslationsAppEn {
	TranslationsAppSr._(TranslationsSr root) : this._root = root, super.internal(root);

	final TranslationsSr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Aplikacija za recenzije igara';
	@override late final TranslationsAppBrandingSr branding = TranslationsAppBrandingSr._(_root);
}

// Path: common
class TranslationsCommonSr extends TranslationsCommonEn {
	TranslationsCommonSr._(TranslationsSr root) : this._root = root, super.internal(root);

	final TranslationsSr _root; // ignore: unused_field

	// Translations
	@override String get back => 'Nazad';
	@override String get next => 'Dalje';
	@override String get save => 'Sačuvaj';
	@override String get edit => 'Izmeni';
	@override String get delete => 'Obriši';
	@override String get update => 'Ažuriraj';
	@override String get submit => 'Pošalji';
	@override String get cancel => 'Otkaži';
	@override String get retry => 'Pokušaj ponovo';
	@override String get loading => 'Učitavanje...';
	@override String get error => 'Greška';
	@override String get success => 'Uspešno';
	@override String get goBack => 'Idi nazad';
}

// Path: navigation
class TranslationsNavigationSr extends TranslationsNavigationEn {
	TranslationsNavigationSr._(TranslationsSr root) : this._root = root, super.internal(root);

	final TranslationsSr _root; // ignore: unused_field

	// Translations
	@override String get home => 'Početna';
	@override String get search => 'Pretraga';
	@override String get library => 'Biblioteka';
	@override String get profile => 'Profil';
	@override String get discover => 'Otkrij';
}

// Path: auth
class TranslationsAuthSr extends TranslationsAuthEn {
	TranslationsAuthSr._(TranslationsSr root) : this._root = root, super.internal(root);

	final TranslationsSr _root; // ignore: unused_field

	// Translations
	@override String get welcome => 'Dobrodošli!';
	@override String get login => 'Prijavite se';
	@override String get logout => 'Odjavite se';
	@override String get register => 'Registrujte se';
	@override String get email => 'Email';
	@override String get password => 'Lozinka';
	@override String get confirmPassword => 'Potvrdite lozinku';
	@override String get username => 'Korisničko ime';
	@override String get displayName => 'Ime za prikaz';
	@override String get goodbye => 'Doviđenja!';
	@override String get changePassword => 'Promeni lozinku';
	@override String get passwordChanged => 'Lozinka je uspešno promenjena.';
	@override String get errorChangingPassword => 'Greška pri promeni lozinke.';
	@override String get registrationSuccessful => 'Registracija uspešna!';
	@override String get registrationEmailExistsError => 'Email adresa je već registrovana.';
	@override String get registrationError => 'Došlo je do greške. Pokušajte ponovo kasnije';
	@override String get passwordMismatch => 'Lozinke se ne poklapaju!';
	@override String get passwordLength => 'Lozinka mora imati najmanje 8 karaktera!';
	@override String get emailInvalid => 'Email adresa nije validna!';
	@override String get userDataNotLoaded => 'Korisnički podaci nisu učitani!';
}

// Path: profile
class TranslationsProfileSr extends TranslationsProfileEn {
	TranslationsProfileSr._(TranslationsSr root) : this._root = root, super.internal(root);

	final TranslationsSr _root; // ignore: unused_field

	// Translations
	@override String get myProfile => 'Moj profil';
	@override String get profileSettings => 'Postavke profila';
	@override String get profileInfo => 'Informacije o profilu';
	@override String get saveProfile => 'Sačuvaj profil';
	@override String get enterBio => 'Unesite biografiju';
	@override String get avatarUpdated => 'Avatar je ažuriran.';
	@override String get profileUpdated => 'Profil je ažuriran.';
	@override String get avatarRemoved => 'Avatar je uklonjen.';
	@override String get noImage => 'Nema slike';
	@override String get saveImage => 'Sačuvaj sliku';
	@override String get addImages => 'Dodaj slike';
	@override String get noImagesSelected => 'Nema odabranih slika.';
	@override String get chooseImages => 'Izaberite slike.';
	@override String get notifications => 'Obaveštenja';
	@override String get addFriend => 'Dodaj prijatelja';
	@override String get friends => 'Prijatelji';
}

// Path: home
class TranslationsHomeSr extends TranslationsHomeEn {
	TranslationsHomeSr._(TranslationsSr root) : this._root = root, super.internal(root);

	final TranslationsSr _root; // ignore: unused_field

	// Translations
	@override String get searchGames => 'Pretražite igre';
	@override String get favoriteGames => 'Omiljene igre';
	@override String get recentReviews => 'Nedavne recenzije';
	@override String get gamesSection => 'Igre';
	@override String get reviewsSection => 'Recenzije';
	@override String get recommended => 'Preporučeno';
	@override String get swipeToSeeMore => 'Povucite da vidite više';
	@override String noResultsFound({required Object query}) => 'Nema rezultata za "${query}"';
	@override String get errorLoadingGames => 'Neuspešno učitavanje igara';
	@override String get errorLoadingMoreGames => 'Neuspešno učitavanje dodatnih igara';
	@override String get NoGamesFound => 'Nema pronađenih igara';
	@override String get failedToLoadHome => 'Neuspešno učitavanje početnih podataka';
}

// Path: search
class TranslationsSearchSr extends TranslationsSearchEn {
	TranslationsSearchSr._(TranslationsSr root) : this._root = root, super.internal(root);

	final TranslationsSr _root; // ignore: unused_field

	// Translations
	@override String get searchGames => 'Pretražite igre';
	@override String noResultsFound({required Object query}) => 'Nema rezultata za "${query}"';
	@override String get errorLoadingGames => 'Neuspešno učitavanje igara';
}

// Path: library
class TranslationsLibrarySr extends TranslationsLibraryEn {
	TranslationsLibrarySr._(TranslationsSr root) : this._root = root, super.internal(root);

	final TranslationsSr _root; // ignore: unused_field

	// Translations
	@override String get myLibrary => 'Moja biblioteka';
	@override String get ownedGames => 'Posedovane igre';
	@override String get wishlist => 'Lista želja';
	@override String get latest => 'Najnovije';
	@override String get popular => 'Popularne';
	@override String get gameAlreadyInWishlist => 'Igra je već u listi želja';
	@override String get gameAddedToWishlist => 'Igra je dodana u listu želja';
	@override String get gameAlreadyInLibrary => 'Igra je već u biblioteci';
	@override String get gameAddedToLibrary => 'Igra je dodana u biblioteku';
	@override String get gameNotFoundInWishlist => 'Igra nije pronađena u listi želja';
	@override String get gameNotFoundInLibrary => 'Igra nije pronađena u biblioteci';
	@override String get wishlistAdditionFailed => 'Neuspešno dodavanje u listu želja';
	@override String get libraryAdditionFailed => 'Neuspešno dodavanje u biblioteku';
	@override String get reviewsNotFound => 'Recenzije nisu pronađene';
	@override String get failedToFetchGame => 'Neuspešno učitavanje igre';
	@override String get failedToFetchGames => 'Neuspešno učitavanje igara';
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
	@override String get registrationEmailExistsError => 'Nalog sa ovom email adresom već postoji';
	@override String get passwordLength => 'Lozinka mora imati najmanje 8 karaktera';
	@override String get confirmPassword => 'Molimo potvrdite lozinku';
	@override String get passwordMismatch => 'Lozinke se ne poklapaju';
}

// Path: gameDetails
class TranslationsGameDetailsSr extends TranslationsGameDetailsEn {
	TranslationsGameDetailsSr._(TranslationsSr root) : this._root = root, super.internal(root);

	final TranslationsSr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Detalji igre';
	@override String get details => 'Detalji';
	@override String get overall => 'Ukupno';
	@override String get developer => 'Developer';
	@override String get publisher => 'Izdavač';
	@override String get released => 'Izdato';
	@override String get availableOn => 'Dostupno na';
	@override String get statistics => 'Statistike';
	@override String get recentReviews => 'Nedavne recenzije';
	@override String get unknownUser => 'Nepoznat korisnik';
	@override String get addToWishlist => 'Dodaj u listu želja';
	@override String get removeFromWishlist => 'Ukloni iz liste želja';
	@override String get addToLibrary => 'Dodaj u biblioteku';
	@override String get removeFromLibrary => 'Ukloni iz biblioteke';
	@override String get addToMyLibrary => 'Dodaj u moju biblioteku';
	@override String get removeFromMyLibrary => 'Ukloni iz moje biblioteke';
	@override String get addReview => 'Dodaj recenziju';
	@override String get trackHours => 'Prati sate';
	@override String get hoursPlayed => 'Sati igranja';
	@override String get completionPercentage => 'Procenat završetka';
	@override String get lastPlayed => 'Poslednji put igrano';
	@override String get isFavorite => 'Omiljeno';
	@override String get reviewsCount => '{count} recenzija';
	@override String get wishlistCount => '{count} u listi želja';
	@override String get libraryCount => '{count} u biblioteci';
	@override String get noReviews => 'Još uvek nema recenzija';
	@override String get noGenres => 'Nisu specificirani žanrovi';
	@override String get noPlatforms => 'Nisu specificirane platforme';
	@override String get noDescription => 'Nema dostupnog opisa';
	@override String get noDeveloper => 'Developer nije specificiran';
	@override String get noPublisher => 'Izdavač nije specificiran';
	@override String get noReleaseDate => 'Datum izdavanja nije specificiran';
	@override String get recommendText => 'x igrača preporučuje ovu igru';
	@override String overallRecommendation({required Object percentage}) => '${percentage}% igrača preporučuje ovu igru';
	@override String get gameAlreadyInWishlist => 'Igra je već u listi želja';
	@override String get failedToAddToWishlist => 'Neuspešno dodavanje u listu želja';
	@override String get failedToShare => 'Neuspešno deljenje igre';
	@override String get gameAlreadyInLibrary => 'Igra je već u biblioteci';
	@override String get failedToAddToLibrary => 'Neuspešno dodavanje u biblioteku';
	@override String get failedToRemoveFromWishlist => 'Neuspešno uklanjanje iz liste želja';
	@override String get failedToRemoveFromLibrary => 'Neuspešno uklanjanje iz biblioteke';
	@override String get addReviewComingSoon => 'Funkcionalnost dodavanja recenzije uskoro!';
	@override String get reviewComingSoon => 'Funkcionalnost recenzija uskoro!';
	@override String get shareComingSoon => 'Funkcionalnost deljenja uskoro!';
	@override String get addedToWishlist => 'Dodano u listu želja!';
	@override String get removedFromWishlist => 'Uklonjeno iz liste želja!';
	@override String get addedToLibrary => 'Dodano u biblioteku!';
	@override String get removedFromLibrary => 'Uklonjeno iz biblioteke!';
	@override String get alreadyInLibrary => 'Već u biblioteci!';
	@override String get alreadyInWishlist => 'Već u listi želja!';
	@override String get loginRequiredWishlist => 'Molimo prijavite se da dodate igre u listu želja';
	@override String get loginRequiredLibrary => 'Molimo prijavite se da dodate igre u biblioteku';
	@override String get loginRequiredToView => 'Molimo prijavite se da vidite detalje igre';
	@override String failedToShareGame({required Object error}) => 'Neuspešno deljenje igre: ${error}';
}

// Path: reviews
class TranslationsReviewsSr extends TranslationsReviewsEn {
	TranslationsReviewsSr._(TranslationsSr root) : this._root = root, super.internal(root);

	final TranslationsSr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Recenzije';
	@override String get addReview => 'Dodaj recenziju';
	@override String get addComment => 'Dodaj komentar';
	@override String get like => 'Lajk';
	@override String get unlike => 'Ukloni lajk';
	@override String get reply => 'Odgovori';
	@override String get showMore => 'Prikaži više';
	@override String get showLess => 'Prikaži manje';
	@override String get playtimeHours => 'Vreme igranja: {hours} sati';
	@override String get completionStatus => 'Status: {status}';
	@override String get recommended => 'Preporučeno';
	@override String get notRecommended => 'Nije preporučeno';
	@override String get wouldRecommend => 'Preporučio bih';
	@override String get wouldNotRecommend => 'Ne bih preporučio';
	@override String get likes => 'Lajkovi';
	@override String get playingRecord => 'h zabeleženo';
	@override String get youHaveAlreadyReviewedThisGame => 'Već ste recenzirali ovu igru';
	@override String get failedToSaveReview => 'Neuspešno čuvanje recenzije';
	@override String get reviewAddedSuccessfully => 'Recenzija je uspešno dodana!';
	@override String get reviewTitle => 'Naslov recenzije *';
	@override String get reviewTitleIsRequired => 'Naslov recenzije je obavezan';
	@override String get reviewDescription => 'Opis recenzije *';
	@override String get reviewDescriptionIsRequired => 'Opis recenzije je obavezan';
	@override String get prosCons => 'Prednosti i mane';
	@override String get gamePros => 'Prednosti igre (odvojene zarezom)';
	@override String get gameCons => 'Mane igre (odvojene zarezom)';
	@override String get overallRating => 'Ukupna ocena *';
	@override String get individualRatings => 'Individualne ocene';
	@override String get miscellaneous => 'Ostalo';
	@override String get gameCompletion => 'Završetak igre (%)';
	@override String get completionStatusLabel => 'Status završetka';
	@override String get inGameHours => 'Sati u igri';
	@override String get pleaseEnterAValidNumber => 'Molimo unesite validan broj';
	@override String get iRecommendThisGame => 'Preporučujem ovu igru *';
	@override String get selectAGameFromYourLibrary => 'Izaberite igru iz vaše biblioteke...';
	@override String get completed100 => 'Završeno (100%)';
	@override String get notStarted0 => 'Nije početo (0%)';
	@override String get reviewsNotFound => 'Recenzije nisu pronađene';
	@override String get failedToProcessReview => 'Neuspešno procesiranje recenzije';
	@override String get failedToAddReview => 'Neuspešno dodavanje recenzije';
	@override String get failedToUpdateReview => 'Neuspešno ažuriranje recenzije';
	@override String get failedToDeleteReview => 'Neuspešno brisanje recenzije';
	@override String get failedToLoadComments => 'Neuspešno učitavanje komentara';
}

// Path: ratings
class TranslationsRatingsSr extends TranslationsRatingsEn {
	TranslationsRatingsSr._(TranslationsSr root) : this._root = root, super.internal(root);

	final TranslationsSr _root; // ignore: unused_field

	// Translations
	@override String get overall => 'Ukupno';
	@override String get gameplay => 'Igra';
	@override String get graphics => 'Grafika';
	@override String get sound => 'Zvuk';
	@override String get story => 'Priča';
	@override String get value => 'Vrednost';
	@override String get pros => 'Prednosti';
	@override String get cons => 'Mane';
	@override String get evaluation => 'Ocena';
}

// Path: gameStatus
class TranslationsGameStatusSr extends TranslationsGameStatusEn {
	TranslationsGameStatusSr._(TranslationsSr root) : this._root = root, super.internal(root);

	final TranslationsSr _root; // ignore: unused_field

	// Translations
	@override String get completed => 'Završeno';
	@override String get notStarted => 'Nije početo';
	@override String get inProgress => 'U toku';
	@override String get abandoned => 'Napušteno';
}

// Path: actions
class TranslationsActionsSr extends TranslationsActionsEn {
	TranslationsActionsSr._(TranslationsSr root) : this._root = root, super.internal(root);

	final TranslationsSr _root; // ignore: unused_field

	// Translations
	@override String get addToWishlist => 'Dodaj u listu želja';
	@override String get removeFromWishlist => 'Ukloni iz liste želja';
	@override String get addToLibrary => 'Dodaj u biblioteku';
	@override String get removeFromLibrary => 'Ukloni iz biblioteke';
	@override String get markAsFavorite => 'Označi kao omiljeno';
	@override String get removeFromFavorites => 'Ukloni iz omiljenih';
	@override String get trackProgress => 'Prati napredak';
	@override String get writeReview => 'Napiši recenziju';
	@override String get shareGame => 'Podeli igru';
	@override String get share => 'Podeli';
	@override String get shareSubject => 'Pogledajte ovu igru!';
	@override String shareMessage({required Object gameTitle}) => 'Hej! Pogledajte ovu kul igru koju sam pronašao na PawGames! Zove se \'${gameTitle}\'. :)';
}

// Path: time
class TranslationsTimeSr extends TranslationsTimeEn {
	TranslationsTimeSr._(TranslationsSr root) : this._root = root, super.internal(root);

	final TranslationsSr _root; // ignore: unused_field

	// Translations
	@override String get secondsAgo => 'pre sekunde';
	@override String get minutesAgo => 'pre minuta';
	@override String get hoursAgo => 'pre sati';
	@override String get daysAgo => 'pre dana';
	@override String get weeksAgo => 'pre nedelja';
	@override String get monthsAgo => 'pre meseci';
	@override String get yearsAgo => 'pre godina';
	@override String get justNow => 'Upravo sada';
}

// Path: dateTime
class TranslationsDateTimeSr extends TranslationsDateTimeEn {
	TranslationsDateTimeSr._(TranslationsSr root) : this._root = root, super.internal(root);

	final TranslationsSr _root; // ignore: unused_field

	// Translations
	@override String daysAgo({required Object count}) => 'pre ${count} dana';
	@override String hoursAgo({required Object count}) => 'pre ${count} sati';
	@override String minutesAgo({required Object count}) => 'pre ${count} minuta';
	@override String get justNow => 'upravo sada';
}

// Path: gameService
class TranslationsGameServiceSr extends TranslationsGameServiceEn {
	TranslationsGameServiceSr._(TranslationsSr root) : this._root = root, super.internal(root);

	final TranslationsSr _root; // ignore: unused_field

	// Translations
	@override String get noTokenWishlist => 'Ne mogu dodati u listu želja - token nije pronađen';
	@override String get noTokenLibrary => 'Ne mogu dodati u biblioteku - token nije pronađen';
	@override String get noTokenFetchWishlist => 'Ne mogu učitati listu želja - token nije pronađen';
	@override String get noTokenFetchLibrary => 'Ne mogu učitati biblioteku - token nije pronađen';
	@override String get noTokenRemoveWishlist => 'Ne mogu ukloniti iz liste želja - token nije pronađen';
	@override String get noTokenRemoveLibrary => 'Ne mogu ukloniti iz biblioteke - token nije pronađen';
	@override String get gameAddedToWishlistSuccess => 'Igra je uspešno dodana u listu želja';
	@override String get gameAddedToLibrarySuccess => 'Igra je uspešno dodana u biblioteku';
	@override String get failedToAddToWishlistStatus => 'Neuspešno dodavanje u listu želja, status';
	@override String get failedToAddToLibraryStatus => 'Neuspešno dodavanje u biblioteku, status';
	@override String get failedToFetchLatestGames => 'Neuspešno učitavanje najnovijih igara';
	@override String get failedToFetchPopularGames => 'Neuspešno učitavanje popularnih igara';
	@override String get failedToAddGameToWishlist => 'Neuspešno dodavanje igre u listu želja';
	@override String get failedToAddGameToLibrary => 'Neuspešno dodavanje igre u biblioteku';
	@override String get failedToFetchWishlistGames => 'Neuspešno učitavanje igara iz liste želja';
	@override String get failedToFetchLibraryGames => 'Neuspešno učitavanje igara iz biblioteke';
	@override String get removedFromWishlist => 'Uklonjeno iz liste želja na serveru';
	@override String get removedFromLibrary => 'Uklonjeno iz biblioteke na serveru';
	@override String get failedToRemoveFromWishlist => 'Neuspešno uklanjanje iz liste želja';
	@override String get failedToRemoveFromLibrary => 'Neuspešno uklanjanje iz biblioteke';
}

// Path: errors
class TranslationsErrorsSr extends TranslationsErrorsEn {
	TranslationsErrorsSr._(TranslationsSr root) : this._root = root, super.internal(root);

	final TranslationsSr _root; // ignore: unused_field

	// Translations
	@override String get invalidCredentials => 'Neispravni podaci za prijavu';
	@override String get loginFailed => 'Neuspešna prijava. Molimo pokušajte ponovo.';
	@override String requiredField({required Object field}) => '${field} je obavezno';
	@override String get invalidEmail => 'Neispravna email adresa';
	@override String minLength({required Object n}) => 'Min ${n} karaktera';
	@override String get appFailedToStart => 'Aplikacija se nije uspešno pokrenula. Molimo restartujte i pokušajte ponovo.';
	@override String get gameNotFound => 'Igra nije pronađena';
	@override String get failedToProcessReview => 'Neuspešno procesiranje recenzije';
	@override String get reviewsNotFound => 'Recenzije nisu pronađene';
	@override String get failedToFetchRecentReviews => 'Neuspešno učitavanje nedavnih recenzija';
	@override String get failedToLoadHome => 'Neuspešno učitavanje početnih podataka';
	@override String get failedToLoadComments => 'Neuspešno učitavanje komentara';
	@override String get authenticationFail => 'Provera autentifikacije neuspešna';
	@override String get unexpectedResponseFormat => 'Neočekivani format odgovora sa servera';
	@override String get genericError => 'Došlo je do greške. Molimo pokušajte ponovo.';
	@override String get failedToAddReview => 'Neuspešno dodavanje recenzije';
	@override String get failedToUpdateReview => 'Neuspešno ažuriranje recenzije';
	@override String get failedToDeleteReview => 'Neuspešno brisanje recenzije';
	@override String get missingApiUrl => 'Nedostaje API_URL environment varijabla';
}

// Path: settings
class TranslationsSettingsSr extends TranslationsSettingsEn {
	TranslationsSettingsSr._(TranslationsSr root) : this._root = root, super.internal(root);

	final TranslationsSr _root; // ignore: unused_field

	// Translations
	@override String get settings => 'Postavke';
	@override String get changeLanguage => 'Promeni jezik';
}

// Path: media
class TranslationsMediaSr extends TranslationsMediaEn {
	TranslationsMediaSr._(TranslationsSr root) : this._root = root, super.internal(root);

	final TranslationsSr _root; // ignore: unused_field

	// Translations
	@override String get media => 'Mediji';
	@override String get discussions => 'Diskusije';
}

// Path: app.branding
class TranslationsAppBrandingSr extends TranslationsAppBrandingEn {
	TranslationsAppBrandingSr._(TranslationsSr root) : this._root = root, super.internal(root);

	final TranslationsSr _root; // ignore: unused_field

	// Translations
	@override String get title => 'PAW GAMES';
	@override String get tagline => 'Otkrij. Oceni. Podeli.';
	@override String get logoLabel => 'Logo aplikacije';
}
