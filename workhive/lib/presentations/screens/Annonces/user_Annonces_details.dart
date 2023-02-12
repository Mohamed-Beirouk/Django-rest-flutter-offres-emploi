// import 'package:workHive/models/login_model.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// import '../../../size_config.dart';
// import '../../constants/constants.dart';
//
// class VendorAnnoncesDetails extends StatefulWidget {
//   const VendorAnnoncesDetails({Key? key}) : super(key: key);
//
//   @override
//   State<VendorAnnoncesDetails> createState() =>
//       _VendorAnnoncesDetailsState();
// }
//
// class _VendorAnnoncesDetailsState extends State<VendorAnnoncesDetails> {
//   bool loading = false;
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     Historique oneHisto =
//         ModalRoute.of(context)!.settings.arguments as Historique;
//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//           color: greylightycolor,
//           height: size.height,
//           width: size.width,
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Container(
//                   color: whitecolor,
//                   height: getProportionateScreenHeight(60),
//                   padding: EdgeInsets.fromLTRB(
//                     getProportionateScreenWidth(15),
//                     getProportionateScreenHeight(0),
//                     getProportionateScreenWidth(20),
//                     getProportionateScreenHeight(0),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.pop(context);
//                         },
//                         child: Row(
//                           children: [
//                             const Icon(
//                               CupertinoIcons.back,
//                               size: 18,
//                             ),
//                             Text(
//                               Translations.of(context)!.Historique,
//                               style: textstyle.copyWith(
//                                   fontWeight: FontWeight.w400,
//                                   fontSize: getProportionateScreenHeight(14)),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Text(
//                         Translations.of(context)!.fastpayement,
//                         style: textstyle.copyWith(
//                             color: secondaryColor,
//                             fontWeight: FontWeight.w700,
//                             fontSize: getProportionateScreenHeight(16)),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.fromLTRB(
//                             getProportionateScreenWidth(5),
//                             getProportionateScreenHeight(15),
//                             getProportionateScreenWidth(5),
//                             getProportionateScreenHeight(15)),
//                         child: SvgPicture.asset(
//                           "assets/svg/menu.svg",
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 spaceHeight(
//                   getProportionateScreenHeight(10),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.fromLTRB(
//                       getProportionateScreenWidth(10),
//                       getProportionateScreenHeight(5),
//                       getProportionateScreenWidth(10),
//                       getProportionateScreenHeight(5)),
//                   child: Column(
//                     children: [
//                       loading
//                           ? Column(
//                               children: [
//                                 Container(
//                                     padding: EdgeInsets.fromLTRB(
//                                         getProportionateScreenWidth(10),
//                                         getProportionateScreenHeight(20),
//                                         getProportionateScreenWidth(10),
//                                         getProportionateScreenHeight(10)),
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(
//                                             getProportionateScreenHeight(10)),
//                                         color: whitecolor),
//                                     child:  Center(child: CircularProgressIndicator(color:primaryColor))),
//                                 spaceHeight(
//                                   getProportionateScreenHeight(20),
//                                 ),
//                                 Container(
//                                     padding: EdgeInsets.fromLTRB(
//                                         getProportionateScreenWidth(10),
//                                         getProportionateScreenHeight(20),
//                                         getProportionateScreenWidth(10),
//                                         getProportionateScreenHeight(0)),
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(
//                                             getProportionateScreenHeight(10)),
//                                         color: whitecolor),
//                                     child: Center(child: CircularProgressIndicator(color:primaryColor))
//                                 ),
//                                 spaceHeight(
//                                   getProportionateScreenHeight(20),
//                                 ),
//                                 Container(
//                                     padding: EdgeInsets.fromLTRB(
//                                         getProportionateScreenWidth(10),
//                                         getProportionateScreenHeight(20),
//                                         getProportionateScreenWidth(10),
//                                         getProportionateScreenHeight(0)),
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(
//                                             getProportionateScreenHeight(10)),
//                                         color: whitecolor),
//                                     child: Center(child: CircularProgressIndicator(color:primaryColor))),
//                               ],
//                             )
//                           : Column(
//                               children: [
//                                 Container(
//                                   padding: EdgeInsets.fromLTRB(
//                                       getProportionateScreenWidth(15),
//                                       getProportionateScreenHeight(20),
//                                       getProportionateScreenWidth(15),
//                                       getProportionateScreenHeight(20)),
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(
//                                           getProportionateScreenHeight(10)),
//                                       color: whitecolor),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               Text(
//                                                 oneHisto.montant.toString() +
//                                                     ' MRU',
//                                                 style: textstyle.copyWith(
//                                                     fontWeight: FontWeight.w600,
//                                                     fontSize:
//                                                         getProportionateScreenHeight(
//                                                             22)),
//                                               ),
//                                               spaceHeight(
//                                                   getProportionateScreenHeight(
//                                                       4)),
//                                               Text(
//                                                 oneHisto.date_creation
//                                                     .toString(),
//                                                 style: textstyle.copyWith(
//                                                     fontWeight: FontWeight.w400,
//                                                     fontSize:
//                                                         getProportionateScreenHeight(
//                                                             12),
//                                                     color: secondaryColor),
//                                               ),
//                                             ],
//                                           ),
//                                           Container(
//                                             padding: EdgeInsets.fromLTRB(
//                                                 getProportionateScreenWidth(6),
//                                                 getProportionateScreenHeight(2),
//                                                 getProportionateScreenWidth(6),
//                                                 getProportionateScreenHeight(
//                                                     2)),
//                                             decoration: BoxDecoration(
//                                                 color:
//                                                     errorcolor.withOpacity(0.8),
//                                                 borderRadius: BorderRadius.circular(
//                                                     getProportionateScreenHeight(
//                                                         4))),
//                                             child: Text(
//                                               oneHisto.status.toString(),
//                                               style: textstyle.copyWith(
//                                                   fontSize:
//                                                       getProportionateScreenWidth(
//                                                           8),
//                                                   fontWeight: FontWeight.w700,
//                                                   color: whitecolor),
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                       spaceHeight(
//                                           getProportionateScreenHeight(20)),
//                                       Center(
//                                         child: SvgPicture.asset(
//                                           "assets/svg/download_pdf.svg",
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 //--------  General infos  ----------//
//                                 spaceHeight(getProportionateScreenHeight(20)),
//                                 Row(
//                                   children: [
//                                     Padding(
//                                       padding: EdgeInsets.symmetric(
//                                           horizontal:
//                                               getProportionateScreenWidth(10)),
//                                       child: Text(
//                                         Translations.of(context)!
//                                             .Informationsgenerales,
//                                         style: textstyle.copyWith(
//                                             color: primaryColor,
//                                             fontWeight: FontWeight.w700,
//                                             fontSize:
//                                                 getProportionateScreenHeight(
//                                                     16)),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 spaceHeight(getProportionateScreenHeight(10)),
//                                 Container(
//                                   width: double.infinity,
//                                   padding: EdgeInsets.fromLTRB(
//                                       getProportionateScreenWidth(0),
//                                       getProportionateScreenHeight(20),
//                                       getProportionateScreenWidth(0),
//                                       getProportionateScreenHeight(20)),
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(
//                                           getProportionateScreenHeight(10)),
//                                       color: whitecolor),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Padding(
//                                         padding: EdgeInsets.fromLTRB(
//                                             getProportionateScreenWidth(15),
//                                             getProportionateScreenHeight(0),
//                                             getProportionateScreenWidth(15),
//                                             getProportionateScreenHeight(0)),
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               Translations.of(context)!
//                                                   .Nomcompletduclient,
//                                               style: textstyle.copyWith(
//                                                   fontWeight: FontWeight.w400,
//                                                   fontSize:
//                                                       getProportionateScreenHeight(
//                                                           12),
//                                                   color: secondaryColor),
//                                             ),
//                                             spaceHeight(
//                                                 getProportionateScreenHeight(
//                                                     4)),
//                                             Text(
//                                               oneHisto.expediteur!.first_name
//                                                       .toString() +
//                                                   " " +
//                                                   oneHisto.expediteur!.last_name
//                                                       .toString(),
//                                               style: textstyle.copyWith(
//                                                   fontWeight: FontWeight.w700,
//                                                   fontSize:
//                                                       getProportionateScreenHeight(
//                                                           16)),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       Divider(
//                                         color: secondaryColor.withOpacity(0.2),
//                                       ),
//                                       Padding(
//                                         padding: EdgeInsets.fromLTRB(
//                                             getProportionateScreenWidth(15),
//                                             getProportionateScreenHeight(0),
//                                             getProportionateScreenWidth(15),
//                                             getProportionateScreenHeight(0)),
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               Translations.of(context)!
//                                                   .Numerodutelephoneduclient,
//                                               style: textstyle.copyWith(
//                                                   fontWeight: FontWeight.w400,
//                                                   fontSize:
//                                                       getProportionateScreenHeight(
//                                                           12),
//                                                   color: secondaryColor),
//                                             ),
//                                             spaceHeight(
//                                                 getProportionateScreenHeight(
//                                                     4)),
//                                             Text(
//                                               oneHisto.expediteur!.tel
//                                                   .toString(),
//                                               style: textstyle.copyWith(
//                                                   fontWeight: FontWeight.w700,
//                                                   fontSize:
//                                                       getProportionateScreenHeight(
//                                                           16)),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       Divider(
//                                         color: secondaryColor.withOpacity(0.2),
//                                       ),
//                                       Padding(
//                                         padding: EdgeInsets.fromLTRB(
//                                             getProportionateScreenWidth(15),
//                                             getProportionateScreenHeight(0),
//                                             getProportionateScreenWidth(15),
//                                             getProportionateScreenHeight(0)),
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               Translations.of(context)!
//                                                   .Tempsdelivraison,
//                                               style: textstyle.copyWith(
//                                                   fontWeight: FontWeight.w400,
//                                                   fontSize:
//                                                       getProportionateScreenHeight(
//                                                           12),
//                                                   color: secondaryColor),
//                                             ),
//                                             spaceHeight(
//                                                 getProportionateScreenHeight(
//                                                     4)),
//                                             Text(
//                                               oneHisto.delai_livraison
//                                                   .toString(),
//                                               style: textstyle.copyWith(
//                                                   fontWeight: FontWeight.w700,
//                                                   fontSize:
//                                                       getProportionateScreenHeight(
//                                                           16)),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       Divider(
//                                         color: secondaryColor.withOpacity(0.2),
//                                       ),
//                                       Padding(
//                                         padding: EdgeInsets.fromLTRB(
//                                             getProportionateScreenWidth(15),
//                                             getProportionateScreenHeight(0),
//                                             getProportionateScreenWidth(15),
//                                             getProportionateScreenHeight(0)),
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               Translations.of(context)!.libelle,
//                                               style: textstyle.copyWith(
//                                                   fontWeight: FontWeight.w400,
//                                                   fontSize:
//                                                       getProportionateScreenHeight(
//                                                           12),
//                                                   color: secondaryColor),
//                                             ),
//                                             spaceHeight(
//                                                 getProportionateScreenHeight(
//                                                     4)),
//                                             Text(
//                                               oneHisto.libele.toString(),
//                                               style: textstyle.copyWith(
//                                                   fontWeight: FontWeight.w700,
//                                                   fontSize:
//                                                       getProportionateScreenHeight(
//                                                           16)),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       Divider(
//                                         color: secondaryColor.withOpacity(0.2),
//                                       ),
//                                       Padding(
//                                         padding: EdgeInsets.fromLTRB(
//                                             getProportionateScreenWidth(15),
//                                             getProportionateScreenHeight(0),
//                                             getProportionateScreenWidth(15),
//                                             getProportionateScreenHeight(0)),
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               Translations.of(context)!
//                                                   .Fraisdetransaction,
//                                               style: textstyle.copyWith(
//                                                   fontWeight: FontWeight.w400,
//                                                   fontSize:
//                                                       getProportionateScreenHeight(
//                                                           12),
//                                                   color: secondaryColor),
//                                             ),
//                                             spaceHeight(
//                                                 getProportionateScreenHeight(
//                                                     4)),
//                                             Text(
//                                               oneHisto.frais_origine.toString(),
//                                               style: textstyle.copyWith(
//                                                   fontWeight: FontWeight.w700,
//                                                   fontSize:
//                                                       getProportionateScreenHeight(
//                                                           16)),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       Divider(
//                                         color: secondaryColor.withOpacity(0.2),
//                                       ),
//                                       Padding(
//                                         padding: EdgeInsets.fromLTRB(
//                                             getProportionateScreenWidth(15),
//                                             getProportionateScreenHeight(0),
//                                             getProportionateScreenWidth(15),
//                                             getProportionateScreenHeight(0)),
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               Translations.of(context)!
//                                                   .Identifiantdelatransaction,
//                                               style: textstyle.copyWith(
//                                                   fontWeight: FontWeight.w400,
//                                                   fontSize:
//                                                       getProportionateScreenHeight(
//                                                           12),
//                                                   color: secondaryColor),
//                                             ),
//                                             spaceHeight(
//                                                 getProportionateScreenHeight(
//                                                     4)),
//                                             Text(
//                                               oneHisto.code_transaction
//                                                   .toString(),
//                                               style: textstyle.copyWith(
//                                                   fontWeight: FontWeight.w700,
//                                                   fontSize:
//                                                       getProportionateScreenHeight(
//                                                           16)),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//
//                                 //--------  Shop infos  ----------//
//                                 spaceHeight(getProportionateScreenHeight(20)),
//                                 Row(
//                                   children: [
//                                     Padding(
//                                       padding: EdgeInsets.symmetric(
//                                           horizontal:
//                                               getProportionateScreenWidth(10)),
//                                       child: Text(
//                                         Translations.of(context)!
//                                             .Informationsdelaboutique,
//                                         style: textstyle.copyWith(
//                                             color: primaryColor,
//                                             fontWeight: FontWeight.w700,
//                                             fontSize:
//                                                 getProportionateScreenHeight(
//                                                     16)),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//
//                                 spaceHeight(getProportionateScreenHeight(10)),
//                                 Container(
//                                   width: double.infinity,
//                                   padding: EdgeInsets.fromLTRB(
//                                       getProportionateScreenWidth(0),
//                                       getProportionateScreenHeight(20),
//                                       getProportionateScreenWidth(0),
//                                       getProportionateScreenHeight(20)),
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(
//                                           getProportionateScreenHeight(10)),
//                                       color: whitecolor),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Padding(
//                                         padding: EdgeInsets.fromLTRB(
//                                             getProportionateScreenWidth(15),
//                                             getProportionateScreenHeight(0),
//                                             getProportionateScreenWidth(15),
//                                             getProportionateScreenHeight(0)),
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               Translations.of(context)!
//                                                   .Nomboutique,
//                                               style: textstyle.copyWith(
//                                                   fontWeight: FontWeight.w400,
//                                                   fontSize:
//                                                       getProportionateScreenHeight(
//                                                           12),
//                                                   color: secondaryColor),
//                                             ),
//                                             spaceHeight(
//                                                 getProportionateScreenHeight(
//                                                     4)),
//                                             Text(
//                                               oneHisto.destinataire!.first_name
//                                                   .toString(),
//                                               style: textstyle.copyWith(
//                                                   fontWeight: FontWeight.w700,
//                                                   fontSize:
//                                                       getProportionateScreenHeight(
//                                                           16)),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       Divider(
//                                         color: secondaryColor.withOpacity(0.2),
//                                       ),
//                                       Padding(
//                                         padding: EdgeInsets.fromLTRB(
//                                             getProportionateScreenWidth(15),
//                                             getProportionateScreenHeight(0),
//                                             getProportionateScreenWidth(15),
//                                             getProportionateScreenHeight(0)),
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               Translations.of(context)!
//                                                   .Numerodutelephoneduvendeur,
//                                               style: textstyle.copyWith(
//                                                   fontWeight: FontWeight.w400,
//                                                   fontSize:
//                                                       getProportionateScreenHeight(
//                                                           12),
//                                                   color: secondaryColor),
//                                             ),
//                                             spaceHeight(
//                                                 getProportionateScreenHeight(
//                                                     4)),
//                                             Text(
//                                               '+222 ********',
//                                               style: textstyle.copyWith(
//                                                   fontWeight: FontWeight.w700,
//                                                   fontSize:
//                                                       getProportionateScreenHeight(
//                                                           16)),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       Divider(
//                                         color: secondaryColor.withOpacity(0.2),
//                                       ),
//                                       Padding(
//                                         padding: EdgeInsets.fromLTRB(
//                                             getProportionateScreenWidth(15),
//                                             getProportionateScreenHeight(0),
//                                             getProportionateScreenWidth(15),
//                                             getProportionateScreenHeight(0)),
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               Translations.of(context)!
//                                                   .Numerodutelephoneduboutique,
//                                               style: textstyle.copyWith(
//                                                   fontWeight: FontWeight.w400,
//                                                   fontSize:
//                                                       getProportionateScreenHeight(
//                                                           12),
//                                                   color: secondaryColor),
//                                             ),
//                                             spaceHeight(
//                                                 getProportionateScreenHeight(
//                                                     4)),
//                                             Text(
//                                               '+222 ********',
//                                               style: textstyle.copyWith(
//                                                   fontWeight: FontWeight.w700,
//                                                   fontSize:
//                                                       getProportionateScreenHeight(
//                                                           16)),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       Divider(
//                                         color: secondaryColor.withOpacity(0.2),
//                                       ),
//                                       Padding(
//                                         padding: EdgeInsets.fromLTRB(
//                                             getProportionateScreenWidth(15),
//                                             getProportionateScreenHeight(0),
//                                             getProportionateScreenWidth(15),
//                                             getProportionateScreenHeight(0)),
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               Translations.of(context)!
//                                                   .Categorie,
//                                               style: textstyle.copyWith(
//                                                   fontWeight: FontWeight.w400,
//                                                   fontSize:
//                                                       getProportionateScreenHeight(
//                                                           12),
//                                                   color: secondaryColor),
//                                             ),
//                                             spaceHeight(
//                                                 getProportionateScreenHeight(
//                                                     4)),
//                                             Text(
//                                               Translations.of(context)!
//                                                   .ecommerce,
//                                               style: textstyle.copyWith(
//                                                   fontWeight: FontWeight.w700,
//                                                   fontSize:
//                                                       getProportionateScreenHeight(
//                                                           16)),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       Divider(
//                                         color: secondaryColor.withOpacity(0.2),
//                                       ),
//                                       Padding(
//                                         padding: EdgeInsets.fromLTRB(
//                                             getProportionateScreenWidth(15),
//                                             getProportionateScreenHeight(0),
//                                             getProportionateScreenWidth(15),
//                                             getProportionateScreenHeight(0)),
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               Translations.of(context)!.Adresse,
//                                               style: textstyle.copyWith(
//                                                   fontWeight: FontWeight.w400,
//                                                   fontSize:
//                                                       getProportionateScreenHeight(
//                                                           12),
//                                                   color: secondaryColor),
//                                             ),
//                                             spaceHeight(
//                                                 getProportionateScreenHeight(
//                                                     4)),
//                                             Text(
//                                               'Rue Nouadhibou, *******',
//                                               style: textstyle.copyWith(
//                                                   fontWeight: FontWeight.w700,
//                                                   fontSize:
//                                                       getProportionateScreenHeight(
//                                                           16)),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       // bottomNavigationBar: BottomNavBarVendor(pageIndex: 1),
//     );
//   }
// }
