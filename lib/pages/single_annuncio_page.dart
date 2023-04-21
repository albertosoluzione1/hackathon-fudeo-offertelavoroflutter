// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/localization/app_localizations_context.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/models/annuncio.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/pages/home/screen/annunci/ui/annuncio_descrizione_row.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/pages/home/screen/annunci/ui/annuncio_filter_row.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/pages/home/screen/annunci/ui/annuncio_row_info_row.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/utils/colors.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/utils/utils.dart' as mutils;

class SingleAnnuncioPage extends StatelessWidget {
  const SingleAnnuncioPage({super.key, required this.annuncio});

  final Annuncio annuncio;

  void _shareAnnuncio(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            QrImage(
              size: mutils.getScreenHeight(context) * .3,
              padding: const EdgeInsets.all(16),
              data: annuncio.hrefOfferta,
              version: QrVersions.auto,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () => {},
          ),
          IconButton(
            icon: const Icon(Icons.copy_outlined),
            onPressed: () {
              mutils.copyToClipboard(annuncio.hrefOfferta);
              mutils.showToast(context.loc.labelLinkOffertaCopiato);
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              icon: const Icon(Icons.share),
              onPressed: () => _shareAnnuncio(context),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 16,
                    bottom: 12,
                  ),
                  child: Text(
                    annuncio.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                AnnuncioRowInfoRow(
                  label: annuncio.aziendaName,
                  icon: Icons.domain,
                  isWithIcon: true,
                  size: 18,
                ),
                AnnuncioRowInfoRow(
                  label: annuncio.localita,
                  icon: Icons.location_on,
                  isWithIcon: true,
                  size: 18,
                ),
                if (annuncio.retribuzione.isNotEmpty)
                  AnnuncioRowInfoRow(
                    label: annuncio.retribuzione,
                    icon: Icons.payment_outlined,
                    isWithIcon: true,
                    size: 18,
                  ),
                AnnuncioRowInfoRow(
                  label: mutils.formatDatetimeToDisplay(
                      annuncio.createdTime, "d MMMM yyyy"),
                  icon: Icons.schedule_outlined,
                  isWithIcon: true,
                  size: 18,
                ),
                const SizedBox(
                  height: 12,
                ),
                if (annuncio.teamName.isNotEmpty)
                  AnnuncioFilterRow(
                    icon: Icons.location_on,
                    color: annuncio.teamColor,
                    label: annuncio.teamName,
                  ),
                if (annuncio.contrattoName.isNotEmpty)
                  AnnuncioFilterRow(
                    icon: Icons.work_history,
                    color: annuncio.contrattoColor,
                    label: annuncio.contrattoName,
                  ),
                if (annuncio.seniorityName.isNotEmpty)
                  AnnuncioFilterRow(
                    icon: Icons.workspace_premium,
                    color: annuncio.seniorityColor,
                    label: annuncio.seniorityName,
                  ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 18,
                    bottom: 16,
                  ),
                  child: Text(
                    context.loc.descrizioneOffertaLabel,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
                if (annuncio.descrizioneList.isNotEmpty)
                  AnnuncioDescrizioneRow(
                    descrizioneList: annuncio.descrizioneList,
                  ),
                const SizedBox(
                  height: 16,
                )
              ],
            ),
          ),
          SizedBox(
            height: 72,
            child: GestureDetector(
              onTap: () => {mutils.launchURL(annuncio.hrefOfferta)},
              child: Container(
                decoration: BoxDecoration(
                  color: BrandColors.primaryColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(4),
                  ),
                ),
                margin: const EdgeInsets.all(12),
                child: Center(
                  child: Text(
                    context.loc.linkAnnuncionBtn,
                    style: TextStyle(
                      color: BrandColors.onPrimaryColor,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
