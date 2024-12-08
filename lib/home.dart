import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Gesture Detection'),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
          children: [
            _buildGestureDetector(context),
            const SizedBox(height: 20), // Add some spacing
            const Text('This is the bottom half of the page!',
                style: TextStyle(fontSize: 20)),
          ],
        ))));
  }
}

Draggable<int> _buildDraggable() {
  return Draggable(
    childWhenDragging:
        const Icon(Icons.palette, color: Colors.grey, size: 120.0),
    feedback: const Icon(Icons.brush, color: Colors.deepOrange, size: 120.0),
    data: Colors.deepOrange.value,
    child: const Column(
      children: [
        Icon(
          Icons.palette,
          color: Colors.deepOrange,
          size: 120.0,
        ),
        Text('Drag me below to change color')
      ],
    ),
  );
}

DragTarget<int> _buildDragTarget() {
  Color? paintedColor;
  return DragTarget<int>(
    onAcceptWithDetails: (colorValue) {
      Color paintedColor = Color(colorValue as int);
    },
    builder: (BuildContext context, List<dynamic> candidateData,
            List<dynamic> rejectedData) =>
        candidateData.isEmpty
            ? Text(
                'Drag tp see color',
                style: TextStyle(color: paintedColor),
              )
            : Text(
                'Drag to see color change: $candidateData',
                style: TextStyle(
                  color: Color(candidateData[0]),
                  fontWeight: FontWeight.bold,
                ),
              ),
  );
}

GestureDetector _buildGestureDetector(BuildContext context) {
  return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('onTap')));
      },
      onDoubleTap: () {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('onTap')));
      },
      onLongPress: () {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('onTap')));
      },

//  onPanUpdate: (DragUpdateDetails details) {
//    ScaffoldMessenger.of(context)
//        .showSnackBar(const SnackBar(content: Text('onPanUpdate: $details')));
//  },

      onVerticalDragUpdate: (DragUpdateDetails details) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('onVerticalDragUpdate')));
      },
      onHorizontalDragUpdate: (DragUpdateDetails details) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('onHorizontalDragUpdate')));
      },
      child: Container(
          color: Colors.lime.shade100,
          width: double.infinity,
          padding: const EdgeInsets.all(40.0),
          child: const Column(
            children: [
              Icon(Icons.access_alarm, size: 200.0),
            ],
          )));
}
