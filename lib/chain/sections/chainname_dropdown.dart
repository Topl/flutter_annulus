import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_annulus/chain/models/chains.dart';
import 'package:flutter_annulus/chain/providers/selected_chain_provider.dart';
import 'package:flutter_annulus/shared/theme.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_side_sheet/modal_side_sheet.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

import '../../shared/constants/ui.dart';
import '../../shared/utils/theme_color.dart';
import 'add_new_network.dart';

class ChainNameDropDown extends HookConsumerWidget {
  final ThemeMode colorTheme;
  final void Function()? onItemSelected;

  ChainNameDropDown({
    Key? key,
    this.colorTheme = ThemeMode.light,
    this.onItemSelected,
  }) : super(key: key);

  final isDropDownOpen = useState(false);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Chains selectedChain = ref.watch(selectedChainProvider);
    final isResponsive = ResponsiveBreakpoints.of(context).smallerThan(DESKTOP);
    final AsyncValue<List<Chains>> allChains = ref.watch(chainsProvider);

    return allChains.when(
      data: (List<Chains> chains) {
        return isResponsive
            ? _ResponsiveDropDown(
                onItemSelected: onItemSelected,
                chains: chains,
                selectedChain: selectedChain,
                colorTheme: colorTheme,
                setSelectedChain: (Chains chain) {
                  ref.read(selectedChainProvider.notifier).state = chain;
                },
                isDropDownOpen: isDropDownOpen,
              )
            : _DesktopDropdown(
                chains: chains,
                selectedChain: selectedChain,
                colorTheme: colorTheme,
                setSelectedChain: (Chains chain) {
                  ref.read(selectedChainProvider.notifier).state = chain;
                },
                isDropDownOpen: isDropDownOpen,
              );
      },
      error: (error, stack) => const Text('Oops, something unexpected happened'),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class _ResponsiveDropDown extends StatelessWidget {
  final List<Chains> chains;
  final Chains selectedChain;
  final ThemeMode colorTheme;
  final Function(Chains) setSelectedChain;
  final ValueNotifier<bool> isDropDownOpen;
  final void Function()? onItemSelected;

  const _ResponsiveDropDown({
    required this.chains,
    required this.selectedChain,
    required this.colorTheme,
    required this.setSelectedChain,
    required this.isDropDownOpen,
    required this.onItemSelected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Network",
          style: bodyMedium(context),
        ),
        const Spacer(),
        DropdownButtonHideUnderline(
            child: DropdownButton2(
          isExpanded: true,
          hint: const CustomTextWidget(),
          items: [
            ...chains
                .map((Chains chain) => DropdownMenuItem(
                      value: chain,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              chain.networkName,
                              style: bodyMedium(context),
                            ),
                          ),
                          if (selectedChain == chain)
                            const Icon(
                              Icons.check,
                              color: Color(0xFF7040EC),
                              size: 24,
                            ),
                        ],
                      ),
                    ))
                .toList(),
            DropdownMenuItem(
              value: 'Add new',
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: getSelectedColor(
                        colorTheme,
                        0xFF535757,
                        0xFF858E8E,
                      ),
                      width: 0.2,
                    ),
                  ),
                ),
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      showModalSideSheet(
                          context: context,
                          ignoreAppBar: true,
                          width: 640,
                          barrierColor: Colors.white.withOpacity(barrierOpacity),
                          // with blur,
                          barrierDismissible: true,
                          body: AddNewNetworkContainer(
                            colorTheme: colorTheme,
                          ));

