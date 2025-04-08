import 'package:flutter_riverpod/flutter_riverpod.dart';

class Mentor {
  final String name;
  final String program;
  final String email;
  final double rating;

  Mentor({
    required this.name,
    required this.program,
    required this.email,
    required this.rating,
  });
}

final mentorListProvider = Provider<List<Mentor>>((ref) {
  return [
    Mentor(
      name: 'Jonh Kennedy',
      program: 'Teaching Program',
      email: 'johnk@gmail.com',
      rating: 4.9,
    ),
    Mentor(
      name: 'Jenifer Smith',
      program: 'Teaching Program',
      email: 'jenny@gmail.com',
      rating: 4.8,
    ),
    Mentor(
      name: 'Thomas Shelby',
      program: 'Teaching Program',
      email: 'thomas@gmail.com',
      rating: 4.7,
    ),
    Mentor(
      name: 'John Miller',
      program: 'Teaching Program',
      email: 'miller@gmail.com',
      rating: 4.5,
    ),
    Mentor(
      name: 'Jason Morgan',
      program: 'Teaching Program',
      email: 'jason@gmail.com',
      rating: 4.8,
    ),
  ];
});

