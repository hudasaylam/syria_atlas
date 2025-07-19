import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  final Map<String, bool> currentFilters;
  final Function(Map<String, bool>) saveFilters;

  const FilterScreen({
    super.key,
    required this.currentFilters,
    required this.saveFilters,
  });

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  late bool _isSummer;
  late bool _isWinter;

  @override
  void initState() {
    super.initState();
    _isSummer = widget.currentFilters['summer'] ?? false;
    _isWinter = widget.currentFilters['winter'] ?? false;
  }

  void _changeFilters() {
    final selectedFilters = {'summer': _isSummer, 'winter': _isWinter};
    widget.saveFilters(selectedFilters);
  }

  Widget buildSwitchListTile(
    String title,
    String subtitle,
    bool currentValue,
    Function(bool) updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Use Filter to Search',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        actions: [
          IconButton(icon: Icon(Icons.save), onPressed: _changeFilters),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary,
              ],
              stops: [0.1, 1.0],
              begin: Alignment.topLeft,
              end: Alignment.topRight,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          buildSwitchListTile(
            'Summer trips',
            'Display only the Summer trips',
            _isSummer,
            (newValue) {
              setState(() {
                _isSummer = newValue;
              });
            },
          ),
          buildSwitchListTile(
            'Winter trips',
            'Display only the Winter trips',
            _isWinter,
            (newValue) {
              setState(() {
                _isWinter = newValue;
              });
            },
          ),
        ],
      ),
    );
  }
}
