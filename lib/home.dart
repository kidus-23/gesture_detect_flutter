import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color textColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gesture Detection'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: _buildGestureDetector(context),
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildDraggable(),
                    const SizedBox(height: 20),
                    _buildDragTarget(),
                    const SizedBox(height: 20),
                    Text(
                      'This is the bottom half of the page!',
                      style: TextStyle(fontSize: 20, color: textColor),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Draggable<int> _buildDraggable() {
    return Draggable<int>(
      data: Colors.deepOrange.value,
      feedback: const Icon(Icons.brush, color: Colors.deepOrange, size: 120.0),
      child: const Column(
        children: [
          Icon(Icons.palette, color: Colors.deepOrange, size: 120.0),
          Text('Drag me below to change color'),
        ],
      ),
    );
  }

  DragTarget<int> _buildDragTarget() {
    return DragTarget<int>(
      onAccept: (colorValue) {
        setState(() {
          textColor = Color(colorValue);
        });
      },
      builder: (context, candidateData, rejectedData) => Text(
            'Drag to see color change',
            style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
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
      onVerticalDragUpdate: (details) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('onVerticalDragUpdate')));
      },
      onHorizontalDragUpdate: (details) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('onHorizontalDragUpdate')));
      },
      child: Container(
        color: Colors.lime.shade100,
        width: double.infinity,
        padding: const EdgeInsets.all(40.0),
        child: const Column(
          children: [
            Icon(Icons.access_alarm, size: 200.0),
          ],
        ),
      ),
    );
  }
}
