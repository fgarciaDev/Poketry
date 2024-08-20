import 'package:flutter/material.dart';
import 'package:poketry/data/providers/app_nav_provider.dart';
import 'package:poketry/data/providers/pokemon_provider.dart';
import 'package:poketry/data/providers/research_provider.dart';
import 'package:poketry/views/navigation/poke_scaffold.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppNavProvider()),
        ChangeNotifierProvider(create: (_) => PokemonProvider()),
        ChangeNotifierProvider(create: (_) => ResearchProvider()),
      ],
      child: const Poketry(),
    ),
  );
}

class Poketry extends StatelessWidget {
  const Poketry({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: _myLightTheme(),
      darkTheme: _myDarkTheme(),
      home: const PokeScaffold(),
      debugShowCheckedModeBanner: false,
    );
  }
}

ThemeData _myLightTheme() => ThemeData.light(useMaterial3: true).copyWith(
      colorScheme: const ColorScheme.light().copyWith(
        // required brightness,
        // required this.primary,
        // required this.onPrimary,

        /// Container widget color
        primaryContainer: Colors.red[900],

        /// text or anything else laid "ON" a container
        // onPrimaryContainer: Colors.red,

        // primaryFixed: Colors.red,
        // primaryFixedDim: Colors.red,
        // onPrimaryFixed: Colors.red,
        // onPrimaryFixedVariant: Colors.red,

        // secondary: Colors.blue,
        // onSecondary: Colors.red,

        /// Secondary containers like icons and background color
        secondaryContainer: Colors.red[100],

        /// onSecondary containers like icon color
        onSecondaryContainer: Colors.red[700],

        // secondaryFixed: Colors.red,
        // secondaryFixedDim: Colors.red,
        // Color? onSecondaryFixed,
        // Color? onSecondaryFixedVariant,

        // tertiary: Colors.red,
        // onTertiary: Colors.red,
        // tertiaryContainer: Colors.red,
        // onTertiaryContainer: Colors.red,
        // tertiaryFixed: Colors.red,
        // tertiaryFixedDim: Colors.red,
        // onTertiaryFixed: Colors.red,
        // onTertiaryFixedVariant: Colors.red,

        // required this.error,
        // required this.onError,
        // Color? errorContainer,
        // Color? onErrorContainer,

        /// Affects the app bar bg color
        surface: Colors.red[700],

        /// Widget color "ON" the appbar, like title text
        onSurface: Colors.white,

        // Affect surface color tint of AppBar bg color
        // surfaceTint: Colors.white,

        // surfaceDim: Colors.red,
        // surfaceBright: Colors.red,
        // surfaceContainerLowest: Colors.red,
        // surfaceContainerLow: Colors.red,

        // Affects the bottom nan bar surface color
        surfaceContainer: Colors.red[700],

        // surfaceContainerHigh: Colors.red,
        // surfaceContainerHighest: Colors.red,

        /// Like Text/Icon color of a non-selected widget
        onSurfaceVariant: Colors.red[100],

        // outline: Colors.red,
        // outlineVariant: Colors.red,

        // shadow: Colors.grey,

        // scrim: Colors.red,
        // inverseSurface: Colors.red,
        // onInverseSurface: Colors.red,
        // inversePrimary: Colors.red,
      ),
    );

ThemeData _myDarkTheme() => ThemeData.dark(useMaterial3: true).copyWith(
      colorScheme: const ColorScheme.dark().copyWith(
        primary: Colors.black,
        // secondary: Colors.amber,
        // surface: Colors.purple,
      ),
    );
