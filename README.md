# Matching


## **Objetivo del Proyecto:**

Desarrollar una aplicación en Python que permita a los usuarios crear un perfil personal en base a cuatro categorías: información personal y características físicas, personalidad, gustos e intereses, y lo que buscan en una pareja. Los usuarios podrán establecer no solo sus propios datos, sino también los criterios de búsqueda que desean en una pareja, permitiendo coincidencias personalizadas.
Funcionalidades Clave:

1. Pantallas Principales:

   - Pantalla de bienvenida: Página inicial simple con opciones para iniciar sesión o crear una cuenta.
IN 
   - Página de inicio de sesión: Donde los usuarios pueden acceder a sus cuentas.

   - Página de creación de cuenta: Formulario para que nuevos usuarios se registren ingresando su información personal.

   - Página de perfil: Donde los usuarios pueden completar sus perfiles, modificar su información y seleccionar criterios de búsqueda para su pareja ideal.

   - Página de tarjetas de otros usuarios: Visualización de otros perfiles que coinciden con sus criterios de búsqueda.
 
2. Menús Desplegables: 

     - Información personal y características físicas: estatura, edad, orientación, complexión, cabello, etc.
(Grupo de menús desplegables con opciones finitas)
TODO
     - Personalidad: apertura a la experiencia, inclinación política, espiritualidad, hábitos, etc.
(Grupo de menús desplegables con opciones generales)

     - Gustos e intereses: hobbies, música, deportes, arte, etc.
(Banco de items con mínimo y máximo de selección o menús desplegables con opciones finitas)

     - Lo que buscan en una pareja: preferencia de estatura, intereses comunes, etc.
(Menús desplegables con rangos acotados y criterios de ordenamiento)
 
3. Cálculo de Porcentajes:

   - Porcentaje de aceptación: La aplicación debe calcular el porcentaje promedio de aceptación que un usuario logra con base en los criterios de los demás usuarios.

   - Porcentaje de coincidencia: Qué porcentaje de los criterios de búsqueda del usuario cumple cada perfil visible.
   - Mostrar únicamente el porcentaje, sin mostrar en qué categorías o criterios existe mayor afinidad.
 
4. Plazo y Entregables:
   - Plazo: 6 de Diciembre de 2024
   - Entegables: Código fuente funcional de la aplicación. Documento de especificaciones técnicas (detalles de arquitectura, tecnologías utilizadas, etc.). Presentación de los resultados y funcionalidades clave de la aplicación.
 



⚠️BUG/TEST add validation to dates according to LegalDate,add logic for "common sense" ages.



##Questions?
 * How to handle db traffic?
 * What happens when all cards have passed by?
 * algos for showing up cards
 
## Recursos
- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Para etiquteas:

https://fluttergems.dev/packages/chips_choice/Git
https://github.com/davigmacode/flutter_chips_choice/tree/master

Libraries used:
  swipe_cards: ^2.0.0+1
  image_picker: ^1.1.2
  toggle_switch: ^2.3.0





## Requisitos del proyecto

## Consideraciones
### Algoritmo de sumatoria.
* Busqueda binaria
* Ordenamiento merge
* Ordenamiento Quicksort
### Requisitos indispensables de perfil
* id
correo, contraseña
nombre, 
* edad
* genero
* carrera
* altura
* complexion
* personalidad
* preferencia carrera
* preferencia altura
* preferenia de genero
* preferencia complexion
DESDE AQUI:
* preferencia personalidad

*INGORAR
* color de piel
* preferencia color de piel 
* etiquetas

  '/': (context) =>   LogInForm(onLocaleChange: setLocale),       // Home Page
      '/WelcomeQs': (context) => const  WelcomeQs(), // Calendar Page
      '/Name': (context) => const  NameQs(),
      '/BirthdayQs': (context) => const  BirthdayQs(),
      '/GenderQs': (context) => const  GenderQs(),
      '/CarrerQs': (context) => const CareerQs(),
      '/HeightQs': (context) => const HeigthQs(),
      '/BodyTypeQs': (context) => const BodyTypeQs(),
      '/PersonalityQs': (context) => const PersonalityQs(),

      '/SearchCareerQs': (context) => const SearchCareerQs(),
      '/SearchHeightQs': (context) => const  SearchHeightQs(),
      '/SearchGenderQs': (context) => const  SearchGenderQs(),
      '/SearchBodyTypeQs': (context) => const  SearchBodyTypeQs(),
      '/SearchPersonalityTypeQs': (context) => const  SearchPersonalityQs(),
      

      // '/AddPhotosQs': (context) => const AddPhotosQs(),
      '/PersonalityTags': (context) => const PersonalityTags(),

      // '/SwipeCardsClass': (context) =>  SwipeCardsClass(),

### Otros requisitos de perfil
* etiquetas
* fotos

###   filtro de busqueda
  

* Edad 
* Carreras
* Altura
* Preferencia de genero

  

** File Behavior:

If crud_database.db already exists, SQLite will open and use that file.
If it does not exist, SQLite will create a new file in the specified (or default) location.
Access:

All CRUD operations in base.py and busqueda.py interact with this crud_database.db file.
The file is local to the environment running these scripts, and its data is persistent between script runs as long as the file remains in place.
Implications:

Since the database is local, it cannot be accessed remotely unless additional networking or sharing configurations are implemented.
This local setup is ideal for development or small-scale applications. For larger or distributed systems, a centralized database server is usually preferred.