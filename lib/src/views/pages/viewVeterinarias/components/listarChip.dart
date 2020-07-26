import 'package:flutter/material.dart';

import 'chip.dart';

listarChip(dynamic chips) {
  if (chips != null) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 35.0,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: chips.length,
            itemBuilder: (BuildContext context, int index) =>
                chip(chips[index], context),
          ),
        ),
      ),
    );
  } else {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 0.0,
      ),
    );
  }
}
