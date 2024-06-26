import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/features/insurances/data/model/garantie_model.dart';

class GarantieItem extends StatefulWidget {
  const GarantieItem({
    Key? key,
    required this.garantie,
    required this.onChanged,
  }) : super(key: key);

  final Garantie garantie;
  final void Function(bool?) onChanged;

  @override
  State<GarantieItem> createState() => _GarantieItemState();
}

class _GarantieItemState extends State<GarantieItem> {
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            expanded = !expanded;
                          });
                        },
                        icon: Icon(
                            (expanded) ? Icons.expand_less : Icons.expand_more),
                      ),
                      Expanded(
                        child: Text(
                          widget.garantie.title,
                          style: Styles.normal14.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 5),
                Row(
                  children: [
                    Text(
                      '${widget.garantie.prix.toString()} DH',
                      style: Styles.normal12.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Checkbox(
                      value: widget.garantie.checked,
                      onChanged: widget.onChanged,
                      shape: const CircleBorder(),
                      side: BorderSide(
                          color: Theme.of(context).colorScheme.primary),
                      checkColor: Theme.of(context).colorScheme.primary,
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
              child: Text(
                widget.garantie.description,
                style: Styles.normal12.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.justify,
                maxLines: (expanded) ? 10 : 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}