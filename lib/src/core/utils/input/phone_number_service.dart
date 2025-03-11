// import 'package:country_picker/country_picker.dart';
// import 'package:dlibphonenumber/phone_number_util.dart';

// class PhoneNumUtils {
//   const PhoneNumUtils();

//   // Function to get the phone number mask for a given country code
//   static String getPhoneNumberMask({
//     required String countryCode,
//   }) {
//     for (final country in CountryService.getCountryCodes) {
//       final iso = country['iso2_cc'] as String;
//       final mask = country['mask'] as String;
//       if (countryCode == iso) {
//         return mask;
//       }
//     }
//     return 'Invalid country code';
//   }

//   static Country kazakhstanCountry = Country(
//     phoneCode: '7',
//     countryCode: 'KZ',
//     e164Sc: 0,
//     geographic: true,
//     level: 2,
//     name: 'Kazakhstan',
//     example: '7710009998',
//     fullExampleWithPlusSign: '+77710009998',
//     displayName: 'Kazakhstan (KZ) [+7]',
//     displayNameNoCountryCode: 'Kazakhstan (KZ)',
//     e164Key: '7-KZ-0',
//   );

//   static Country getCountryByNumber({
//     required String phoneNumber,
//   }) {
//     if (phoneNumber.isNotEmpty) {
//       final phoneUtil = PhoneNumberUtil.instance;
//       final cleanedNumber = phoneNumber.replaceAll(RegExp(r'[^\d+]'), '');

//       final phone = phoneUtil.parse(cleanedNumber, null);
//       final iso = phoneUtil.getRegionCodeForNumber(phone) ?? 'KZ';

//       final matchedCountry = CountryService.getCountryCodes.firstWhere((element) => element['iso2_cc'] == iso);
//       if (matchedCountry.isNotEmpty) {
//         return Country.from(json: matchedCountry);
//       }
//     }
//     return kazakhstanCountry;
//   }

//   static String getMaskWithoutCountryCode({
//     required String countryCode,
//   }) {
//     final mask = getPhoneNumberMask(countryCode: countryCode);
//     if (mask == 'Invalid country code') {
//       throw ArgumentError('Invalid country code');
//     }

//     // Regular expression to match the country code, parentheses,
//     // and any spaces following it
//     final result = mask.replaceFirst(RegExp(r'^\+\d+\s*\(\d+\)\s*'), '');
//     return result;
//   }

//   static String removeCountryCode(String phoneNumber, String countryCode) {
//     for (final country in CountryService.getCountryCodes) {
//       final iso = country['iso2_cc'] as String;
//       final code = country['e164_cc'] as String;
//       if (countryCode == iso) {
//         return phoneNumber.replaceFirst('+$code', '');
//       }
//     }
//     // If no country code matches, return the original phone number
//     return phoneNumber;
//   }
// }
