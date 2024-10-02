import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:snack_time/repositories/models.dart';
import 'package:snack_time/ui/shared/widgets/base_container.dart';

class CardPosition extends StatelessWidget {
  const CardPosition({
    super.key,
    required this.url,
    required this.positionsList,
    required this.index,
  });

  final String url;
  final List<Position> positionsList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      color: Colors.white,
      child: Column(
        children: [
          GestureDetector(
            child: Container(
              height: 100,
              width: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                    image: NetworkImage(url + positionsList[index].imgSrc),
                    fit: BoxFit.cover),
              ),
            ),
            onTap: () => showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) => Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 3),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 10.0, right: 10.0),
                        height: 230,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadiusDirectional.vertical(
                              top: Radius.circular(20)),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              url + positionsList[index].imgSrc,
                            ),
                          ),
                        ),
                        child: GestureDetector(
                            child: Align(
                              alignment: AlignmentDirectional.topEnd,
                              child: Container(
                                padding: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(30)),
                                child: const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ),
                            ),
                            onTap: () => AutoRouter.of(context).back()),
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              positionsList[index].title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              '${positionsList[index].weight}г + '
                              '${positionsList[index].caloric}калл',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Theme.of(context).hintColor),
                            ),
                            const SizedBox(height: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Состав',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(positionsList[index].composition)
                              ],
                            ),
                            const SizedBox(height: 17),
                            const Text(
                              'Пищевая ценность(100г)',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                    'Б: ${positionsList[index].proteins.toString()}'),
                                const SizedBox(width: 10),
                                Text(
                                    'Ж: ${positionsList[index].fats.toString()}'),
                                const SizedBox(width: 10),
                                Text(
                                    'У: ${positionsList[index].carbs.toString()}'),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Text(
            '${positionsList[index].price} руб.',
            style: const TextStyle(
                fontSize: 15, fontFamily: 'Lora', fontWeight: FontWeight.w700),
          ),
          Flexible(
            child: Text(
              positionsList[index].title,
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 12,
              ),
            ),
          ),
          Text(
              '${positionsList[index].weight}г + '
              '${positionsList[index].caloric}калл',
              style:
                  TextStyle(fontSize: 10, color: Theme.of(context).hintColor)),
          const SizedBox(height: 5),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 227, 227, 227),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.remove_outlined),
                Text('1'),
                Icon(Icons.add),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
