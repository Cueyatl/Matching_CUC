import 'package:flutter/material.dart';


class TypeValidation{
  static const String valsForNames=r"^[a-zA-ZáéíóúÁÉÍÓÚüÜñÑ\s]+$";
}
class Styl {
  static const double topP = 40.0;
  static const double bottomP = 10.0;
  
  static const Color textColorShade =Color(0XFF2C3958);
  static const Color languageToggleColor =Color(0XFFE75469);
  static const Color languageToggleBG =Color(0XFFD6BD8E);

  static const Color textColorBase = Color.fromARGB(255, 21, 27, 42);
  static const Color textColorPink = Color(0xFFF5588A);
  static const Color textColorPinkAccent = Color(0xFFED0037);
  static const Color bgBase = Color(0XFFF2F2F2);
  static const Color bgShade = Color(0XFFF2F2F2);

  static const double verticalPadding = 4.0;
  static const double horizontalPadding = 24.0;
  
  

  static const double heightSBoxSmall = 0.001;
  static const double heightSBoxMedium = 0.02;
  static const double heightSBoxLarge = 0.03;
  static const double heightSBoxXlarge = 0.04;

  static const double pSizeSmall = 0.35;
  static const double pSizeMedium = 0.04;
  static const double pSizeLarge = 0.06;
  static const double pSizeXLarge = 0.08;

  static double respoLarge(BuildContext context) {
    return MediaQuery.of(context).size.width * Styl.heightSBoxMedium;
  }

  static double respoMedium(BuildContext context) {
    return MediaQuery.of(context).size.width * Styl.heightSBoxSmall;
  }

  static double respoSmall(BuildContext context) {
    return MediaQuery.of(context).size.width * Styl.heightSBoxLarge;
  }

  static double respoXLarge(BuildContext context) {
    return MediaQuery.of(context).size.width * Styl.heightSBoxXlarge;
  }

// Fontsize 16, 18, 20, 24
  static double p4(BuildContext context) {
    return MediaQuery.of(context).size.width * pSizeSmall; // 5% of screen width
  }

  static double p3(BuildContext context) {
    return MediaQuery.of(context).size.width *
        pSizeMedium; // 5% of screen width
  }

  static double p2(BuildContext context) {
    return MediaQuery.of(context).size.width * pSizeLarge; // 5% of screen width
  }

  static double p1(BuildContext context) {
    return MediaQuery.of(context).size.width *
        pSizeXLarge; // 5% of screen width
  }

  static double respoHeightLarge(BuildContext context) {
    return MediaQuery.of(context).size.height * Styl.heightSBoxMedium;
  }

  static double respoHeightMedium(BuildContext context) {
    return MediaQuery.of(context).size.height * Styl.heightSBoxSmall;
  }

  static double respoHeightSmall(BuildContext context) {
    return MediaQuery.of(context).size.height * Styl.heightSBoxLarge;
  }

  static double respoHeightXLarge(BuildContext context) {
    return MediaQuery.of(context).size.height * Styl.heightSBoxXlarge;
  }
}

class ButtonText {
  static const String conString = "Continuar";

  static const String acString = "Acepto";
}

class CredentialsView {
  static const String title = "¡Bienvenido de vuelta!";
  static const String tgUser = 'Usuario o correo electrónico';
  static const String tgPass = 'Contraseña';

  static const String lgIn = "Ingresar";
  static String noCuenta = "No tienes una cuenta?";
  static String sgnRegister =  "Registrate aquí";
}

class WelcomeView {
  static const String title = "Te damos la bienvenida a Matching.";
  static const String description = "Por favor, sigue estas reglas.";
  static const String ruleOneTitle = "No finjas ser alguien más.";
  static const String ruleOneText =
      "Asegúrate de que tus fotos, edad y biografía correspondan con quien eres actualmente.";
  static const String ruleTwoTitle = "Cuídate.";
  static const String ruleTwoText =
      "No des tu información personal demasiado pronto.";
  static const String ruleThreeTitle = "Tómalo con calma.";
  static const String ruleThreeText =
      "Respeta a los demás y trátalos como te gustaría que te trataran.";
  static const String ruleFourTitle = "Toma la iniciativa.";
  static const String ruleFourText = "Siempre denuncia el mal comportamiento.";
}

class NameView {
  static const String title = "¿Cuál es tu primer nombre?";
  static const String lblName = "Nombre";
  static const String adviceOne = "Así aparecerá en tu perfil.";
  static const String adviceTwo = "No podrás cambiarlo después";
}

class BirthdayView {
  static const String title = "¿Tu cumpleaños?";
  static const String description =
      "Tu perfil muestra tu edad, no tu fecha de nacimiento";
}

class GenderView {
  static const String titleBottomSheet = "Enriquece tu perfil con tu identidad";
  static const String descriptionBottomSheet =
      "Por favor cuentanos cómo te idenficicas Intentamos ser inclusivxs para todos los géneros.";
  static const String lblGenderBottomSheet = "Escribe aquí tu género";

