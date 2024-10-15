import 'package:flutter/material.dart';

/// [Dock] is a generic stateful widget that displays a list of draggable items.
///
/// This widget allows items to be dragged and reordered within the list.
///
/// - [T]: The type of the items in the list, constrained to be of type `Object`.
/// - [items]: A list of items to be displayed.
/// - [builder]: A function that takes an item of type [T] and returns a widget to display it.
class Dock<T extends Object> extends StatefulWidget {
  /// Creates a [Dock] widget.
  ///
  /// - [items]: A required list of items to be displayed.
  /// - [builder]: A required function to build each item in the list.
  const Dock({super.key, required this.items, required this.builder});

  /// A list of items of type [T] to be displayed in the dock.
  final List<T> items;

  /// A function that takes an item of type [T] and returns a [Widget] to display it.
  final Widget Function(T) builder;

  @override
  State<Dock<T>> createState() => _DockState<T>();
}

/// The state class for the [Dock] widget.
///
/// This class manages the state of the draggable items in the [Dock] and handles
/// the logic for reordering items when they are dragged and dropped.
class _DockState<T extends Object> extends State<Dock<T>> {
  /// A local copy of the list of items, which is initialized from the widget's [items] property.
  late final List<T> _items = List.from(widget.items);

  /// Builds the user interface for the dock, displaying a row of draggable items.
  ///
  /// Each item in the row is wrapped in a [Draggable] and [DragTarget], allowing
  /// the items to be dragged and reordered.
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.black12,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(_items.length, (index) {
          final item = _items[index];
          return _buildDraggableItem(item, index);
        }),
      ),
    );
  }

  /// Builds a draggable item wrapped in [Draggable] and [DragTarget].
  ///
  /// - [item]: The item to be displayed.
  /// - [index]: The index of the item in the list.
  ///
  /// Returns a [Draggable] widget that allows dragging the item.
  Widget _buildDraggableItem(T item, int index) {
    return Draggable<T>(
      key: ValueKey(item),
      data: item,
      feedback: Opacity(
        opacity: 0.5,
        child: widget.builder(item),
      ),
      childWhenDragging: const SizedBox.shrink(),
      child: DragTarget<T>(
        onAccept: (receivedItem) => _onItemDropped(receivedItem, index),
        builder: (_, __, ___) => widget.builder(item),
      ),
    );
  }

  /// Handles the logic for dropping an item at a new index.
  ///
  /// When an item is dropped, it is removed from its old position and inserted at the new position.
  ///
  /// - [receivedItem]: The item that was dragged.
  /// - [index]: The index where the item was dropped.
  void _onItemDropped(T receivedItem, int index) {
    setState(() {
      _items
        ..remove(receivedItem)
        ..insert(index, receivedItem);
    });
  }
}
