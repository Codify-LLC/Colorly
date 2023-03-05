import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? esText = '',
  }) =>
      [enText, esText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // login
  {
    'v3er7ro4': {
      'en': 'Welcome Back,',
      'es': 'Bienvenido de nuevo,',
    },
    '4ff6oqrg': {
      'en': 'Login to the app below or',
      'es': 'Acceda a su cuenta a continuación o',
    },
    '4znscc22': {
      'en': 'Create Account',
      'es': 'Crear una cuenta',
    },
    'z9s14bpv': {
      'en': 'Your email...',
      'es': 'Tu correo electrónico...',
    },
    'gvhgefzy': {
      'en': 'Password',
      'es': 'Contraseña',
    },
    'udwuys67': {
      'en': 'Forgot Password?',
      'es': '¿Has olvidado tu contraseña?',
    },
    '1hf3zia7': {
      'en': 'Login',
      'es': 'Acceso',
    },
    'grz5x9vg': {
      'en': 'Continue as guest',
      'es': 'Continua como invitado',
    },
    'pplobtrd': {
      'en': 'Field is required',
      'es': '',
    },
    'jwh0hbwl': {
      'en': 'Home',
      'es': '',
    },
  },
  // createAccount
  {
    'a71da90s': {
      'en': 'Welcome,',
      'es': 'Bienvenidos,',
    },
    '0om3kvb5': {
      'en': 'Create your account below, or',
      'es': 'Cree su cuenta a continuación, o',
    },
    'mld28txl': {
      'en': 'Login',
      'es': 'Acceso',
    },
    '0lhqopte': {
      'en': 'Your email...',
      'es': 'Tu correo electrónico...',
    },
    'tlbu70y2': {
      'en': 'Password',
      'es': 'Contraseña',
    },
    'kabx20i9': {
      'en': 'Confirm Password',
      'es': 'Confirmar contraseña',
    },
    'nb5oacbr': {
      'en': 'Create Account',
      'es': 'Crear una cuenta',
    },
    'wo6xyqu0': {
      'en': 'Agree to ',
      'es': 'De acuerdo con',
    },
    'unbtu568': {
      'en': 'Terms & Conditions',
      'es': 'Términos y condiciones',
    },
    'xm32ozns': {
      'en': 'Home',
      'es': '',
    },
  },
  // searchResults
  {
    'l3d990cn': {
      'en': 'Search for restaurants...',
      'es': 'Buscar restaurantes...',
    },
    '53jg3g2n': {
      'en': 'Search',
      'es': '',
    },
    'k0hwvmck': {
      'en': 'Shop',
      'es': '',
    },
  },
  // homePage
  {
    'mr1fdlx2': {
      'en': 'Reply',
      'es': '',
    },
    '1t2uo9tm': {
      'en': 'Home',
      'es': '',
    },
  },
  // explore
  {
    'xxvno4qr': {
      'en': 'Search for restaurants...',
      'es': 'Buscar restaurantes...',
    },
    'j65kdlwh': {
      'en': 'American',
      'es': 'americano',
    },
    'qa7gthbw': {
      'en': 'Mexican',
      'es': 'mexicano',
    },
    'b5o4m8y2': {
      'en': 'Asian',
      'es': 'asiático',
    },
    'dximdfj3': {
      'en': 'Italian',
      'es': 'italiano',
    },
    '5wjgqr9n': {
      'en': 'Jamaican',
      'es': 'jamaicano',
    },
    'qtr5p0ok': {
      'en': 'Indian',
      'es': 'indio',
    },
    'wa1pkysa': {
      'en': 'Greek',
      'es': 'griego',
    },
    'emodptq1': {
      'en': 'Japanese',
      'es': 'japonés',
    },
    'q6ck8y7k': {
      'en': 'Pizza',
      'es': 'Pizza',
    },
    '87sbiwtz': {
      'en': 'Burger',
      'es': 'Hamburguesa',
    },
    '84puncok': {
      'en': 'Barbeque',
      'es': 'Barbacoa',
    },
    'xqjhvxth': {
      'en': 'Breakfast',
      'es': 'Desayuno',
    },
    'ojllc3c6': {
      'en': 'Thai',
      'es': 'tailandés',
    },
    '0rotqp72': {
      'en': 'Canadian',
      'es': 'canadiense',
    },
    '10twe1q0': {
      'en': 'French',
      'es': 'francés',
    },
    '7j89pi0d': {
      'en': 'Middle Eastern',
      'es': 'Medio este',
    },
    '2jfa89f4': {
      'en': 'Latin',
      'es': 'latín',
    },
    'a3d7qq0v': {
      'en': 'Noodle',
      'es': 'Fideos',
    },
    'gl7xpcmz': {
      'en': 'Seafood',
      'es': 'Mariscos',
    },
    'b4p2cp8y': {
      'en': 'Street Food',
      'es': 'Comida de la calle',
    },
    'ffeoj8fl': {
      'en': 'Vegetarian',
      'es': 'Vegetariano',
    },
    'm7q27ipq': {
      'en': 'Soul Food',
      'es': 'Comida para el alma',
    },
    'fl95jtxy': {
      'en': 'Kebab',
      'es': 'Brocheta',
    },
    'lwnsccdk': {
      'en': 'Brunch',
      'es': 'Desalmuerzo',
    },
    'by7a5dcu': {
      'en': 'German',
      'es': 'alemán',
    },
    '8qznyg9i': {
      'en': 'African',
      'es': 'africano',
    },
    '0u9ok5qe': {
      'en': 'Cajun',
      'es': 'cajún',
    },
    'dgiwa4li': {
      'en': 'Irish',
      'es': 'irlandesa',
    },
    'd3ssey2a': {
      'en': 'American',
      'es': 'americano',
    },
    'nzm6gt47': {
      'en': 'Nerarby Restaurants',
      'es': 'Restaurantes cerca',
    },
    '615djvxq': {
      'en': 'more',
      'es': '',
    },
    '0ucitqat': {
      'en': 'Curated For Foodies',
      'es': 'Cercano',
    },
    '3mijylyc': {
      'en': 'more',
      'es': '',
    },
    'lq72ftp7': {
      'en': 'Deals',
      'es': 'ofertas',
    },
    'ku24yuwk': {
      'en': 'more',
      'es': '',
    },
    'vnva9ir6': {
      'en': 'Popular',
      'es': 'Popular',
    },
    'iegcudt9': {
      'en': 'Top Foodies',
      'es': 'Restaurantes cerca',
    },
    '86crvntw': {
      'en': 'more',
      'es': '',
    },
    'q0wenwtb': {
      'en': 'Recommended',
      'es': 'Recomendado',
    },
    '3p318qod': {
      'en': 'Nearby Video Reviews',
      'es': 'Cercano',
    },
    'fpczrisn': {
      'en': 'see all...',
      'es': 'Cercano',
    },
    'rbd97x1i': {
      'en': 'Explore',
      'es': '',
    },
    'pekc8xx1': {
      'en': 'Explore',
      'es': '',
    },
  },
  // storySuccess
  {
    'o2rgppsf': {
      'en': 'Your Story Has Been Added',
      'es': 'Tu historia ha sido agregada',
    },
    '287croya': {
      'en': 'Would you like to highlight a deal on your story?',
      'es': '¿Te gustaría destacar un trato en tu historia?',
    },
    'bb817vi2': {
      'en': 'Add Deal',
      'es': 'Agregar oferta',
    },
    'i6w90t37': {
      'en': 'Done',
      'es': 'Agregar oferta',
    },
    '7h56woa5': {
      'en': 'Home',
      'es': '',
    },
  },
  // addStoryPage
  {
    '5f9uhtv9': {
      'en': 'Campaign Name',
      'es': 'Nombre de campaña',
    },
    'lok62mpw': {
      'en': 'Campaign Name',
      'es': 'Nombre de campaña',
    },
    '1ft47jdq': {
      'en': 'Website Link',
      'es': 'Enlace de página web',
    },
    'ewgvzio4': {
      'en': 'Campaign Name',
      'es': 'Nombre de campaña',
    },
    's2xl4pxv': {
      'en': 'https://',
      'es': 'https://',
    },
    '3iuuviir': {
      'en': 'Add Comment....',
      'es': 'Agregar comentario....',
    },
    '7y7xkdja': {
      'en': 'Video',
      'es': 'Video',
    },
    'ii9wvyqr': {
      'en': 'Add Story',
      'es': 'Agregar historia',
    },
    '862rtn8c': {
      'en': 'Add Story',
      'es': '',
    },
    '5nf94ual': {
      'en': 'Home',
      'es': '',
    },
  },
  // userProfile
  {
    'dozwcfes': {
      'en': 'Edit Profile',
      'es': 'Editar perfil',
    },
    'c2iihdt4': {
      'en': 'Following',
      'es': 'Siguiente',
    },
    '87v2092y': {
      'en': 'View all',
      'es': '',
    },
    'q3634yci': {
      'en': 'Button',
      'es': 'Botón',
    },
    'eopqvooa': {
      'en': 'Edit Profile',
      'es': '',
    },
    'q295y2bw': {
      'en': 'Orders',
      'es': '',
    },
    'zvt3165s': {
      'en': 'Wallet',
      'es': '',
    },
    'vmi9lhjx': {
      'en': 'Liked Videos',
      'es': '',
    },
    'bdaitso5': {
      'en': 'Drafts',
      'es': '',
    },
    't5b8gz96': {
      'en': 'Nearby Reviews',
      'es': '',
    },
    'guux0m1w': {
      'en': 'Bookmarked',
      'es': '',
    },
    'gv630zln': {
      'en': 'Blocked Users',
      'es': '',
    },
    '95hwejfe': {
      'en': 'Create Restaurant',
      'es': '',
    },
    '0i8ugku9': {
      'en': 'Log Out',
      'es': '',
    },
    'ndtukt0l': {
      'en': 'Delete',
      'es': '',
    },
    'ioq21w1l': {
      'en': 'Delete Account',
      'es': '',
    },
    'm41kowrm': {
      'en': 'Profile',
      'es': '',
    },
  },
  // viewProfileOther
  {
    'jwhmq2vp': {
      'en': 'Follow',
      'es': 'Seguir',
    },
    'qm8rl106': {
      'en': 'Unfollow',
      'es': 'Dejar de seguir',
    },
    'al40nzii': {
      'en': 'Following',
      'es': 'Siguiente',
    },
    'hlwr6k04': {
      'en': 'View all',
      'es': '',
    },
    'fzgypsay': {
      'en': 'Home',
      'es': '',
    },
  },
  // editProfile
  {
    '41l0g069': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    '8k481h5f': {
      'en': 'Done',
      'es': 'Hecho',
    },
    'vur78gex': {
      'en': 'Change Profile Photo',
      'es': 'Cambiar foto de perfil',
    },
    'yjxbwx95': {
      'en': 'Name',
      'es': 'Nombre',
    },
    'ybtsozrt': {
      'en': 'Username',
      'es': 'Nombre de usuario',
    },
    'gawuvie6': {
      'en': 'Email',
      'es': 'Correo electrónico',
    },
    '6mb0cuhf': {
      'en': 'Bio',
      'es': 'biografía',
    },
    'zs3pzjiw': {
      'en': 'Address:',
      'es': '',
    },
    'pu6qyvhw': {
      'en': 'Select Location',
      'es': '',
    },
    '1ilvusb9': {
      'en': 'Facebook',
      'es': 'Facebook',
    },
    'cvzvvesm': {
      'en': 'Facebook',
      'es': 'Facebook',
    },
    'y25ohtbs': {
      'en': 'Instagram',
      'es': 'Instagram',
    },
    'y5oy7614': {
      'en': 'Instagram',
      'es': 'Instagram',
    },
    '1smutidc': {
      'en': 'TikTok',
      'es': 'Tik Tok',
    },
    '6xpwraia': {
      'en': 'Tiktok',
      'es': 'Tik Tok',
    },
    'dvagngt6': {
      'en': 'Link',
      'es': 'Enlace',
    },
    'j0ih6lb9': {
      'en': 'Link',
      'es': 'Enlace',
    },
    'yywdy3z8': {
      'en': 'Edit Profile',
      'es': '',
    },
    'r6geas6l': {
      'en': 'Home',
      'es': '',
    },
  },
  // addProfileInfo
  {
    '38n0j2bo': {
      'en':
          'Fill out your profile now in order to complete setup of your profile.',
      'es':
          'Complete su perfil ahora para completar la configuración de su perfil.',
    },
    'zxeitpeu': {
      'en': 'Your Full Name',
      'es': 'Tu nombre completo',
    },
    'ezjjy6w6': {
      'en': 'UserName',
      'es': 'Nombre de usuario',
    },
    '6vkkeqvk': {
      'en': 'Bio',
      'es': '',
    },
    'kaiici3q': {
      'en': 'Your Bio',
      'es': 'tu biografía',
    },
    'kh2lbk90': {
      'en': 'You can always update your profile later.',
      'es': 'Siempre puedes actualizar tu perfil más tarde.',
    },
    'e3lvl7b8': {
      'en': 'Skip',
      'es': 'Saltar',
    },
    'p68dc9kx': {
      'en': 'Save & Continue',
      'es': 'Guardar Continuar',
    },
    '6uir9wij': {
      'en': 'Update Your Profile',
      'es': 'Actualiza tu perfil',
    },
    '8cli3yqv': {
      'en': 'Home',
      'es': '',
    },
  },
  // videoScreen
  {
    '4qf953ws': {
      'en': 'Reply',
      'es': '',
    },
    'ywhw7bps': {
      'en': 'Home',
      'es': '',
    },
  },
  // onboarding
  {
    '2qvj214b': {
      'en': 'Watch Video Reviews',
      'es': 'Ver reseñas en video',
    },
    'ov082p18': {
      'en':
          'See drool-worthy reviews of local eats. Donut forget to leave a little flavor!',
      'es':
          'Vea críticas dignas de baba de comidas locales. ¡No olvides dejar un poco de sabor!',
    },
    'vjn42wqz': {
      'en': 'Be Social',
      'es': 'Se social',
    },
    'pr5ue4dz': {
      'en':
          'Taco bout it! Socilaize with friends, followers, family, and restaurants within the app.',
      'es':
          'Taco combate! Socializa con amigos, seguidores, familiares y restaurantes dentro de la aplicación.',
    },
    'dh9tokhq': {
      'en': 'Find Restaurants',
      'es': 'Encuentra Restaurantes',
    },
    'j9lk421h': {
      'en': 'Search near, far, and Dim Sum for the best restaurants in town.',
      'es':
          'Busque cerca, lejos y Dim Sum los mejores restaurantes de la ciudad.',
    },
    'olq2yawq': {
      'en': 'Skip',
      'es': 'Saltar',
    },
    '6dq21n97': {
      'en': 'Home',
      'es': '',
    },
  },
  // storyDetails
  {
    'w7zewz7t': {
      'en': 'Learn More',
      'es': 'Aprende más',
    },
    'hb5ivfjf': {
      'en': 'Home',
      'es': '',
    },
  },
  // chatUser
  {
    '51j86tbj': {
      'en': 'Main Chat',
      'es': '',
    },
    'q3mrx8nb': {
      'en': 'Home',
      'es': '',
    },
  },
  // chatMain
  {
    'wpkl0pin': {
      'en': 'All Chats',
      'es': '',
    },
    'rphnwa9o': {
      'en': 'Chat',
      'es': '',
    },
  },
  // searchUsers
  {
    'qlb97vcb': {
      'en': 'Search users...',
      'es': '',
    },
    'fo5gslji': {
      'en': 'All Users',
      'es': '',
    },
    'q12c6nwt': {
      'en': 'Users',
      'es': '',
    },
  },
  // following
  {
    '4uxp2u13': {
      'en': 'Search following...',
      'es': '',
    },
    'rinbjsea': {
      'en': 'Following',
      'es': 'Siguiente',
    },
    '9b0vrfne': {
      'en': 'Users',
      'es': '',
    },
  },
  // editRestaurant
  {
    'qkhf6vsi': {
      'en': 'Upload Your Logo Below',
      'es': 'Cargue su logotipo a continuación',
    },
    '1ljvrl3f': {
      'en': 'Upload a Featured Image',
      'es': 'Sube una imagen destacada',
    },
    'y7bw5ala': {
      'en': 'Restaurant Location',
      'es': 'Ubicación del restaurante',
    },
    '7u0kkp8r': {
      'en': 'Restaurant Name',
      'es': 'Nombre del restaurante',
    },
    'n17hoec0': {
      'en': ' Phone Number',
      'es': 'Número de teléfono',
    },
    '793vtqym': {
      'en': 'Restaurant Address',
      'es': 'Dirección del restaurante',
    },
    'pvms2cxm': {
      'en': '123 Main St, Indianapolis, IN, 46203',
      'es': '123 Main St, Indianápolis, IN, 46203',
    },
    'o2bgiorf': {
      'en': 'Categories',
      'es': 'Categorías',
    },
    'oxcwblxr': {
      'en': 'Japanese, Asian Fusion, Sushi...',
      'es': 'Japonesa, Fusión Asiática, Sushi...',
    },
    'jkh6sgzv': {
      'en': 'Slogan',
      'es': 'Eslogan',
    },
    'ccuyyxmq': {
      'en': 'Website',
      'es': 'Sitio web',
    },
    'sk5n57lq': {
      'en': 'About Your Restaurant',
      'es': 'Acerca de su restaurante',
    },
    'jsf7rxu9': {
      'en': 'What is your restaurants \naffordability?',
      'es': '¿Cuál es la asequibilidad de sus restaurantes?',
    },
    'z9c34xqh': {
      'en': '\$',
      'es': 'PS',
    },
    'qis7h9zt': {
      'en': '\$\$',
      'es': '\$\$',
    },
    'hff0otsi': {
      'en': '\$\$\$',
      'es': '\$\$\$',
    },
    'p73jvfjj': {
      'en': '\$\$\$\$',
      'es': '\$\$\$\$',
    },
    'meg4nhjx': {
      'en': 'Accessabilities',
      'es': '',
    },
    'u2hxz8dt': {
      'en': 'Expand the list and choose all that apply.',
      'es': '',
    },
    'rbpfr5s7': {
      'en': 'Option 1',
      'es': '',
    },
    'wjhzgywg': {
      'en': 'Amentities',
      'es': '',
    },
    'gkch0hfm': {
      'en': 'Expand the list and choose all that apply.',
      'es': '',
    },
    'dhbzodjd': {
      'en': 'Option 1',
      'es': '',
    },
    'n07cij5z': {
      'en': 'Crowd',
      'es': '',
    },
    'ydkmgp4u': {
      'en': 'Expand the list and choose all that apply.',
      'es': '',
    },
    '8p0u351x': {
      'en': 'Option 1',
      'es': '',
    },
    'cl61milg': {
      'en': 'Dining Options',
      'es': '',
    },
    '3ejp0xnd': {
      'en': 'Expand the list and choose all that apply.',
      'es': '',
    },
    'hfbzkqwx': {
      'en': 'Option 1',
      'es': '',
    },
    'tnbx5c05': {
      'en': 'Highlights',
      'es': '',
    },
    't0zsbxg8': {
      'en': 'Expand the list and choose all that apply.',
      'es': '',
    },
    'jyxizube': {
      'en': 'Option 1',
      'es': '',
    },
    '1f29tg6k': {
      'en': 'Offerings',
      'es': '',
    },
    'prik31ej': {
      'en': 'Expand the list and choose all that apply.',
      'es': '',
    },
    '44mchegc': {
      'en': 'Option 1',
      'es': '',
    },
    '6ujmeovc': {
      'en': 'Payments',
      'es': '',
    },
    'cf9s9gym': {
      'en': 'Expand the list and choose all that apply.',
      'es': '',
    },
    '432p738e': {
      'en': 'Option 1',
      'es': '',
    },
    'vut9fw8v': {
      'en': 'Planning',
      'es': '',
    },
    'cpxyumsw': {
      'en': 'Expand the list and choose all that apply.',
      'es': '',
    },
    '17ofzmef': {
      'en': 'Option 1',
      'es': '',
    },
    'jwsotjes': {
      'en': 'Video Tour Link',
      'es': 'Enlace de vídeo recorrido',
    },
    't6zh7r9a': {
      'en': 'https://',
      'es': 'https://',
    },
    'mb8vzv4s': {
      'en': 'Online Order Link',
      'es': 'Enlace de pedido en línea',
    },
    'eqa83f7f': {
      'en': 'Add Restaurant',
      'es': 'Añadir restaurante',
    },
    'loe7ng5m': {
      'en': 'Edit Restaurant',
      'es': 'Editar restaurante',
    },
    '52chxjhj': {
      'en': 'Home',
      'es': '',
    },
  },
  // restaurantReviewsList
  {
    '0mc0lc7w': {
      'en': 'Reply',
      'es': '',
    },
    '9j1fe462': {
      'en': 'Home',
      'es': '',
    },
  },
  // restProfilePageCopy
  {
    'va5tw10k': {
      'en': 'Connected Restaurant:',
      'es': 'Restaurante conectado:',
    },
    'tg3szq0t': {
      'en': 'Tap for list...',
      'es': 'Toca para ver la lista...',
    },
    'ue1vczut': {
      'en': 'Stories',
      'es': 'Cuentos',
    },
    'bz48adky': {
      'en': 'Created:',
      'es': 'Creado:',
    },
    'wff39a0z': {
      'en': 'Stats',
      'es': 'Estadísticas',
    },
    'kzhdwzic': {
      'en': 'Restaurant Clicks',
      'es': 'Clics en restaurantes',
    },
    '45o0uag3': {
      'en': 'Story Clicks',
      'es': 'Clics en historias',
    },
    'xziqp7xa': {
      'en': 'Learn More Clicks',
      'es': 'Más información Clics',
    },
    'y3nmh9yu': {
      'en': 'Phone Clicks',
      'es': 'Clics telefónicos',
    },
    'x9bpyk1f': {
      'en': 'Order Now Clicks',
      'es': 'Ordenar ahora Clics',
    },
    '6ldzkqdk': {
      'en': 'Website Clicks',
      'es': 'Clics en el sitio web',
    },
    '9k6vwf04': {
      'en': 'Map Clicks',
      'es': 'Clics en el mapa',
    },
    'gscwrmme': {
      'en': 'Menu',
      'es': 'Elementos de menú',
    },
    'ut5hl020': {
      'en': 'Deals',
      'es': '',
    },
    'dgmtyhxl': {
      'en': 'Add Story',
      'es': 'Agregar historia',
    },
    '859xp5j9': {
      'en': 'Brand Manager',
      'es': 'Gerente de marca',
    },
    'hhxq3tyg': {
      'en': 'Home',
      'es': '',
    },
  },
  // phoneSignIn
  {
    'nh79nf3l': {
      'en': 'Phone Sign In',
      'es': 'Iniciar sesión en el teléfono',
    },
    'k042dmq3': {
      'en': 'Your Phone Number...',
      'es': 'Su número de teléfono...',
    },
    'z4q03qzj': {
      'en': '+1 (317) 204-2056',
      'es': '+1 (204) 204-2056',
    },
    'mwm5ejka': {
      'en': '+1',
      'es': '+1',
    },
    'me5hmggp': {
      'en': 'Sign In',
      'es': 'Iniciar sesión',
    },
    '12jih9f6': {
      'en': 'Home',
      'es': '',
    },
  },
  // phoneVerification
  {
    'l7k2h8bt': {
      'en': 'Verify Code',
      'es': 'Código de verificación',
    },
    '8jyi6wax': {
      'en': 'Enter 6 digit code here...',
      'es': 'Ingrese el código de 6 dígitos aquí...',
    },
    't7enf3nz': {
      'en': '000000',
      'es': '000000',
    },
    'zmqwlpyy': {
      'en': 'Verify',
      'es': 'Verificar',
    },
    'ojy2zpzu': {
      'en': 'Home',
      'es': '',
    },
  },
  // blockedUsers
  {
    'eek01ndl': {
      'en': 'Blocked Users',
      'es': '',
    },
    'vduykhl2': {
      'en': 'Users',
      'es': '',
    },
  },
  // storyDetailsCopy
  {
    'kxhglt0j': {
      'en': 'Learn More',
      'es': 'Aprende más',
    },
    'z8fowemy': {
      'en': 'Home',
      'es': '',
    },
  },
  // bookmarked
  {
    '33x89230': {
      'en': 'Bookmarked',
      'es': 'marcado',
    },
    'at1lvgru': {
      'en': 'Shop',
      'es': '',
    },
  },
  // videoFind
  {
    'htz1nhxs': {
      'en': 'Hey',
      'es': 'Oye',
    },
    '069rs55u': {
      'en': 'Discover Foodies',
      'es': 'Descubre los amantes de la comida',
    },
    'qyvlwwg2': {
      'en': 'Search for reviews...',
      'es': 'Buscar reseñas...',
    },
    'kur3sdi9': {
      'en': 'Nearby',
      'es': 'Cercano',
    },
    'qk7gjci7': {
      'en': 'see all...',
      'es': 'Cercano',
    },
    'eapu68jq': {
      'en': 'Recommended',
      'es': 'Recomendado',
    },
    'gtadonou': {
      'en': '#breakfast',
      'es': '#desayuno',
    },
    'gzn3dj26': {
      'en': '#lunch',
      'es': '#comida',
    },
    'uc19hf1r': {
      'en': '#dinner',
      'es': '#cena',
    },
    '99t6ylzj': {
      'en': 'Home',
      'es': '',
    },
  },
  // videoFindSearch
  {
    '5md8lscs': {
      'en': 'Hey',
      'es': 'Oye',
    },
    'ic7m8qy9': {
      'en': 'Discover Foodies',
      'es': 'Descubre los amantes de la comida',
    },
    'dydhi5e7': {
      'en': 'Search for reviews...',
      'es': 'Buscar reseñas...',
    },
    '4t9te03n': {
      'en': 'Nearby',
      'es': 'Cercano',
    },
    'v6fomt17': {
      'en': 'see all...',
      'es': 'Cercano',
    },
    '5dqzmrjc': {
      'en': 'Search Results',
      'es': 'Resultados de la búsqueda',
    },
    '8s095zqb': {
      'en': 'Home',
      'es': '',
    },
  },
  // menuItemsPage
  {
    'dju2m91l': {
      'en': 'Search the menu...',
      'es': 'Buscar restaurantes...',
    },
    '226zpomw': {
      'en': 'This restaurant\noffers online ordering',
      'es': 'Este restaurante ofrece pedidos en línea',
    },
    'jlnexwfz': {
      'en': 'ORDER NOW',
      'es': 'ORDENAR AHORA',
    },
    'rjet41e1': {
      'en': 'Featured Items',
      'es': 'Elementos destacados',
    },
    'n2o8doj5': {
      'en': 'Home',
      'es': '',
    },
  },
  // videoTour
  {
    'e15dv08s': {
      'en': 'Video Tour',
      'es': '',
    },
    'tt9fl7t6': {
      'en': 'Home',
      'es': '',
    },
  },
  // submitReviewPage
  {
    'm3i5c13r': {
      'en': 'Rate the restaurant below.',
      'es': 'Califique el restaurante a continuación.',
    },
    '79cs9tfx': {
      'en': 'What would you rate this restaurant?',
      'es': '¿Qué calificación le darías a este restaurante?',
    },
    'ryslhhgi': {
      'en': 'Share your experience....',
      'es': 'Comparte tu experiencia....',
    },
    'b7qde5sf': {
      'en':
          '**WAIT FOR YOUR UPLOADS TO APPEAR BELOW THIS LINE**\nThis may take 1-2 minutes',
      'es':
          '**ESPERE A QUE SUS CARGAS APARECEN DEBAJO DE ESTA LÍNEA** Esto puede demorar de 1 a 2 minutos',
    },
    'wthsk39m': {
      'en': 'Tell us what was great about this restaurant.',
      'es': 'Elige los 2 atributos que más te llamaron la atención.',
    },
    '682la1ai': {
      'en': '1. ',
      'es': '¿Qué calificación le darías a este restaurante?',
    },
    'ym7v3235': {
      'en': 'Amazing Food',
      'es': '',
    },
    '1mys4ovu': {
      'en': 'Very Diverse',
      'es': '',
    },
    'ldbpqzev': {
      'en': 'Highly Reccommend',
      'es': '',
    },
    'v69f4fn6': {
      'en': '2. ',
      'es': '¿Qué calificación le darías a este restaurante?',
    },
    'yu34o0di': {
      'en': 'Inclusive',
      'es': '',
    },
    'g6optee3': {
      'en': 'Friendly',
      'es': '',
    },
    'cgi2tfsu': {
      'en': 'Vibing Atmosphere',
      'es': '',
    },
    'lxskeryn': {
      'en': '3. ',
      'es': '¿Qué calificación le darías a este restaurante?',
    },
    'zrnvazp4': {
      'en': 'Great Service',
      'es': '',
    },
    'g4efn03p': {
      'en': 'Quick ',
      'es': '',
    },
    'oj80bztc': {
      'en': 'Very Comfortable',
      'es': '',
    },
    'kvhuof3u': {
      'en': 'Submit Rating',
      'es': 'Enviar calificación',
    },
    'aooe24t4': {
      'en': 'Rate Restaurant',
      'es': 'Tarifa Restaurante',
    },
    'e0rps9aq': {
      'en': 'Save',
      'es': '',
    },
    '50obvydt': {
      'en': 'Home',
      'es': '',
    },
  },
  // singleItem
  {
    'ofc0057p': {
      'en': 'Start New Order',
      'es': 'Orden de inicio',
    },
    '9q41l2h4': {
      'en': 'Add',
      'es': 'Orden de inicio',
    },
    'zjedxchi': {
      'en': 'About Restaurant',
      'es': 'Acerca del Restaurante',
    },
    'nxu4f3ex': {
      'en': 'Other Items',
      'es': 'Otros elementos',
    },
    '0kyhoj5f': {
      'en': 'Home',
      'es': '',
    },
  },
  // reviewRating
  {
    'lnfrf2ig': {
      'en': 'Do you want to add menu items from this restaurant?',
      'es': '¿Quieres añadir elementos de menú de este restaurante?',
    },
    'e5lzjjon': {
      'en': 'Yes',
      'es': 'sí',
    },
    'znrt3y8t': {
      'en': 'No',
      'es': 'No',
    },
    '87igbrdc': {
      'en': 'Your most recent review is below.',
      'es': 'Su revisión más reciente se encuentra a continuación.',
    },
    '54ppf5k2': {
      'en': 'Home',
      'es': '',
    },
  },
  // groupChatPage
  {
    'kkvh1ilu': {
      'en': 'Search for friends...',
      'es': 'Buscar amigos...',
    },
    'nbs3sn36': {
      'en': 'Create Chat',
      'es': 'Crear chat',
    },
    'cz89i56m': {
      'en': 'Group Chat',
      'es': '',
    },
    '2yucc75v': {
      'en': 'Home',
      'es': '',
    },
  },
  // addChatUsers
  {
    'wmg3vj2s': {
      'en': 'Search for friends...',
      'es': 'Buscar amigos...',
    },
    '7tnvleqj': {
      'en': 'Invite to Chat',
      'es': 'Invitar a chatear',
    },
    '6fte7nvq': {
      'en': 'Invite to Chat',
      'es': 'Invitar a chatear',
    },
    'moz7dq1e': {
      'en': 'Home',
      'es': '',
    },
  },
  // statsPage
  {
    '7pk1vd7h': {
      'en': 'Orders',
      'es': '',
    },
    'z5841ejb': {
      'en': 'Stories',
      'es': 'Cuentos',
    },
    '3fx9dsdu': {
      'en': 'Created:',
      'es': 'Creado:',
    },
    'qhtwp2f5': {
      'en': 'Stats',
      'es': 'Estadísticas',
    },
    'wwtlrnf8': {
      'en': 'Restaurant Clicks',
      'es': 'Clics en restaurantes',
    },
    'vlqhfk1m': {
      'en': 'Story Clicks',
      'es': 'Clics en historias',
    },
    '8llzk7hp': {
      'en': 'Learn More Clicks',
      'es': 'Más información Clics',
    },
    'gxog58gj': {
      'en': 'Phone Clicks',
      'es': 'Clics telefónicos',
    },
    'ld0w6be7': {
      'en': 'Order Now Clicks',
      'es': 'Ordenar ahora Clics',
    },
    'k6w5rhzv': {
      'en': 'Website Clicks',
      'es': 'Clics en el sitio web',
    },
    'wlsaib6b': {
      'en': 'Map Clicks',
      'es': 'Clics en el mapa',
    },
    'q4npmen2': {
      'en': 'Menu',
      'es': 'Elementos de menú',
    },
    'bcfcax6t': {
      'en': 'Deals',
      'es': '',
    },
    'inwnfyfw': {
      'en': 'Home',
      'es': '',
    },
  },
  // shoppingCart
  {
    'ut5qbqkx': {
      'en': 'This is an order for restaurant:',
      'es': 'Este es un pedido para el restaurante:',
    },
    'yvcdshqp': {
      'en': 'delivery fee',
      'es': '',
    },
    'e8rzqfar': {
      'en': 'delivery time',
      'es': '',
    },
    'kkmr75ij': {
      'en': 'Delivery Location:',
      'es': '',
    },
    'xokzo10e': {
      'en': 'Pickup',
      'es': 'Levantar',
    },
    'sn7v7bn1': {
      'en': 'Delivery',
      'es': '',
    },
    'heceuqwj': {
      'en': 'Pickup',
      'es': '',
    },
    'u31clh7f': {
      'en': '*Delivery Not Available',
      'es': '',
    },
    'vpax0hxc': {
      'en': 'Order Summary',
      'es': 'Resumen del pedido',
    },
    'r914y6lt': {
      'en': 'Subtotal',
      'es': 'Total parcial',
    },
    'dohdaqs4': {
      'en': 'Tax',
      'es': 'Impuesto',
    },
    '40tat5wu': {
      'en': 'Delivery',
      'es': 'Entrega',
    },
    'ehmjcars': {
      'en': 'Total',
      'es': 'Total',
    },
    'szjn0gxf': {
      'en': 'Proceed to Checkout',
      'es': 'Pasar por la caja',
    },
    '4nkoo7m9': {
      'en': 'My Bag',
      'es': 'Carro',
    },
    'zo0ebtfd': {
      'en': 'Home',
      'es': '',
    },
  },
  // addMenuItem
  {
    'ge26s6rx': {
      'en': 'Add Menu Item',
      'es': 'Agregar elemento de menú',
    },
    'wunr2hzj': {
      'en': 'Fill out the details below to add a new menu item.',
      'es':
          'Complete los detalles a continuación para agregar un nuevo elemento de menú.',
    },
    'fpdlk1kq': {
      'en': 'Featured?',
      'es': '¿Presentado?',
    },
    'qilmv67x': {
      'en': 'Item Name',
      'es': 'Nombre del árticulo',
    },
    'lp0addvy': {
      'en': 'Enter your task here....',
      'es': 'Ingrese su tarea aquí....',
    },
    'yd18kbos': {
      'en': 'Item Description',
      'es': 'Descripción del Artículo',
    },
    'xln6aefz': {
      'en': 'Enter a description here...',
      'es': 'Introduce una descripción aquí...',
    },
    'k44n3nl5': {
      'en': 'Item Price',
      'es': 'Precio del articulo',
    },
    'd6mr66lm': {
      'en': 'Enter your price here....',
      'es': 'Ingrese su precio aquí....',
    },
    'u7zapoui': {
      'en': 'Back',
      'es': 'atrás',
    },
    'd02o7pl7': {
      'en': 'Done',
      'es': 'Hecho',
    },
    'o5bcfy0a': {
      'en': 'List of menu items',
      'es': 'Lista de elementos del menú',
    },
    '2ll4yp40': {
      'en': 'Add Mod',
      'es': 'Añadir mod',
    },
    '71kobpkk': {
      'en': 'Add Menu Item',
      'es': '',
    },
    'tc94mkm9': {
      'en': 'Home',
      'es': '',
    },
  },
  // addModifier
  {
    'cntn8chk': {
      'en': 'Add A Modifier',
      'es': 'Agregar un modificador',
    },
    'vq4pgkr5': {
      'en':
          'Add a modifier and click the green check mark.\n\nEx: Size, Type of meat, Add-ons etc.',
      'es':
          'Agregue un modificador y haga clic en la marca de verificación verde. Ej: tamaño, tipo de carne, complementos, etc.',
    },
    'pfy72sic': {
      'en': 'Modifier name',
      'es': 'Nombre del modificador',
    },
    'wk8fnedb': {
      'en': 'Enter your task here....',
      'es': 'Ingrese su tarea aquí....',
    },
    '8q4f1i41': {
      'en': 'Back',
      'es': 'atrás',
    },
    'ugc1ey06': {
      'en': 'Add Options',
      'es': 'Añadir opciones',
    },
    'b0maj57h': {
      'en': 'List of modifiers',
      'es': 'Lista de modificadores',
    },
    'ocqe14nk': {
      'en': 'Home',
      'es': '',
    },
  },
  // addOption
  {
    'co599vm6': {
      'en': 'Add an Option',
      'es': 'Agregar una opción',
    },
    'iqc13yvb': {
      'en':
          '1. Choose the modifier\n2. Input price for this option\n3. Input option name\n4. Click the green check mark',
      'es':
          '1. Elija el modificador 2. Ingrese el precio para esta opción 3. Ingrese el nombre de la opción 4. Haga clic en la marca de verificación verde',
    },
    'xepeigtg': {
      'en': 'Option 1',
      'es': 'Opción 1',
    },
    'utugqnyf': {
      'en': 'Option Price',
      'es': 'Precio de opción',
    },
    'n99bor82': {
      'en': 'Enter your task here....',
      'es': 'Ingrese su tarea aquí....',
    },
    'exi3zag1': {
      'en': 'Option name',
      'es': 'Nombre de la opción',
    },
    'qmka9121': {
      'en': 'Enter your task here....',
      'es': 'Ingrese su tarea aquí....',
    },
    '8avuojfv': {
      'en': 'Back',
      'es': 'atrás',
    },
    'n0evp4cv': {
      'en': 'Done',
      'es': 'Hecho',
    },
    'ml30k0d5': {
      'en': 'List of options',
      'es': 'Lista de opciones',
    },
    'pisqqobh': {
      'en': 'Home',
      'es': '',
    },
  },
  // order
  {
    '0g3q5a5w': {
      'en': 'Home',
      'es': '',
    },
  },
  // dealPage
  {
    'l572ekc9': {
      'en': 'Deals & Discounts',
      'es': 'Ofertas y descuentos',
    },
    'adz1tztn': {
      'en': 'Featured',
      'es': 'Presentado',
    },
    '67f2zhs9': {
      'en': 'Within 10 miles',
      'es': 'Dentro de 10 millas',
    },
    '81lamctt': {
      'en': 'Home',
      'es': '',
    },
  },
  // restDealPage
  {
    'aycj37fp': {
      'en': 'Deals & Discounts',
      'es': 'Ofertas y descuentos',
    },
    '3mnaije1': {
      'en': 'Featured',
      'es': 'Presentado',
    },
    'wu9jiqxs': {
      'en': 'Current Deals',
      'es': 'Ofertas actuales',
    },
    '7zbuqaib': {
      'en': 'Home',
      'es': '',
    },
  },
  // nearbyVideoPage
  {
    'a7f07ain': {
      'en': 'Home',
      'es': '',
    },
  },
  // singleVideoPage
  {
    '7a31neeg': {
      'en': 'Reply',
      'es': '',
    },
    'z57hn3w0': {
      'en': 'Home',
      'es': '',
    },
  },
  // searchMenuItems
  {
    '5p9f8wao': {
      'en': 'Search  menu...',
      'es': 'Buscar restaurantes...',
    },
    '1up9ko6u': {
      'en': 'This restaurant\noffers digital ordering',
      'es': 'Este restaurante ofrece pedidos en línea',
    },
    'dbhlutpa': {
      'en': 'ORDER NOW',
      'es': 'ORDENAR AHORA',
    },
    'wz50se4b': {
      'en': 'Search Results',
      'es': '',
    },
    '9npp8e1x': {
      'en': 'Featured Items',
      'es': 'Elementos destacados',
    },
    'ivgj6ttd': {
      'en': 'Home',
      'es': '',
    },
  },
  // likedVideos
  {
    '7i54k28h': {
      'en': 'Flavored Videos',
      'es': '',
    },
    '5fn12i8t': {
      'en': 'Home',
      'es': '',
    },
  },
  // createRestaurant
  {
    'q4ah7ip8': {
      'en': 'Upload Your Logo Below',
      'es': 'Cargue su logotipo a continuación',
    },
    'm49bkrur': {
      'en': 'Upload a Featured Image',
      'es': 'Sube una imagen destacada',
    },
    'ny252bxp': {
      'en': 'Restaurant Location',
      'es': 'Ubicación del restaurante',
    },
    '920ihtwt': {
      'en': 'Restaurant Name',
      'es': 'Nombre del restaurante',
    },
    'hbwj1ny2': {
      'en': ' Phone Number',
      'es': 'Número de teléfono',
    },
    '79wtku8q': {
      'en': 'Restaurant Address',
      'es': 'Dirección del restaurante',
    },
    'c757h358': {
      'en': '123 Main St, Indianapolis, IN, 46203',
      'es': '123 Main St, Indianápolis, IN, 46203',
    },
    'thre1ol2': {
      'en': 'Categories',
      'es': 'Categorías',
    },
    '1za6whdp': {
      'en': 'Japanese, Asian Fusion, Sushi...',
      'es': 'Japonesa, Fusión Asiática, Sushi...',
    },
    'ol6w6pja': {
      'en': 'Slogan',
      'es': 'Eslogan',
    },
    'jyzbt1t4': {
      'en': 'Website',
      'es': 'Sitio web',
    },
    'oi9suiwy': {
      'en': 'https://',
      'es': '',
    },
    '0wwjmo7i': {
      'en': 'About Your Restaurant',
      'es': 'Acerca de su restaurante',
    },
    'w7zun1qs': {
      'en': 'What is your restaurants \naffordability?',
      'es': '¿Cuál es la asequibilidad de sus restaurantes?',
    },
    'bms5bnpg': {
      'en': '\$',
      'es': 'PS',
    },
    'b6toq6b8': {
      'en': '\$\$',
      'es': '\$\$',
    },
    '4ur5li9p': {
      'en': '\$\$\$',
      'es': '\$\$\$',
    },
    'g1kf6tib': {
      'en': '\$\$\$\$',
      'es': '\$\$\$\$',
    },
    'ylvbrr34': {
      'en': '',
      'es': '',
    },
    '7bp19hcg': {
      'en': 'Video Tour Link',
      'es': 'Enlace de vídeo recorrido',
    },
    '7kvy9a37': {
      'en': 'https://',
      'es': 'https://',
    },
    't5wkqxsy': {
      'en': 'Online Order Link',
      'es': 'Enlace de pedido en línea',
    },
    '3n2odx5c': {
      'en': 'Create Restaurant',
      'es': 'Añadir restaurante',
    },
    'm4aqp0ul': {
      'en': 'Create Restaurant',
      'es': 'Editar restaurante',
    },
    'co6qwlrl': {
      'en': 'Home',
      'es': '',
    },
  },
  // inAppStartOrder
  {
    'm44x8x1m': {
      'en': 'delivery fee',
      'es': '',
    },
    'xihysat3': {
      'en': 'delivery time',
      'es': '',
    },
    'auw5opaj': {
      'en': 'Pickup',
      'es': 'Levantar',
    },
    'glqsjmso': {
      'en': 'Delivery',
      'es': '',
    },
    'eztxdlsq': {
      'en': 'Pickup',
      'es': '',
    },
    '1xv2odyh': {
      'en': '*Delivery Not Available',
      'es': '',
    },
    '6wu5279v': {
      'en': 'Search  menu...',
      'es': 'Buscar restaurantes...',
    },
    '6fyrrrw2': {
      'en': 'Featured Items',
      'es': 'Elementos destacados',
    },
    'mdgbdp16': {
      'en': 'view my bag',
      'es': '',
    },
    '37d9uhfq': {
      'en': 'Restaurant Name',
      'es': '',
    },
    '0r185c0w': {
      'en': 'Home',
      'es': '',
    },
  },
  // curatedListSwipe
  {
    '036au228': {
      'en': 'Recent reviews',
      'es': '',
    },
    'dd1vtmq5': {
      'en': 'Hours',
      'es': 'Horas',
    },
    'enxjdxbo': {
      'en': 'Monday',
      'es': 'lunes',
    },
    '0h4i9ob0': {
      'en': 'Tuesday',
      'es': 'martes',
    },
    '071m631c': {
      'en': 'Wednesday',
      'es': 'miércoles',
    },
    'ngcoo6j5': {
      'en': 'Thursday',
      'es': 'jueves',
    },
    'n9nigfde': {
      'en': 'Friday',
      'es': 'viernes',
    },
    '3z15rkdu': {
      'en': 'Saturday',
      'es': 'sábado',
    },
    'ae9idk6j': {
      'en': 'Sunday',
      'es': 'domingo',
    },
    'j6h1bsq6': {
      'en': 'Features Available',
      'es': 'Funciones disponibles',
    },
    '6u8wwux0': {
      'en': 'Mobile Rewards',
      'es': 'Recompensas móviles',
    },
    'b9gkpj2z': {
      'en': 'Takeout',
      'es': 'Sacar',
    },
    '7lhskfuc': {
      'en': 'Delivery',
      'es': 'Entrega',
    },
    'b74idnyg': {
      'en': 'Wifi',
      'es': 'Wifi',
    },
    '6nxlnxa5': {
      'en': 'Reservations',
      'es': 'Reservas',
    },
    'd49rvgsw': {
      'en': 'Standalone',
      'es': 'Ser único',
    },
    'xp85y7h9': {
      'en': 'Table Service',
      'es': 'Servicio de mesa',
    },
    'kqx1ziqz': {
      'en': 'Happy Hour',
      'es': 'Hora feliz',
    },
    'iezzf7lv': {
      'en': 'Birthday Freebies',
      'es': 'regalos de cumpleaños',
    },
    '89yijfdw': {
      'en': 'Featured Menu Items',
      'es': 'Elementos de menú destacados',
    },
    '4an1i9y6': {
      'en': 'Home',
      'es': '',
    },
  },
  // nearbyRestaurants
  {
    'sqxyatdc': {
      'en': 'Nearby Restaurants',
      'es': '',
    },
    'tqwxloiq': {
      'en': 'Shop',
      'es': '',
    },
  },
  // curatedListPage
  {
    '9l5v18gi': {
      'en': '',
      'es': '',
    },
    '485b361b': {
      'en': 'sweets, date nights, the best...',
      'es': '',
    },
    'h6x97wez': {
      'en': 'Explore Top Foodie \nSpots in Indy',
      'es': '',
    },
    'hf5c0opi': {
      'en': 'Experience Top Notch Spots',
      'es': '',
    },
    'fn0o2om7': {
      'en': 'Chosen by your local community',
      'es': '',
    },
    'uwcoitnx': {
      'en': 'Your Results',
      'es': '',
    },
    'wqa6s6un': {
      'en': 'Discover',
      'es': '',
    },
  },
  // restaurantOrders
  {
    'foawwdqe': {
      'en': 'Received',
      'es': '',
    },
    'e76q15la': {
      'en': 'Preparing',
      'es': '',
    },
    'mhusi4ec': {
      'en': 'Completed',
      'es': '',
    },
    '2r0m5r1i': {
      'en': 'Received',
      'es': '',
    },
    'bak82h7x': {
      'en': 'Received',
      'es': '',
    },
    'nrp4putz': {
      'en': 'Paid',
      'es': '',
    },
    'ukzw7qwc': {
      'en': 'Preparing',
      'es': '',
    },
    '98ec8gm9': {
      'en': 'Preparing',
      'es': '',
    },
    'ozu6kd1f': {
      'en': 'Paid',
      'es': '',
    },
    'dylkj99e': {
      'en': 'Complete',
      'es': '',
    },
    'dfuwoi4k': {
      'en': 'Ready/Complete',
      'es': '',
    },
    'pa2l46ek': {
      'en': 'Paid',
      'es': '',
    },
    '9244aitk': {
      'en': 'Our Orders',
      'es': '',
    },
    'pavrttm9': {
      'en': 'Home',
      'es': '',
    },
  },
  // orderTransactions
  {
    'xuzvarxo': {
      'en': 'Active',
      'es': '',
    },
    'cizoefnt': {
      'en': 'Completed',
      'es': '',
    },
    's3vxa02g': {
      'en': 'Order History',
      'es': '',
    },
    'aebr4v5f': {
      'en': 'Home',
      'es': '',
    },
  },
  // wallet
  {
    '9gj0etpd': {
      'en': 'Lifetime',
      'es': 'Toda la vida',
    },
    '5lar9bk9': {
      'en': '****',
      'es': '',
    },
    'nhvwqjte': {
      'en': 'Available',
      'es': 'Este mes',
    },
    'czhjsca9': {
      'en': 'Progress',
      'es': 'Estado',
    },
    'ebsw414g': {
      'en': 'Goal',
      'es': 'Meta',
    },
    'lfahz51r': {
      'en': '10,000',
      'es': '300',
    },
    'mg78tvs2': {
      'en': 'Status',
      'es': '',
    },
    'mp26xjvd': {
      'en': 'Fizzz Coin',
      'es': 'Moneda efervescente',
    },
    'srjq4e3z': {
      'en': 'Wallet',
      'es': 'Explorar',
    },
    'zz10pyer': {
      'en': 'Cancel',
      'es': '',
    },
    '9hnw9ery': {
      'en': 'Home',
      'es': '',
    },
  },
  // orderStatus
  {
    'v6q5t9c9': {
      'en': 'This is an order for restaurant:',
      'es': 'Este es un pedido para el restaurante:',
    },
    'z86oqq9e': {
      'en': 'Order Summary',
      'es': 'Resumen del pedido',
    },
    'qwq4uvks': {
      'en': 'Subtotal',
      'es': 'Total parcial',
    },
    'wvil5rr5': {
      'en': '\$',
      'es': '[Precio]',
    },
    'mt67laej': {
      'en': 'Tax',
      'es': 'Impuesto',
    },
    'mhkixjuf': {
      'en': '\$',
      'es': '[Precio]',
    },
    'frr0w8sp': {
      'en': 'Delivery',
      'es': 'Entrega',
    },
    'c57ji2bh': {
      'en': 'Total',
      'es': 'Total',
    },
    'snsyluhr': {
      'en': '\$',
      'es': '[Total del pedido]',
    },
    '4u6tyrip': {
      'en': 'Order Status',
      'es': 'Carro',
    },
    '1krjmqbu': {
      'en': 'Home',
      'es': '',
    },
  },
  // orderSuccess
  {
    '11rdp2p2': {
      'en': 'Your Order Has Been Submitted!',
      'es': 'Tu historia ha sido agregada',
    },
    'bba7xsc8': {
      'en':
          'You will receive notifications to update you on the status of your order.',
      'es': '¿Te gustaría destacar un trato en tu historia?',
    },
    'l5u67rh7': {
      'en': 'Orders',
      'es': 'Agregar oferta',
    },
    'siudhzrd': {
      'en': 'Home',
      'es': '',
    },
  },
  // StreamsPage
  {
    'zumgdclr': {
      'en': 'Live Videos',
      'es': '',
    },
    '64bzakdh': {
      'en': 'Home',
      'es': '',
    },
  },
  // postCollage
  {
    'hcnc8tgs': {
      'en': 'Posted Reviews',
      'es': '',
    },
    '7adqm3x1': {
      'en': 'Home',
      'es': '',
    },
  },
  // gallery
  {
    'svjs0en5': {
      'en': 'Gallery',
      'es': '',
    },
    '1u1j51t0': {
      'en': 'Home',
      'es': '',
    },
  },
  // homePageTest
  {
    'o1pw258z': {
      'en': 'Home',
      'es': '',
    },
  },
  // LiveVideoPage
  {
    'klwbmc9j': {
      'en': 'Posted',
      'es': 'Al corriente',
    },
    'e2wro62i': {
      'en': 'Comment...',
      'es': '',
    },
    '6rf87n6g': {
      'en': 'Live Feed',
      'es': '',
    },
    'fxlfinhy': {
      'en': 'Home',
      'es': '',
    },
  },
  // restaurantDetails
  {
    '806bg15c': {
      'en': 'About',
      'es': 'Acerca de',
    },
    'p0os1vf1': {
      'en': 'Avg. rating',
      'es': '',
    },
    'sl4yi2xt': {
      'en': 'Reviews',
      'es': '',
    },
    '7x8qss8l': {
      'en': 'Price',
      'es': '',
    },
    'weu9n3rc': {
      'en': 'Avg. rating',
      'es': '',
    },
    'rcrs3v8k': {
      'en': 'Reviews',
      'es': '',
    },
    '9qor34u4': {
      'en': 'Price',
      'es': '',
    },
    '9p249uxe': {
      'en': 'Stories',
      'es': '',
    },
    'tnkbg3gf': {
      'en': 'About',
      'es': '',
    },
    'lsgozxjc': {
      'en': 'Location',
      'es': '',
    },
    'r55m03jp': {
      'en': 'Recommended',
      'es': 'Recomendado',
    },
    '6d3y7khj': {
      'en': 'Accessabilities',
      'es': '',
    },
    '3o5btf94': {
      'en': 'Amenities',
      'es': '',
    },
    'jg1u1skv': {
      'en': 'Crowd',
      'es': '',
    },
    '3wwxnobj': {
      'en': 'Dining Options',
      'es': '',
    },
    'sdyaz4vy': {
      'en': 'Highlights',
      'es': '',
    },
    'y9e89p84': {
      'en': 'Offerings',
      'es': '',
    },
    'bcntatqj': {
      'en': 'Payments',
      'es': '',
    },
    'dde7qlpv': {
      'en': 'Planning',
      'es': '',
    },
    'kuowja73': {
      'en': 'Featured Menu Items',
      'es': 'Recomendado',
    },
    '2qhir7v3': {
      'en': 'Reviews',
      'es': 'Reseñas',
    },
    'k4c2bsap': {
      'en': '# of Reviews',
      'es': '# de Reseñas',
    },
    'ou55vegb': {
      'en': 'Avg. Rating',
      'es': 'Promedio Clasificación',
    },
    'omqeuiy7': {
      'en': 'Menu',
      'es': 'Menú',
    },
    'eqfvuwd9': {
      'en': 'Add Course',
      'es': 'Agregar curso',
    },
    '4uic4x0b': {
      'en': 'Search menu...',
      'es': 'Buscar restaurantes...',
    },
    '83amgoty': {
      'en': 'Deals',
      'es': 'ofertas',
    },
    'ck7rh365': {
      'en': 'Add Deal',
      'es': 'Agregar oferta',
    },
    'ys3x1g8m': {
      'en': 'Deals & Discounts',
      'es': 'Ofertas y descuentos',
    },
    'zroo44cc': {
      'en': 'Home',
      'es': '',
    },
  },
  // draftVideos
  {
    'rwanjnyu': {
      'en': 'Drafts',
      'es': '',
    },
    '802i3cf0': {
      'en': 'Home',
      'es': '',
    },
  },
  // profileHome
  {
    'r2ehjzv4': {
      'en': 'Switch to Dark Mode',
      'es': '',
    },
    'v46thimt': {
      'en': 'Switch to Light Mode',
      'es': '',
    },
    'ehh539im': {
      'en': 'Account',
      'es': '',
    },
    'htyugot9': {
      'en': 'Notification Settings',
      'es': '',
    },
    '5hsg41rb': {
      'en': 'Edit Profile',
      'es': '',
    },
    'j6xhlxmv': {
      'en': 'General',
      'es': '',
    },
    '4gr6obyd': {
      'en': 'Support',
      'es': '',
    },
    'f34g6xzr': {
      'en': 'Terms of Service',
      'es': '',
    },
    'x5x0363p': {
      'en': 'Invite Friends',
      'es': '',
    },
    'dz2cmgip': {
      'en': 'Profile',
      'es': '',
    },
    'ni39cci4': {
      'en': 'Home',
      'es': '',
    },
  },
  // toggleNotifications
  {
    'e0ydgtl3': {
      'en':
          'Choose what notifcations you want to recieve below and we will update the settings.',
      'es': '',
    },
    'vk9ffct9': {
      'en': 'Push Notifications',
      'es': '',
    },
    'qlp7awm5': {
      'en':
          'Receive Push notifications from our application on a semi regular basis.',
      'es': '',
    },
    'f3mmrrfi': {
      'en': 'Email Notifications',
      'es': '',
    },
    '0ucriqi6': {
      'en':
          'Receive email notifications from our marketing team about new features.',
      'es': '',
    },
    'lh1yl6wp': {
      'en': 'Location Services',
      'es': '',
    },
    'iowwuoz9': {
      'en':
          'Allow us to track your location, this helps keep track of spending and keeps you safe.',
      'es': '',
    },
    'i4c3zn8k': {
      'en': 'Settings',
      'es': '',
    },
  },
  // indyOnly
  {
    'nvogr7bm': {
      'en': 'Currently, we are ONLY in the INDY area!',
      'es': '',
    },
    'm9tzcsic': {
      'en': 'Stay tuned for as we add more cities',
      'es': '',
    },
    'wbv18x8l': {
      'en': 'Home',
      'es': '',
    },
  },
  // deleteStory
  {
    'dm5c72gf': {
      'en': 'Delete Story',
      'es': 'Eliminar historia',
    },
    '3th5b4hv': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
  },
  // comments
  {
    'cnbzz7qy': {
      'en': 'Comments',
      'es': 'Comentarios',
    },
    '8u9eu9zs': {
      'en': 'Posted',
      'es': 'Al corriente',
    },
    '7hwbbwfq': {
      'en': 'Comment here...',
      'es': 'Comenta aquí...',
    },
    '6p9t269w': {
      'en': 'Post',
      'es': 'Correo',
    },
  },
  // descriptionSheet
  {
    'tcj2npoj': {
      'en': 'Highlights',
      'es': 'Reflejos',
    },
  },
  // flagVideo
  {
    'm1vlk3lx': {
      'en': 'Flag Video',
      'es': 'Marcar vídeo',
    },
    'pwa7knb3': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
  },
  // flagStory
  {
    'i97ghjlc': {
      'en': 'Flag Video',
      'es': 'Marcar vídeo',
    },
    'uh6dwlg4': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
  },
  // deletePost
  {
    '73lrfw7j': {
      'en': 'Delete Post',
      'es': 'Eliminar mensaje',
    },
    'vupr1x5q': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
  },
  // editReview
  {
    'y1t978r0': {
      'en': 'Edit Review',
      'es': 'Editar revisión',
    },
    '6t05gvar': {
      'en': 'Rate the restaurant below.',
      'es': 'Califique el restaurante a continuación.',
    },
    'vg1mr24o': {
      'en': 'What would you rate this restaurant?',
      'es': '¿Qué calificación le darías a este restaurante?',
    },
    'e20ycss6': {
      'en': 'Share your experience....',
      'es': 'Comparte tu experiencia....',
    },
    '9zp5di7a': {
      'en': 'Edit Review',
      'es': 'Editar revisión',
    },
  },
  // commentsCopy
  {
    'iybxfe74': {
      'en': 'Comments',
      'es': 'Comentarios',
    },
    '818x7txx': {
      'en': 'Posted',
      'es': 'Al corriente',
    },
    'jhwb7epu': {
      'en': 'Comment here...',
      'es': 'Comenta aquí...',
    },
    'jbfe5eab': {
      'en': 'Post',
      'es': 'Correo',
    },
  },
  // addMenuCourse
  {
    'qunhzf4a': {
      'en': 'Menu Course',
      'es': 'Menú Curso',
    },
    'mb7db7uq': {
      'en': '[Some hint text...]',
      'es': '[Algún texto de pista...]',
    },
    '28s7tqs6': {
      'en': 'Course Description',
      'es': 'Descripción del curso',
    },
    '579cldxs': {
      'en': '[Some hint text...]',
      'es': '[Algún texto de pista...]',
    },
    '2pwee89s': {
      'en': 'Add',
      'es': 'Agregar',
    },
  },
  // menuItemAdd
  {
    'qvrgqhpa': {
      'en': 'Add Menu Item',
      'es': 'Agregar elemento de menú',
    },
    'h7y4j6m7': {
      'en': 'Fill out the details below to add a new menu item.',
      'es':
          'Complete los detalles a continuación para agregar un nuevo elemento de menú.',
    },
    'mzvolv33': {
      'en': 'Featured?',
      'es': '¿Presentado?',
    },
    'd8ygrqr2': {
      'en': 'Item Name',
      'es': 'Nombre del árticulo',
    },
    'al19dzsm': {
      'en': 'Enter your task here....',
      'es': 'Ingrese su tarea aquí....',
    },
    'ggjbxnpt': {
      'en': 'Item Description',
      'es': 'Descripción del Artículo',
    },
    'a8rb9d5j': {
      'en': 'Enter a description here...',
      'es': 'Introduce una descripción aquí...',
    },
    'sjudsrmf': {
      'en': 'Item Price',
      'es': 'Precio del articulo',
    },
    'cig23d2m': {
      'en': 'Enter your price here....',
      'es': 'Ingrese su precio aquí....',
    },
    'pu3p3rfe': {
      'en': 'Done',
      'es': 'Hecho',
    },
    '9prpa89e': {
      'en': 'Add Mod',
      'es': 'Añadir mod',
    },
  },
  // itemLook
  {
    'yhgbyt9c': {
      'en': 'Special Instructions',
      'es': 'instrucciones especiales',
    },
    'ntmimgiy': {
      'en': 'Add',
      'es': 'Agregar',
    },
  },
  // addMenuToPost
  {
    'totzsitj': {
      'en': 'Add Items',
      'es': 'Agregar elementos',
    },
    'ki0vldlo': {
      'en': 'Done',
      'es': 'Hecho',
    },
  },
  // addMenuCart
  {
    'mg9fns59': {
      'en': 'Items in video',
      'es': 'elementos en video',
    },
    '7xlneyyg': {
      'en': 'Start New Order',
      'es': 'Orden de inicio',
    },
    '99jc26ra': {
      'en': 'Continue Order',
      'es': 'Orden de inicio',
    },
  },
  // editmMenuItemAdd
  {
    'nqfb6ajs': {
      'en': 'Add Menu Item',
      'es': 'Agregar elemento de menú',
    },
    'fb513hjz': {
      'en': 'Fill out the details below to add a new menu item.',
      'es':
          'Complete los detalles a continuación para agregar un nuevo elemento de menú.',
    },
    'kkpp4xkr': {
      'en': 'Option 1',
      'es': 'Opción 1',
    },
    'aep5kqml': {
      'en': 'Featured?',
      'es': '¿Presentado?',
    },
    'mvfronz5': {
      'en': 'Item Name',
      'es': 'Nombre del árticulo',
    },
    '0ot9we3k': {
      'en': 'Enter your task here....',
      'es': 'Ingrese su tarea aquí....',
    },
    's6smmdfz': {
      'en': 'Item Description',
      'es': 'Descripción del Artículo',
    },
    '6cp3cbn4': {
      'en': 'Enter a description here...',
      'es': 'Introduce una descripción aquí...',
    },
    'cdecavj9': {
      'en': 'Item Price',
      'es': 'Precio del articulo',
    },
    '9fnbzcg7': {
      'en': 'Enter your price here....',
      'es': 'Ingrese su precio aquí....',
    },
    'cu1gh2k7': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    'vcw8mnns': {
      'en': 'Add Item',
      'es': 'Añadir artículo',
    },
  },
  // editMenuCourse
  {
    'kvkynkl9': {
      'en': 'Menu Course',
      'es': 'Menú Curso',
    },
    'yqopvnca': {
      'en': '[Some hint text...]',
      'es': '[Algún texto de pista...]',
    },
    'ps84g7oa': {
      'en': 'Course Description',
      'es': 'Descripción del curso',
    },
    'b7nb2q8t': {
      'en': '[Some hint text...]',
      'es': '[Algún texto de pista...]',
    },
    'psasr1js': {
      'en': 'Add',
      'es': 'Agregar',
    },
  },
  // editMenuItem
  {
    'qdowe7kq': {
      'en': 'Add Menu Item',
      'es': 'Agregar elemento de menú',
    },
    'iu9kj40j': {
      'en': 'Fill out the details below to add a new menu item.',
      'es':
          'Complete los detalles a continuación para agregar un nuevo elemento de menú.',
    },
    '47pifm1i': {
      'en': 'Featured?',
      'es': '¿Presentado?',
    },
    'dlcgvng6': {
      'en': 'Item Name',
      'es': 'Nombre del árticulo',
    },
    'qzek7qqx': {
      'en': 'Enter your item here....',
      'es': 'Ingrese su artículo aquí....',
    },
    'dcd8nuwu': {
      'en': 'Item Description',
      'es': 'Descripción del Artículo',
    },
    '03yrw0ho': {
      'en': 'Enter a description here...',
      'es': 'Introduce una descripción aquí...',
    },
    'mei09mdb': {
      'en': 'Item Price',
      'es': 'Precio del articulo',
    },
    'csgueex9': {
      'en': 'Enter your price here....',
      'es': 'Ingrese su precio aquí....',
    },
    '4dqvo2qw': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    'ezfl9314': {
      'en': 'Add Item',
      'es': 'Añadir artículo',
    },
  },
  // menuItemCard
  {
    '2lg2xroh': {
      'en': 'Hello World',
      'es': 'Hola Mundo',
    },
    't09d1td9': {
      'en': 'Hello World',
      'es': 'Hola Mundo',
    },
  },
  // addOptionSheet
  {
    '1cyrad2v': {
      'en': 'Add Item Modifier #1',
      'es': 'Añadir modificador de artículo n.º 1',
    },
    'jkjhlp42': {
      'en':
          '1. Input Modfier Title (Size, Type etc)\n2. Input price for this modifier\n3. Input options name\n4. Click \"Add Option\" button\n5. Green check mark will appear (click to add more options)',
      'es':
          '1. Ingrese el título del modificador (tamaño, tipo, etc.) 2. Ingrese el precio para este modificador 3. Ingrese el nombre de las opciones 4. Haga clic en el botón &quot;Agregar opción&quot; 5. Aparecerá una marca de verificación verde (haga clic para agregar más opciones)',
    },
    'sw50edrx': {
      'en': 'Modifier Title',
      'es': 'Título del modificador',
    },
    'to7pmihn': {
      'en': 'Enter your task here....',
      'es': 'Ingrese su tarea aquí....',
    },
    'qcn76boo': {
      'en': 'Modifier Price',
      'es': 'Precio del modificador',
    },
    '7g55vien': {
      'en': 'Enter your task here....',
      'es': 'Ingrese su tarea aquí....',
    },
    'yyd1dwek': {
      'en': 'Option name',
      'es': 'Nombre de la opción',
    },
    '7884em51': {
      'en': 'Enter your task here....',
      'es': 'Ingrese su tarea aquí....',
    },
    'xliy8s6z': {
      'en': 'Back',
      'es': 'atrás',
    },
    'lsjbxfn2': {
      'en': 'Add Option',
      'es': 'Añadir opción',
    },
    'jffcjemj': {
      'en': 'Add Modifier #2',
      'es': 'Agregar modificador #2',
    },
    'f2kby5jj': {
      'en': 'Back',
      'es': 'atrás',
    },
    'doxomfmb': {
      'en': 'Add Option',
      'es': 'Añadir opción',
    },
  },
  // pickupDelivery
  {
    'ma38g1oe': {
      'en': 'Pickup',
      'es': 'Entrega',
    },
    'wdwquanf': {
      'en': 'Delivery',
      'es': '',
    },
  },
  // deals
  {
    '5r03fm32': {
      'en': 'Expiring Soon',
      'es': 'Expirará pronto',
    },
    'a3oyv7ri': {
      'en': 'Current Offers',
      'es': 'Ofertas Actuales',
    },
  },
  // dealPopup
  {
    'kynjwrf1': {
      'en': 'CONDITIONS:',
      'es': 'CONDICIONES:',
    },
    'e0ovrhe2': {
      'en': 'CODE:',
      'es': 'CÓDIGO:',
    },
    '5vxutdu7': {
      'en': 'SAVE',
      'es': 'AHORRAR',
    },
  },
  // addDeal
  {
    'ugbjtheh': {
      'en': 'Deal Title',
      'es': 'Título del trato',
    },
    'rnvmemyk': {
      'en': '10% off, FREE Taco etc,.',
      'es': '10% de descuento, Taco GRATIS, etc.',
    },
    'kf7a2pl2': {
      'en': 'Active',
      'es': 'Activo',
    },
    'mskjdhcc': {
      'en': 'Details',
      'es': 'Detalles',
    },
    'fxuj86ic': {
      'en': 'Conditions',
      'es': 'Condiciones',
    },
    'm6kwjtmp': {
      'en': '10% off, FREE Taco etc,.',
      'es': '10% de descuento, Taco GRATIS, etc.',
    },
    'uq12whdb': {
      'en': 'Code',
      'es': 'Código',
    },
    'hfxia8o9': {
      'en': '10% off, FREE Taco etc,.',
      'es': '10% de descuento, Taco GRATIS, etc.',
    },
    '1wbyz0ty': {
      'en': 'Expiry Date',
      'es': 'Fecha de caducidad',
    },
    'qvwabcz2': {
      'en': 'Needs Redeemed',
      'es': 'necesidades redimidas',
    },
    'qceko6ml': {
      'en': 'Add',
      'es': 'Agregar',
    },
  },
  // dealPopupCopy
  {
    'c06lrs0y': {
      'en': 'CONDITIONS:',
      'es': 'CONDICIONES:',
    },
    '3l4rek2w': {
      'en': 'CODE:',
      'es': 'CÓDIGO:',
    },
    'nxino3ax': {
      'en': 'REDEEM',
      'es': 'REDIMIR',
    },
  },
  // giftorbuy
  {
    'i2jlucn5': {
      'en': 'Gift',
      'es': 'Regalo',
    },
    '0ulvon2s': {
      'en': 'Buy',
      'es': 'Comprar',
    },
    'dt35hbl5': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
  },
  // giftFizzzCopy
  {
    'e5ylwjvo': {
      'en': 'Buy Fizzz Coin',
      'es': 'Comprar moneda Fizzz',
    },
    '3ydeu0hr': {
      'en': 'Enter Amount',
      'es': '',
    },
    'cly41qah': {
      'en': 'Pro Plan',
      'es': 'Plan profesional',
    },
    '5oa8qhp4': {
      'en': 'Learn More ABout FIZZZ',
      'es': 'Cómo lanzar una colección NFT',
    },
    't9o3qx2i': {
      'en': 'Use Fizzz at your favorite restuarants',
      'es': 'Usa Fizzz en tus restaurantes favoritos',
    },
    'f6b906d7': {
      'en': 'Earn more coin while holding',
      'es': 'Gana más monedas mientras mantienes',
    },
    '1lzhu02o': {
      'en': 'Withdraw for monetary value when available',
      'es': 'Retirar por valor monetario cuando esté disponible',
    },
    'cg8mobxo': {
      'en': 'Buy 200 Fizzz Coin',
      'es': 'Compra 200 monedas Fizzz',
    },
  },
  // adventurePopUp
  {
    'cp6a4hjn': {
      'en': 'Mark Your Adventure',
      'es': 'Contenido premium',
    },
    'inqkuqfw': {
      'en':
          'Adventures are a great way to commit to trying something new and amazing!',
      'es':
          '¡Para acceder a este contenido, deberá comprar el plan premium a continuación!',
    },
    '7wnroqe7': {
      'en': 'Enjoy With Friends & Family',
      'es': 'Cómo lanzar una colección NFT',
    },
    'm1vavrlv': {
      'en': 'Choose where it goes',
      'es':
          '¡Para acceder a este contenido, deberá comprar el plan premium a continuación!',
    },
    'vk6cso0o': {
      'en': 'Looks Good!',
      'es': 'Regalo 200 Monedas Fizzz',
    },
  },
  // editDeal
  {
    'q0z66ys1': {
      'en': 'Deal Title',
      'es': 'Título del trato',
    },
    'zsqecqt1': {
      'en': '10% off, FREE Taco etc,.',
      'es': '10% de descuento, Taco GRATIS, etc.',
    },
    'om6y8bof': {
      'en': 'Active',
      'es': 'Activo',
    },
    '915y8b7g': {
      'en': 'Details',
      'es': 'Detalles',
    },
    'f0ucsmu6': {
      'en': 'Conditions',
      'es': 'Condiciones',
    },
    'n1nxsp0w': {
      'en': '10% off, FREE Taco etc,.',
      'es': '10% de descuento, Taco GRATIS, etc.',
    },
    'cw5mv4te': {
      'en': 'Code',
      'es': 'Código',
    },
    'e3zbpntg': {
      'en': '10% off, FREE Taco etc,.',
      'es': '10% de descuento, Taco GRATIS, etc.',
    },
    'tbtwjamf': {
      'en': 'Needs Redeemed',
      'es': 'necesidades redimidas',
    },
    'ggvdt7ws': {
      'en': 'Delete',
      'es': 'Agregar',
    },
    'w9iz77d0': {
      'en': 'Edit',
      'es': 'Agregar',
    },
  },
  // noResults
  {
    '06ykje0t': {
      'en': 'No Results',
      'es': '',
    },
    'f55kiwfd': {
      'en': 'Sorry about that! Try searching\nfor something else',
      'es': '',
    },
  },
  // noStories
  {
    'i6013ll8': {
      'en': 'No Stories',
      'es': '',
    },
    'kgyyndvo': {
      'en': 'We\'re sure there will be new stories \nhere soon!',
      'es': '',
    },
  },
  // noDeals
  {
    'qhwe0o8x': {
      'en': 'No Deals',
      'es': '',
    },
    'aeoy4yyk': {
      'en': 'Cooking up the perfect deal takes time,\ncheck back soon',
      'es': '',
    },
  },
  // noReviews
  {
    'nd2ymhn1': {
      'en': 'No Reviews',
      'es': '',
    },
    'icoy6cal': {
      'en': 'Be the first to leave a review, \nor check back soon',
      'es': '',
    },
  },
  // noMenu
  {
    'qf5pcrsw': {
      'en': 'No Menu',
      'es': '',
    },
    'r1xvmjvw': {
      'en': 'We are working on adding this\nrestaurants menu',
      'es': '',
    },
  },
  // noComments
  {
    '2p91fhhu': {
      'en': 'No Comments',
      'es': '',
    },
    'i9yk0sp5': {
      'en': 'Drop a line here and show\nsome love',
      'es': '',
    },
  },
  // noBookmarks
  {
    '51d4i0c5': {
      'en': 'No Bookmarks',
      'es': '',
    },
    '2mepw3qp': {
      'en': 'Be sure ot bookmark your favorite\nspots or places you like',
      'es': '',
    },
  },
  // noDealsCopy
  {
    '9kfzm815': {
      'en': 'No Deals',
      'es': '',
    },
    '42q525e3': {
      'en': 'Cooking up the perfect deal takes time,\ncheck back soon',
      'es': '',
    },
    'bmo83c7d': {
      'en': 'See all deals',
      'es': 'Ver todas las ofertas',
    },
  },
  // noLikedVideos
  {
    'llubtou2': {
      'en': 'No Videos',
      'es': '',
    },
    'qhrtrthi': {
      'en': 'Smash the flame icon on videos\nand they will appear here',
      'es': '',
    },
  },
  // noMessages
  {
    '4kpuy97w': {
      'en': 'No Messages',
      'es': '',
    },
    'vo2lub2g': {
      'en': 'Start a conversation by visiting\na users profile',
      'es': '',
    },
  },
  // deliverySheet
  {
    'ff9csb5g': {
      'en': 'Delivery',
      'es': '',
    },
    '878wn54v': {
      'en': 'Choose a delivery service',
      'es': '',
    },
    '1ir7z9ru': {
      'en': 'Preferred',
      'es': '',
    },
    '20fxi0vh': {
      'en': 'This restaurant prefers this order method',
      'es': '',
    },
    '4ohujadc': {
      'en': 'Order',
      'es': '',
    },
    '0po288le': {
      'en': 'Premium Feature',
      'es': '',
    },
    'ka8joec2': {
      'en': 'Join',
      'es': '',
    },
  },
  // noUsers
  {
    'pd7uoap8': {
      'en': 'No Users',
      'es': '',
    },
    'jnwb5wzm': {
      'en': 'Sorry, no users found',
      'es': '',
    },
  },
  // emptyReviews
  {
    'cu89r4nh': {
      'en': 'Seems there are no reviews',
      'es': '',
    },
    'jly92ee7': {
      'en': 'Be the first to leave a review',
      'es': '',
    },
  },
  // emptycart
  {
    '76zz6lii': {
      'en': 'Empty Current Bag?',
      'es': '',
    },
    'dzqmyonk': {
      'en': 'You have items from a different restaurant in your bag.',
      'es': '',
    },
    'vakr97dy': {
      'en': 'My Bag',
      'es': '',
    },
  },
  // noMenuItems
  {
    'rbd90czy': {
      'en': 'No Menu Items',
      'es': '',
    },
    'fnwtudn6': {
      'en': 'This review doesn\'t have any\ntagged menu items',
      'es': '',
    },
  },
  // deleteItem
  {
    '7oishyie': {
      'en': 'Delete Item',
      'es': 'Eliminar historia',
    },
    'c2gi3uon': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
  },
  // deleteAccount
  {
    'w1mhz9zk': {
      'en': 'Delete Account',
      'es': 'Eliminar historia',
    },
    'ms2hksko': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
  },
  // editDraft
  {
    'bxhkye54': {
      'en': 'Edit Review',
      'es': 'Editar revisión',
    },
    '1yoiu20u': {
      'en': 'Rate the restaurant below.',
      'es': 'Califique el restaurante a continuación.',
    },
    'w0nlzz6a': {
      'en': 'Save',
      'es': '',
    },
    '8mr04s2x': {
      'en': 'What would you rate this restaurant?',
      'es': '¿Qué calificación le darías a este restaurante?',
    },
    't11msa19': {
      'en': 'Share your experience....',
      'es': 'Comparte tu experiencia....',
    },
    'bh4asap6': {
      'en': 'Post Review',
      'es': 'Editar revisión',
    },
  },
  // addMenuToStream
  {
    '06hfr39w': {
      'en': 'Add Items',
      'es': 'Agregar elementos',
    },
    '08bqva8i': {
      'en': 'Done',
      'es': 'Hecho',
    },
  },
  // chooseLocation
  {
    'j7eoskzy': {
      'en': 'Select Location',
      'es': '',
    },
    'he1r41j4': {
      'en': 'Add Location',
      'es': '',
    },
  },
  // chooseRestaurant
  {
    'd66dpf33': {
      'en': 'Search restaurants...',
      'es': '',
    },
  },
  // commentsStream
  {
    'jtrarob1': {
      'en': 'Comments',
      'es': 'Comentarios',
    },
    'a3ivvmjt': {
      'en': 'Posted',
      'es': 'Al corriente',
    },
  },
  // addPoll
  {
    'u9p47dfl': {
      'en': 'Enter question here...',
      'es': '',
    },
    'zk8o6x2o': {
      'en': 'Enter up to 4 answers below',
      'es': '',
    },
    'uajgzz2d': {
      'en': '1.',
      'es': '',
    },
    '4ax369jm': {
      'en': 'Answer...',
      'es': '',
    },
    'em3qemil': {
      'en': '2.',
      'es': '',
    },
    'lxvwzhlg': {
      'en': 'Answer...',
      'es': '',
    },
    'afkye45m': {
      'en': '3.',
      'es': '',
    },
    '6kkl5tbb': {
      'en': 'Answer...',
      'es': '',
    },
    'vvw7r28n': {
      'en': '4.',
      'es': '',
    },
    '32qdw19y': {
      'en': 'Answer...',
      'es': '',
    },
    'xpf2uk8i': {
      'en': 'Done',
      'es': '',
    },
  },
  // addTrivia
  {
    'f56teg44': {
      'en': 'Enter question here...',
      'es': '',
    },
    'ch201m5n': {
      'en': 'Enter up to 4 answers below',
      'es': '',
    },
    'ffpspgwr': {
      'en': '1.',
      'es': '',
    },
    'ks0mz6py': {
      'en': 'Answer...',
      'es': '',
    },
    'wfxiugax': {
      'en': '2.',
      'es': '',
    },
    'guz8hrjb': {
      'en': 'Answer...',
      'es': '',
    },
    'zjkk17ni': {
      'en': '3.',
      'es': '',
    },
    'udox0vhs': {
      'en': 'Answer...',
      'es': '',
    },
    'cyf9k341': {
      'en': '4.',
      'es': '',
    },
    'nqvv7kzq': {
      'en': 'Answer...',
      'es': '',
    },
    '795uc176': {
      'en': 'Done',
      'es': '',
    },
  },
  // addMenuCartCopy
  {
    'hmqwz39f': {
      'en': 'Items in video',
      'es': 'elementos en video',
    },
    '3mmclc45': {
      'en': 'Start New Order',
      'es': 'Orden de inicio',
    },
  },
  // answerPoll
  {
    'i8iyoz3p': {
      'en': 'Answer below',
      'es': '',
    },
  },
  // pollGraph
  {
    '17zrbifr': {
      'en': '1',
      'es': '',
    },
    'au403e1s': {
      'en': '1.',
      'es': '',
    },
    '19mf4iyf': {
      'en': '2.',
      'es': '',
    },
    'jzi45t4b': {
      'en': '3.',
      'es': '',
    },
    'f23cb72u': {
      'en': '4.',
      'es': '',
    },
  },
  // answerTrivia
  {
    'vfm304kp': {
      'en': 'Answer below',
      'es': '',
    },
  },
  // pageViewOverlay
  {
    'y7wj3vhv': {
      'en': 'Reply',
      'es': '',
    },
  },
  // hoursSheet
  {
    'kbjn1uoe': {
      'en': 'Hours',
      'es': 'Horas',
    },
    'hxk1j1cf': {
      'en': 'Monday',
      'es': 'lunes',
    },
    'rji6nvex': {
      'en': 'Tuesday',
      'es': 'martes',
    },
    '82wproxi': {
      'en': 'Wednesday',
      'es': 'miércoles',
    },
    '8j4pc8r6': {
      'en': 'Thursday',
      'es': 'jueves',
    },
    'lvgc4khj': {
      'en': 'Friday',
      'es': 'viernes',
    },
    '5unju68d': {
      'en': 'Saturday',
      'es': 'sábado',
    },
    'xzyszrf6': {
      'en': 'Sunday',
      'es': 'domingo',
    },
  },
  // menuSheet
  {
    'lwnrn1r7': {
      'en': 'Check In',
      'es': '',
    },
    'ksomfe83': {
      'en': 'Add Photo/Video',
      'es': '',
    },
    'npj1gwwq': {
      'en': 'Edit Restaurant',
      'es': '',
    },
    'dyqu538g': {
      'en': 'Cancel',
      'es': '',
    },
  },
  // Miscellaneous
  {
    'tn2myvvj': {
      'en':
          'In order to show you restaurants that are nearby, this application requires permission to access your location.',
      'es':
          'Para poder mostrarte los restaurantes que están cerca, esta aplicación requiere permiso para acceder a tu ubicación.',
    },
    '9bw0n831': {
      'en':
          'If you want to record a video to submit as a restaurant review, this application requires permission to access your camera.',
      'es':
          'Si desea grabar un video para enviarlo como reseña de un restaurante, esta aplicación requiere permiso para acceder a su cámara.',
    },
    'ug88r96i': {
      'en':
          'In order to record your audio message for your restaurant review, this application requires permission to access your microphone.',
      'es':
          'Para grabar su mensaje de audio para la reseña de su restaurante, esta aplicación requiere permiso para acceder a su micrófono.',
    },
    '1bgu60kw': {
      'en':
          'In order to upload media for profile customization or restaurant reviews, this application requires permission to access your photo library.',
      'es':
          'Para cargar medios para la personalización del perfil o reseñas de restaurantes, esta aplicación requiere permiso para acceder a su biblioteca de fotos.',
    },
    'medtb57s': {
      'en': '',
      'es': '',
    },
    'h9r2bgg6': {
      'en': '',
      'es': '',
    },
    'mrquepyd': {
      'en': '',
      'es': '',
    },
    'jgya49jo': {
      'en': '',
      'es': '',
    },
    't7jspem6': {
      'en': '',
      'es': '',
    },
    'po9sugrr': {
      'en': '',
      'es': '',
    },
    '7y3wzh9x': {
      'en': '',
      'es': '',
    },
    'xylw4hj4': {
      'en': '',
      'es': '',
    },
    'lpdx8cbh': {
      'en': '',
      'es': '',
    },
    'ec99ke5m': {
      'en': '',
      'es': '',
    },
    's0in3ivq': {
      'en': '',
      'es': '',
    },
    'dc42fp7d': {
      'en': '',
      'es': '',
    },
    'nfy66vbp': {
      'en': '',
      'es': '',
    },
    'qbox12fp': {
      'en': '',
      'es': '',
    },
    '3qqwrl55': {
      'en': '',
      'es': '',
    },
    'n98ptggk': {
      'en': '',
      'es': '',
    },
    '390fgmiz': {
      'en': '',
      'es': '',
    },
    'qj70osg1': {
      'en': '',
      'es': '',
    },
    '4vlvgtrz': {
      'en': '',
      'es': '',
    },
    'b576svn7': {
      'en': '',
      'es': '',
    },
    'zamph68q': {
      'en': '',
      'es': '',
    },
  },
].reduce((a, b) => a..addAll(b));
