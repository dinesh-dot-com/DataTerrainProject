import 'package:flutter_riverpod/flutter_riverpod.dart';


class Program {
  final String name;
  final String category;
  final String createdBy;
  final String rating;

  Program({
    required this.name,
    required this.category,
    required this.createdBy,
    required this.rating,
  });
}


final programListProvider = Provider<List<Program>>((ref) {
  return [
    Program(
      name: 'Leadership Growth',
      category: 'Engineer',
      createdBy: '(202) 555-0191',
      rating: 'contact@creativehub.com',
    ),
    Program(
      name: 'Tech Mentorship',
      category: 'Doctor',
      createdBy: '(303) 555-0123',
      rating: 'support@innovativeideas.com',
    ),
    Program(
      name: 'Career Guidance',
      category: 'Artist',
      createdBy: '(404) 555-0145',
      rating: 'info@techsolutions.com',
    ),
    Program(
      name: 'Business Skills',
      category: 'Chef',
      createdBy: '(505) 555-0167',
      rating: 'hello@designworld.com',
    ),
    Program(
      name: 'Soft Skills',
      category: 'Teacher',
      createdBy: '(606) 555-0189',
      rating: 'team@futuretech.com',
    ),
  ];
});
