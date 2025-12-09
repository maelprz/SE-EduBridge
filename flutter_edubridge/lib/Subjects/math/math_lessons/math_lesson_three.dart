import 'package:flutter/material.dart';
import '../../../reusables/navigation/bottom_nav_wrapper.dart';
import '../../../reusables/app_bar_pill.dart';

class MathLessonThree extends StatelessWidget {
  const MathLessonThree({super.key});

  @override
  Widget build(BuildContext context) {
    final Color green = const Color(0xFF0C4B36);

    return BottomNavWrapper(
      index: 1,
      child: Scaffold(
        appBar: AppBarPill(
          title: "Lesson 3",
          onLeadingIconPressed: () => Navigator.pop(context),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(
            25,
            20,
            25,
            MediaQuery.of(context).padding.bottom + 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Basic Geometry & Shapes",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Geometry is the study of shapes, sizes, and spaces. "
                "Understanding shapes helps in drawing, measuring, and real-life problem solving.",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 25),

              Text(
                "Types of Shapes",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "• Triangle: 3 sides, 3 angles.\n"
                "• Square: 4 equal sides, 4 right angles.\n"
                "• Rectangle: 4 sides, opposite sides equal, 4 right angles.\n"
                "• Circle: Round shape, all points equidistant from center.\n"
                "• Pentagon: 5 sides.\n"
                "• Hexagon: 6 sides.",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 25),

              Text(
                "Geometry Terms",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "• Perimeter: The distance around a shape.\n"
                "• Area: The space inside a shape.\n"
                "• Vertex: A corner point of a shape.\n"
                "• Edge: A side of a shape.\n"
                "• Angle: The space between two lines that meet at a point.",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 25),

              Text(
                "Math Exercise",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "1. Draw a triangle and label its sides and vertices.\n"
                "2. Calculate the perimeter of a rectangle with sides 5 cm and 8 cm.\n"
                "3. Find the area of a square with side 4 cm.\n"
                "4. Identify 3 objects around you that are circle-shaped.\n"
                "5. Measure angles of a triangle using a protractor.",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 70),
            ],
          ),
        ),
      ),
    );
  }
}
