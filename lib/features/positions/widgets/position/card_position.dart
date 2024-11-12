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
    return BaseContainer(
      color: Theme.of(context).highlightColor,
      child: Column(
        children: [
          GestureDetector(
            child: Container(
              height: 100,
              width: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(apiUrl + position.imgSrc),
                ),
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
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 10.0, right: 10.0),
                        height: 230,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom:
                                BorderSide(color: theme.primaryColor, width: 5),
                          ),
                          borderRadius: const BorderRadiusDirectional.vertical(
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
                                    borderRadius: BorderRadius.circular(30)),
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
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                position.price.toString(),
                style:
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
              const Icon(
                Icons.currency_ruble,
                size: 17,
                color: Colors.black,
              )
            ],
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
              style: TextStyle(fontSize: 10, color: theme.hintColor)),
          const SizedBox(height: 5),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 18),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 227, 227, 227),
              borderRadius: BorderRadius.circular(20),
            ),
            child: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
              final positions = state.cartPositions;
              var findPosition = positions
                  .where((x) => x.id == widget.positionsList[widget.index].id)
                  .toList();
              return SizedBox(
                height: 35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                        child: Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius:
                                  BorderRadiusDirectional.circular(30)),
                          child: const Icon(
                            Icons.remove_outlined,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        onTap: () {
                          BlocProvider.of<CartBloc>(context).add(
                              RemovePositionCartEvent(
                                  position:
                                      widget.positionsList[widget.index]));
                        }),
                    Text(
                      findPosition.isNotEmpty
                          ? findPosition[0].quantityInCart.toString()
                          : '0',
                      style: const TextStyle(fontSize: 16),
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
                            size: 20,
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
              );
            }),
          ),
        ],
      ),
    );
  }
}
