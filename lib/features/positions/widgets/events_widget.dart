import 'package:flutter/material.dart';
import 'package:snack_time/ui/shared/widgets/base_container.dart';

class EventsWidget extends StatelessWidget {
  const EventsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 150,
        width: 80,
        child: ListView.separated(
          padding: const EdgeInsets.only(top: 5, left: 10.0),
          scrollDirection: Axis.horizontal,
          itemCount: 2,
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemBuilder: (context, index) => BaseContainer(
            color: const Color.fromARGB(255, 163, 247, 198),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: const DecorationImage(
                        image: AssetImage('assets/img/cofee+desert.jpg'),
                        fit: BoxFit.cover),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '200 руб',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'Кофе + десерт',
                        style: TextStyle(color: Colors.black, fontSize: 10),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
