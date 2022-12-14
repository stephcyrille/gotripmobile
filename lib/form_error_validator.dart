// Form Error val
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = 'Veillez saisir votre email';
const String kInvalidEmailError = 'Adresse email invalide';
const String kPassNullError = 'Veuillez saisir le mot de passe';
const String kShortPassError = 'Mot de passe trop court';
const String kMatchPassError = 'Les mots de passe ne coïncident pas';
const String kFullNameNullError = 'Veuillez saisir votre nom';
const String kFullNameShortError = 'Le nom doit contenir plus de 5 caractères';
