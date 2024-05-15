import 'package:delimeal_app/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
 final Function _saveFilters;
 final Map<String, bool> currentFilters;
  static const routeName = '/filters';
 const FiltersScreen(this.currentFilters,this._saveFilters, );

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
   _glutenFree=widget.currentFilters['gluten']!;
    _lactoseFree=widget.currentFilters['lactose']!;
    _vegan=widget.currentFilters['vegan']!;
    _vegetarian=widget.currentFilters['vegetarian']!;
    super.initState();
  }

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(description),
        value: currentValue,
        onChanged: (newValue) {
          updateValue(newValue);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters!'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget._saveFilters(selectedFilters);
            
            },
          )
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: Text('Adjust your meal selection.',
              style: Theme.of(context).textTheme.titleSmall),
        ),
        Expanded(
            child: ListView(
          children: [
            _buildSwitchListTile(
                'Gluten-free', 'Only include gluten-free meals', _glutenFree,
                (newValue) {
              setState(
                () {
                  _glutenFree = newValue;
                },
              );
            }),
            _buildSwitchListTile(
                'Lactose-free', 'Only include lactose-free meals', _lactoseFree,
                (newValue) {
              setState(
                () {
                  _lactoseFree = newValue;
                },
              );
            }),
            _buildSwitchListTile(
                'Vegetarian', 'Only include vegetarian meals', _vegetarian,
                (newValue) {
              setState(
                () {
                  _vegetarian = newValue;
                },
              );
            }),
            _buildSwitchListTile('Vegan', 'Only include vegan meals', _vegan,
                (newValue) {
              setState(
                () {
                  _vegan = newValue;
                },
              );
            }),
          ],
        ))
      ]),
    );
  }
}
