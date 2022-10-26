

class EventShowPage extends StatelessWidget {
  const EventShowPage({super.key, required this.event});
  final Event event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(event.eventName),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(event.staffName),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(event.eventDate),
          ),
        ],
      ),

    );;
  }
}
