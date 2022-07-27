import 'package:flutter/material.dart';
import 'package:travel_app/widgets/drawer_app.dart';

class FilterScreen extends StatefulWidget {
  static const screenRoute = '/FilterScreen';
  final Function saveFilters;
  final Map<String, bool> filters;

  FilterScreen(this.filters, this.saveFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _summer = false;
  var _winter = false;
  var _family = false;
  @override
  void initState() {
    _summer = widget.filters['summer'] as bool;
    _winter = widget.filters['winter'] as bool;
    _family = widget.filters['family'] as bool;
    super.initState();
  }

  SwitchListTile buildMethod(
      String title, String subtitle, var value, var Fun) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: Fun,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('التصفية'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              final Map<String, bool> filters = {
                'summer': _summer,
                'winter': _winter,
                'family': _family,
              };
              widget.saveFilters(filters);
            },
            icon: const Icon(Icons.save),
          )
        ],
      ),
      drawer: const DrawerScreen(),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: ListView(
              children: [
                buildMethod('الرحلات الصيفية', 'اظهار الرحلات في فصل الصيف فقط',
                    _summer, (newValue) {
                  setState(() {
                    _summer = newValue;
                  });
                }),
                buildMethod('الرحلات الشتوية',
                    'اظهار الرحلات في فصل الشتاء فقط', _winter, (newValue) {
                  setState(() {
                    _winter = newValue;
                  });
                }),
                buildMethod(
                    'الرحلات العائلية', 'اظهار الرحلات للعائلة فقط', _family,
                    (newValue) {
                  setState(() {
                    _family = newValue;
                  });
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
