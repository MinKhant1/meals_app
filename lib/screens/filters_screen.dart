import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  const FiltersScreen(
      {required this.saveFilters, required this.currentFilters});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    _vegan = widget.currentFilters['vegan']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    super.initState();
  }

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue(neV)) {
    return SwitchListTile(
        title: Text(title),
        value: currentValue,
        subtitle: Text(description),
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Filters'),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  final selectedFilters = {
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegan': _vegan,
                    'vegetarian': _vegetarian,
                  };
                  widget.saveFilters(selectedFilters);
                },
                icon: Icon(Icons.save))
          ],
        ),
        drawer: MainDrawer(),
        body: Column(children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              SwitchListTile(
                  title: Text('Gluten-free'),
                  value: _glutenFree,
                  subtitle: Text('Include only Gluten-free meals'),
                  onChanged: (newV) {
                    setState(() {
                      _glutenFree = newV;
                    });
                  }),
              SwitchListTile(
                  title: Text('Vegetarion'),
                  value: _vegetarian,
                  subtitle: Text('Include only Vegetarion meals'),
                  onChanged: (newV) {
                    setState(() {
                      _vegetarian = newV;
                    });
                  }),
              SwitchListTile(
                  title: Text('Vegan'),
                  value: _vegan,
                  subtitle: Text('Include only Vegan meals'),
                  onChanged: (newV) {
                    setState(() {
                      _vegan = newV;
                    });
                  }),
              SwitchListTile(
                  title: Text('Lactose-free'),
                  value: _lactoseFree,
                  subtitle: Text('Include only Lactose free meals'),
                  onChanged: (newV) {
                    setState(() {
                      _lactoseFree = newV;
                    });
                  }),
            ],
          ))
        ]));
  }
}
