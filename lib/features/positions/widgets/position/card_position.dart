import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snack_time/features/cart/bloc/cart_bloc.dart';
import 'package:snack_time/features/positions/widgets/widgets.dart';
import 'package:snack_time/repositories/api_url.dart';
import 'package:snack_time/repositories/models.dart';
import 'package:snack_time/ui/shared/widgets/base_container.dart';

class CardPosition extends StatefulWidget {
  const CardPosition({
    super.key,
    required this.positionsList,
    required this.index,
  });

  final List<Position> positionsList;
  final int index;

  @override
  State<CardPosition> createState() => _CardPositionState();
}

class _CardPositionState extends State<CardPosition> {
  @override
  Widget build(BuildContext context) {
    Position position = widget.positionsList[widget.index];
    final theme = Theme.of(context);
    return SizedBox(
      height: 160,
      width: 130,
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          BaseContainer(
            color: Colors.white,
            child: Column(
              children: [
                GestureDetector(
                  child: Container(
                    height: 100,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      image: DecorationImage(
                          image: CachedNetworkImageProvider(
                              apiUrl + position.imgSrc),
                          fit: BoxFit.cover),
                    ),
                  ),
                  onTap: () => showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) => Scaffold(
                      backgroundColor: Colors.transparent,
                      body: Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 5),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.only(top: 10.0, right: 10.0),
                              height: 230,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      color: theme.primaryColor, width: 5),
                                ),
                                borderRadius:
                                    const BorderRadiusDirectional.vertical(
                                        top: Radius.circular(20)),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: CachedNetworkImageProvider(
                                    apiUrl + position.imgSrc,
                                  ),
                                ),
                              ),
                              child: GestureDetector(
                                child: Align(
                                    alignment: AlignmentDirectional.topEnd,
                                    child: Container(
                                      padding: const EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                          color: theme.primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: const Icon(Icons.close,
                                          color: Colors.white),
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
                const SizedBox(height: 10),
                Flexible(
                  child: Text(
                    widget.positionsList[widget.index].title,
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 14,
                    ),
                  ),
                ),
                Text(
                    '${widget.positionsList[widget.index].weight}г + '
                    '${widget.positionsList[widget.index].caloric}калл',
                    style: TextStyle(fontSize: 10, color: theme.hintColor)),
                const SizedBox(height: 10),
                SizedBox(
                  height: 35,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        '${position.price.toString()} руб',
                        style: const TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 16),
                      ),
                      GestureDetector(
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius:
                                    BorderRadiusDirectional.circular(30)),
                            child: const Icon(
                              Icons.add_outlined,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                          onTap: () {
                            BlocProvider.of<CartBloc>(context).add(
                                AddPositionCartEvent(
                                    position:
                                        widget.positionsList[widget.index]));
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(18),
                      bottomLeft: Radius.circular(18))),
              child: const Text(
                "Новинка",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
              color: Colors.red,
              child: const Text(
                "-10%",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              decoration: BoxDecoration(
                  color: theme.primaryColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(18),
                      bottomRight: Radius.circular(18))),
              child: const Text(
                "Хит",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
