import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../data/model/pokemon_response.dart';
import '../provider/pokemon._provider.dart';

class ImageListView extends StatefulWidget {
  ImageListView({Key? key, required this.startIndex, this.duration = 0})
      : super(key: key);
  final int startIndex;
  final int duration;

  @override
  State<ImageListView> createState() => _ImageListViewState();
}

class _ImageListViewState extends State<ImageListView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        _autonSctroll();
      }
    });
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _autonSctroll();
    });
  }

  _autonSctroll() {
    final currentP = _scrollController.offset;
    final scrollEnd = _scrollController.position.maxScrollExtent;
    scheduleMicrotask(() {
      _scrollController.animateTo(currentP == scrollEnd ? 0 : scrollEnd,
          duration: Duration(seconds: widget.duration), curve: Curves.linear);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 1.96 * pi,
      child: SizedBox(
          height: 150,
          child: ListView.builder(
            controller: _scrollController,
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              return _ImageTile(
                  image: 'assets/pokemons/${widget.startIndex + i}.svg');
            },
          )),
    );
  }
}

class _ImageTile extends StatelessWidget {
  const _ImageTile({Key? key, required this.image}) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(image, width: 130);
  }
}