                      onItemSelected?.call();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                      child: Row(
                        children: [
                          const Icon(Icons.add, color: Color(0xFF535757), size: 20),
                          const SizedBox(width: 4),
                          Text(
                            'Add new',
                            style: bodyMedium(context),
                          ),
                        ],
                      ),
                    )),
              ),
            )
          ],
          value: selectedChain,
          selectedItemBuilder: (context) => chains
              .map((Chains chain) => Row(
                    children: [
                      CustomItem(
                        name: chain.networkName,
                      ),
                    ],
                  ))
              .toList(),
          onChanged: (value) {
            if (value is Chains) setSelectedChain(value);
          },
          buttonStyleData: ButtonStyleData(
            height: 40,
            width: 160,
            padding: const EdgeInsets.only(left: 16, right: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: getSelectedColor(colorTheme, 0x809E9E9E, 0xFF4B4B4B),
              ),
              color: getSelectedColor(colorTheme, 0xFFF5F5F5, 0xFF4B4B4B),
            ),
          ),
          dropdownStyleData: DropdownStyleData(
              maxHeight: 260,
              width: 345,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: getSelectedColor(colorTheme, 0xFFFEFEFE, 0xFF282A2C),
              ),
              offset: const Offset(-185, -6),
              scrollbarTheme: ScrollbarThemeData(
                radius: const Radius.circular(40),
                thickness: MaterialStateProperty.all(6),
                thumbVisibility: MaterialStateProperty.all(true),
              )),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
          ),
          iconStyleData: IconStyleData(
            icon: isDropDownOpen.value
                ? const Icon(
                    Icons.keyboard_arrow_up,
                    color: Color(0xFF858E8E),
                  )
                : const Icon(
                    Icons.keyboard_arrow_down,
                    color: Color(0xFF858E8E),
                  ),
            iconSize: 20,
          ),
          onMenuStateChange: (isOpen) {
            isDropDownOpen.value = !isDropDownOpen.value;
          },
        )),
      ],
    );
  }
}

class _DesktopDropdown extends StatelessWidget {
  final List<Chains> chains;
  final Chains selectedChain;
  final ThemeMode colorTheme;
  final Function(Chains) setSelectedChain;
  final ValueNotifier<bool> isDropDownOpen;

  const _DesktopDropdown({
    required this.chains,
    required this.selectedChain,
    required this.colorTheme,
    required this.setSelectedChain,
    required this.isDropDownOpen,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          isExpanded: true,
          hint: const CustomTextWidget(),
          items: [
            ...chains
                .map(
                  (Chains chain) => DropdownMenuItem(
                    value: chain,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Row(
                        children: [
                          CustomItem(
                            name: chain.networkName,
                          ),
                          const Spacer(),
                          Icon(
                            Icons.check,
                            color: const Color(0xFF7040EC),
                            size: selectedChain == chain ? 24 : 0,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
            DropdownMenuItem(
              value: 'Add new',
              child: TextButton(
                onPressed: () {
                  showModalSideSheet(
                      context: context,
                      ignoreAppBar: false,
                      width: 640,
                      barrierColor: Colors.white.withOpacity(barrierOpacity),
                      // with blur,
                      barrierDismissible: true,
                      body: AddNewNetworkContainer(
                        colorTheme: colorTheme,
                      ));
                },
                child: Row(
                  children: [
                    const Icon(Icons.add, color: Color(0xFF535757), size: 20),
                    const SizedBox(width: 8),
                    Text(
                      'Add new',
                      style: bodyMedium(context),
                    ),
                  ],
                ),
              ),
            )
          ],
          value: selectedChain,
          selectedItemBuilder: (context) => chains
              .map((Chains chain) => Row(
                    children: [
                      Text(
                        chain.networkName,
                        style: titleMedium(context),
                      ),
                    ],
                  ))
              .toList(),
          onChanged: (value) {
            if (value is Chains) setSelectedChain(value);
          },
          buttonStyleData: ButtonStyleData(
            height: 40,
            width: 160,
            padding: const EdgeInsets.only(left: 14, right: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: getSelectedColor(
                  colorTheme,
                  0xFFC0C4C4,
                  0xFF4B4B4B,
                ),
              ),
              color: getSelectedColor(
                colorTheme,
                0xFFFEFEFE,
                0xFF282A2C,
              ),
            ),
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: 260,
            decoration: BoxDecoration(
              color: getSelectedColor(
                colorTheme,
                0xFFFEFEFE,
                0xFF282A2C,
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
              ),
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
          ),
          iconStyleData: IconStyleData(
            icon: isDropDownOpen.value
                ? const Icon(
                    Icons.keyboard_arrow_up,
                    color: Color(0xFF858E8E),
                  )
                : const Icon(
                    Icons.keyboard_arrow_down,
                    color: Color(0xFF858E8E),
                  ),
            iconSize: 20,
          ),
          onMenuStateChange: (isOpen) {
            isDropDownOpen.value = !isDropDownOpen.value;
          },
        ),
      ),
    );
  }
}

class CustomItem extends StatelessWidget {
  const CustomItem({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: bodyMedium(context),
    );
  }
}

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Chain Name',
      style: bodyMedium(context),
    );
  }
}
