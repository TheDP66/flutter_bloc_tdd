import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tdd/injection_container.dart';
import 'package:flutter_bloc_tdd/presentation/bloc/popular_movies/popular_movies_bloc.dart';
import 'package:flutter_bloc_tdd/presentation/bloc/popular_movies/popular_movies_event.dart';
import 'package:flutter_bloc_tdd/presentation/pages/popular_movies_screen.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        // ? memang menggunakan ..add
        create: (context) => getIt<PopularMoviesBloc>()
          ..add(
            FetchPopularMovies(),
          ),
        child: const PopularMoviesScreen(),
      ),
    );
  }
}
