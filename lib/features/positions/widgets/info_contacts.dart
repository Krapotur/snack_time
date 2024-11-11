import 'package:flutter/material.dart';

class InfoContacts extends StatelessWidget {
  const InfoContacts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(Icons.phone, color: Theme.of(context).primaryColor),
            const SizedBox(
              width: 3,
            ),
            const Text('920 156 4587'),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(Icons.room, color: Theme.of(context).primaryColor),
            const SizedBox(
              width: 3,
            ),
            const Text('Боровский район,д. Петрово, КОЦ Этномир'),
          ],
        ),
      ],
    );
  }
}
