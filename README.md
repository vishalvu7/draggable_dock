# dockapp


Summary of the Documentation:
Classes:

MyApp: The main application widget that sets up the app's layout and structure.
Dock: A generic widget that displays a list of draggable items.
_DockState: The state class for managing the logic and UI of the Dock.
Fields:

items: A list of items of type T passed to the Dock.
builder: A function that builds a widget for each item in the Dock.
_items: A local copy of the items for internal state management.
_draggingIndex: An optional integer tracking the index of the item currently being dragged.
Methods:

_buildIconItem: A helper function to build a styled container for each icon.
_buildDraggableItem: Builds each draggable item, applying a scale and opacity effect if it is being dragged.
_onItemDropped: Handles reordering the items when an item is dropped into a new position.
