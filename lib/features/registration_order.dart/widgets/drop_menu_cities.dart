import 'package:flutter/material.dart';

class DropMenuCities extends StatelessWidget {
  const DropMenuCities({
    super.key,
    required TextEditingController cityController,
    required this.onTap,
  }) : _cityController = cityController;

  final TextEditingController _cityController;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      expandedInsets: const EdgeInsets.all(2),
      label: const Text('Город', style: TextStyle(fontSize: 15)),
      controller: _cityController,
      menuHeight: 200,
      menuStyle: MenuStyle(
        backgroundColor: WidgetStateProperty.all(Colors.white),
      ),
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: Color.fromARGB(255, 220, 220, 220)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      dropdownMenuEntries: const <DropdownMenuEntry<String>>[
        DropdownMenuEntry(value: 'obninsk', label: 'Обнинск'),
        DropdownMenuEntry(value: 'balabanovo', label: 'Балабаново'),
        DropdownMenuEntry(value: 'borovsk', label: 'Боровск'),
      ],
      onSelected: (_) => onTap(),
    );
  }
}
