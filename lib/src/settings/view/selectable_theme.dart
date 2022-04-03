import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:working_with_real_projects/src/settings/bloc/settings_bloc.dart';
import 'package:working_with_real_projects/src/settings/extensions/theme_extension.dart';

class SelectableTheme extends StatelessWidget {
  const SelectableTheme({
    Key? key,
    required this.themeMode,
    required this.selected,
  }) : super(key: key);

  final ThemeMode themeMode;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () =>
            context.read<SettingsBloc>().add(ChangeThemeEvent(themeMode)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 3,
              color: selected
                  ? Theme.of(context).indicatorColor
                  : Theme.of(context).unselectedWidgetColor,
            ),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(6),
                  topRight: Radius.circular(6),
                ),
                child: SvgPicture.asset(
                  themeMode.imagePath(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Text(
                  themeMode.name,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
