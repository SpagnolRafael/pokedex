import 'package:flutter/material.dart';
import 'package:pokedex/dtos/pokemon_dto.dart';
import 'package:pokedex/shared/widgets/filter_element_widget.dart';

class FilterTypeList extends StatelessWidget {
  FilterTypeList({super.key});

  final List<ElementType> elementTypes = [
    ElementType.fire,
    ElementType.normal,
    ElementType.wind,
    ElementType.earth,
    ElementType.stone,
    ElementType.water,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: SizedBox(
        height: 24,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: elementTypes.length,
          separatorBuilder: (context, index) => const SizedBox(width: 7),
          itemBuilder: (context, index) {
            final element = elementTypes[index];
            return FilterElementType(
              color: ElementTypeExt.color(element),
              label: ElementTypeExt.label(element),
            );
          },
        ),
      ),
    );
  }
}
