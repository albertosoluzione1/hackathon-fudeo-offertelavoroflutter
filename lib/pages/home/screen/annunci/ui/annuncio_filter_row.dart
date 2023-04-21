import 'package:flutter/material.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/utils/utils.dart' as mutils;

class AnnuncioFilterRow extends StatelessWidget {
  const AnnuncioFilterRow({
    super.key,
    required this.icon,
    required this.color,
    required this.label,
  });

  final IconData icon;
  final String color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () => {},
            icon: Icon(
              icon,
              size: 18,
            ),
            style: IconButton.styleFrom(
              foregroundColor: mutils.getLabelColorForSelect(
                color,
              ),
              backgroundColor: mutils.getColorForSelect(
                color,
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
