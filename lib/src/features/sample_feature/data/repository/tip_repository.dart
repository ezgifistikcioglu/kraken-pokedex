import 'package:kraken_pokedex/src/features/sample_feature/domain/models/tip.dart';

const _tips = <Tip>[
  Tip(
    title: 'Analiz',
    description: 'README dosyasını okuyup anlamaya öncelik verin.',
  ),
  Tip(
    title: 'Mimari',
    description: 'Projede örnek olarak sunulan mimariyi inceleyerek '
        'yapınızı buna uygun olarak kurmaya özen gösterin',
  ),
  Tip(
    title: 'Örnek Kodlar',
    description: 'Örnek kodları taklit ederek projeyi ilerletmeyin. '
        'Örnek kodlar sadece size fikir vermek için yazılmış, '
        'çoğunlukla doğru olmayan kod yazımları içermektedir. '
        'Örneğin FakeTipRepository içerisinde static olarak '
        "Tip'lerin getirilmesi, değişken ve class isimleri vb. "
        'Kafa karışıklığını engellemek için projeyi inceledikten sonra '
        'sample_feature klasörünü siliniz.',
  ),
];

class FakeTipRepository {
  static Future<List<Tip>> getTips() => Future.delayed(
        const Duration(seconds: 3),
        () => _tips,
      );
}