  static const String title = "¿Qué género te representa mejor?";
  static const String description =
      "Elige la opción que mejor te represente para que podamos brindarte la mejor experiencia.";

  static const String titleQ = "¿A quién te interesa ver?";
  static const String descriptionQ =
      "Selecciona todas las que apliquen, para que sepamos a quién recomendarte";
}

class QuestionOptions {
  static const String lblMan = "Hombre";
  static const String lblWoman = "Mujer";
  static const String lblOther = "Otro";
  static const String lblGenders = "Todxs";
  static const String lblBeyondBin = 'Más allá del género binario';
  static const String lbladmin = "Lic. Administración 📋";
  static const String lblCont = "Lic. Contabilidad 📊";
  static const String lblBio = 'Ing. Biotecnología 🧬';
  static const String lblInd = "Ing. Industrial 🏭";
  static const String lblSis = "Ing. en Sistemas 💻";
  static const String lblCareers = "Todas las carreras 🎓";
}

class HeightView {
  static const String title = "¿Cuál es tu altura?";
  static const String description =
      "Esta información nos ayudará a hacer recomendaciones más precisas para ti.";
  static const String lblHeight = "0 cms";

  static const String titleQ = "¿Cuál es tu altura?";
  static const String descriptionQ =
      "Selecciona todas las que apliquen, para que sepamos a quién recomendarte";
  static const String lblHighQ = 'Altura elevada 🐎 (más alto)';
  static const String lblMidQ = "Altura compartida 🤝 (misma altura)";
  static const String lblLowQ = "Altura acogedora 🐇 (más bajo)";
  static const String lblAllQ = "Todas las alturas 🤩";
}

class CareerView {
  static const String title = "¿A qué carrera perteneces?";
  static const String description =
      "No te preocupes, podrás cambiar tu carrera más adelante si así lo deseas.";
  static const String titleQ = "¿Qué carreras te gustaría ver?";
  static const String descriptionQ =
      "Selecciona las carreras que quieras, así sabremos a quién recomendarte";
}

class PhotosView {
  static const String title = "Agrega tus fotos recientes";
  static const String description = "Agrega por lo menos 2 fotos para empezar.";
  static const String selectFuente = "Selecciona fuente";
  static const String selectCamera = "Cámara";
  static const String selectGallery = "Galería";
}

class TagsView {
  static const String title = "¿Qué te gusta?";
  static const String description = "Hazle saber a todos lo que te gusta.";
  static const List<String> matchTags = [
    'Master chef... imaginando 👩‍🍳',
    'Amo a los perritos 🐶',
    'Goles épicos 🙌⚽',
    'Listo para road trips 🚗',
    'Fan de memes 24/7 😂',
    'Adicto al café ☕',
    'Cazador de vibes 🌈',
    'Amo a los gatos 😻',
    'Festivales > todo 🎶',
    'Fotógrafo amateur 📸',
    'Rey/reina karaoke 🎤',
    'Soñador empedernido 🌌',
    'Tatuajes y arte 🖋️',
    'Buscando aventuras 🌍',
    'Vivo por el sushi 🍣',
    'Estilo comfy 🧢',
    'Cine > fiesta 🎬',
    'Match solo por memes 🤪',
    'Amo los podcasts 🎧',
    'Amigo de plantas 🌱',
    'Gym hoy, pizza mañana 🍕',
    'Procrastinador/a 💤',
    'Día sol, noche fiesta 🌞🌙',
    'Gamer adicto 🎮',
    'Canciones tristes 🎵',
    'Desayunos 24/7 🥓',
    'Explorando cafés ☕📸',
    'Turista activado 🗺️',
    'Peli de terror 👻',
    'Fan de libros 📚',
    'Intento cocinar 🍳',
    'Amo el ramen 🍜',
    'Alma joven 🌿',
    'Explorando nuevos spots 🌇',
    'Fan del fútbol ⚽',
    'Eterno aprendiz 🎓',
    'Creo playlists 🎶',
    'Próximo concierto 🎤',
    'Adicto a selfies 🤳',
    'Amo el chocolate 🍫',
    'Netflix y pizza 🍕',
    'Museos = fotos 🎨',
    'Libro en mano 📖',
    'Adicto a series 📺',
    'Comida callejera 🌮',
    'Fiestero/a 🕺',
    'Cerveza artesanal 🍺',
    'Filosofando 🌙',
    'Hamburguesas top 🍔',
    'Pelis vintage 🎥',
    'Playlist indie 🎧',
    'Amo gatos, no tengo 😿',
    'Mi perro, mi amigo 🐾',
    'Picante en todo 🌶️',
    'Amo montañas 🏔️',
    'Listo para picnic 🍉',
    'Fotos para IG 📸',
    'Amo adrenalina 🎢',
    'Siempre audífonos 🎧',
    'Chill vibes 🛋️',
    'Reta de básquet 🏀',
  ];
}
