import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:snack_time/features/restaurant/widgets/widgets.dart';
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
                    top: MediaQuery.of(context).size.height / 5),
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
                                      borderRadius: BorderRadius.circular(30)),
                                  child: AnimatedRotation(
                                    duration: const Duration(seconds: 50),
                                    turns: turns,
                                    child: const Icon(Icons.close,
                                        color: Colors.white),
                                  ),
                                )),
                            onTap: () {
                              AutoRouter.of(context).maybePop();
                            },
                          ),
                        ),
                        DescriptionPosition(widget: widget),
                      ],
                    ),
                  ),
                  bottomNavigationBar: ButtonAddCart(widget: widget),
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
