import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:snack_time/repositories/models.dart';
import 'package:snack_time/ui/shared/widgets/base_container.dart';

class CardPosition extends StatefulWidget {
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
  State<CardPosition> createState() => _CardPositionState();
}

class _CardPositionState extends State<CardPosition> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    double turns = 0.0;
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
                    image: NetworkImage(
                        widget.url + widget.positionsList[widget.index].imgSrc),
                    fit: BoxFit.cover),
              ),
            ),
            onTap: () => showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) => Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 4),
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding:
                              const EdgeInsets.only(top: 10.0, right: 10.0),
                          height: 230,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadiusDirectional.vertical(
                                    top: Radius.circular(20)),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                widget.url +
                                    widget.positionsList[widget.index].imgSrc,
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
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: AnimatedRotation(
                                      duration: const Duration(seconds: 50),
                                      turns: turns,
                                      child: const Icon(
                                        Icons.close,
                                        color: Colors.white,
                                        size: 25,
                                      ),
                                    ),
                                  )),
                              onTap: () => AutoRouter.of(context).maybePop()),
                        ),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.positionsList[widget.index].title,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                '${widget.positionsList[widget.index].weight}г',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Theme.of(context).hintColor),
                              ),
                              const SizedBox(height: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Состав:',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    widget.positionsList[widget.index]
                                        .composition,
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 17),
                              const Text(
                                ' На 100г по открытым данным:',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w600),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: theme.highlightColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            '${widget.positionsList[widget.index].caloric.toString()}г',
                                            style: theme.textTheme.labelSmall),
                                        Text('ккал',
                                            style: theme.textTheme.labelSmall),
                                      ],
                                    ),
                                    const SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            '${widget.positionsList[widget.index].proteins.toString()}г',
                                            style: theme.textTheme.labelSmall),
                                        Text('белки',
                                            style: theme.textTheme.labelSmall),
                                      ],
                                    ),
                                    const SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            '${widget.positionsList[widget.index].fats.toString()}г',
                                            style: theme.textTheme.labelSmall),
                                        Text('жиры',
                                            style: theme.textTheme.labelSmall),
                                      ],
                                    ),
                                    const SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            '${widget.positionsList[widget.index].carbs.toString()}г',
                                            style: theme.textTheme.labelSmall),
                                        Text('углеводы',
                                            style: theme.textTheme.labelSmall),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  bottomNavigationBar: BottomAppBar(
                    height: 60,
                    color: Colors.white,
                    child: GestureDetector(
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.7,
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        height: 30,
                        decoration: BoxDecoration(
                            color: theme.primaryColor,
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                          child: Text(
                            'В корзину за ${widget.positionsList[widget.index].price}руб.',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      onTap: () => AutoRouter.of(context).maybePop(),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Text(
            '${widget.positionsList[widget.index].price} руб.',
            style: const TextStyle(
                fontSize: 15, fontFamily: 'Lora', fontWeight: FontWeight.w700),
          ),
          Flexible(
            child: Text(
              widget.positionsList[widget.index].title,
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 12,
              ),
            ),
          ),
          Text(
              '${widget.positionsList[widget.index].weight}г + '
              '${widget.positionsList[widget.index].caloric}калл',
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
