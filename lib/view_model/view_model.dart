import 'package:flutter/material.dart';
import 'package:hidden_menu/model/itemModel.dart';
import 'package:hidden_menu/view/menuScreen.dart';

class ViewModel{

  static final listKey = GlobalKey<AnimatedListState>();
  Animatable<Offset> get tween => _tween();
  Animatable<Offset> _tween() {
    var begin = Offset(0.0, 1.0);
    var end = Offset.zero;
    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.easeInOut));
    return tween;
  }

  static List<ItemModel> items = [
    ItemModel(
      title: 'Mount Fuji',
      image: 'https://www.planetware.com/photos-large/JPN/japan-attractions-mount-fuji.jpg',
      location: 'Fuji-Hakone-Izu National Park',
      rating: 4.8,
      description: '''Without a doubt Japan's most recognizable landmark, majestic Mount Fuji (Fuji-san) is also the country's highest mountain peak, towering 3,776 meters over an otherwise largely flat landscape to the south and east, and tall enough to be seen from Tokyo more than 100 kilometers away. Mount Fuji has for centuries been celebrated in art and literature and is now considered so important an icon that UNESCO recognized its world cultural significance in 2013. Part of the Fuji-Hakone-Izu National Park, Mount Fuji is climbed by more than a million people each summer as an act of pilgrimage, which culminates in watching the sunrise from its summit. While some still choose to begin their climb from the base, the majority of climbers now start from above the halfway mark, at the 5th Station, resulting in a more manageable six or so hour ascent. Of course, for many, simply viewing the mountain from the distance, or from the comfort of a speeding train, is enough to say "been there, done that."''',
      time: 'November to February'
    ),
    ItemModel(
      title: 'Imperial Tokyo',
      image: 'https://www.planetware.com/photos-large/JPN/japan-attractions-imperial-palace.jpg',
      location: 'Chiyoda City, Tokyo',
      rating: 4.5,
      description: '''Tokyo's most famous landmark, the Imperial Palace with its beautiful 17th-century parks surrounded by walls and moats, is a must-see when visiting the nation's capital. Don't be put off by the fact that the majority of the palace is closed to the public (it's still in use by the Imperial family), as there is still enough to see simply by strolling the grounds. In addition to the many fine views of the palace from numerous points in the surrounding parkland - including the famous Nijubashi Bridge, or "double bridge," so named for its watery reflection - visitors are permitted into the East Higashi-Gyoen Garden and other areas that are opened to the public as part of an organized tour. Another must-see for tourists visiting Tokyo is the famous Ginza shopping district, home to the Kabuki-za Theatre with its Kabuki performances, as well as the Shimbashi Enbujo Theatre with its traditional Azuma-odori dances and Bunraku performances.''',
      time: 'September to November'
    ),
    ItemModel(
      title: 'Hiroshima Peace Memorial Park',
      image: 'https://www.planetware.com/photos-large/JPN/japan-attractions-hiroshima-peace-memorial-park.jpg',
      location: 'Nakajimacho, Naka Ward, Hiroshima',
      rating: 4.1,
      description: '''While little need be said here of the horrors of the atomic bombing of Hiroshima in August 1945, much can be said of the incredible efforts this vibrant city has made to commemorate the many victims of the world's first nuclear attack, and perhaps even more importantly, the symbol of lasting peace Hiroshima has since become. Visited by more than a million people each year, many from overseas, Hiroshima Peace Memorial Park (Hiroshima Heiwa Kinen Kōen) lies at the epicenter of the atomic blast in what was once a bustling part of the city and includes a number of important monuments, memorials, and museums relating to the events of that fateful day. In addition to the grounds and gardens with their colorful cherry blossoms, the park's highlights include the Peace Memorial Museum with its numerous exhibits dealing with the issue of world peace, and the Memorial Cenotaph and the Flame of Peace, as well as the Atom Bomb Dome, the ruins of an administrative building that lay at the center of the explosion.''',
      time: 'All year Around'
    ),
    ItemModel(
      title: 'Historic Kyoto',
      description: '''One of Japan's most visited cities, lovely Kyoto - one of the few cities in the country to be spared the devastation of WWII - attracts more than 10 million visitors annually to explore its fine old streets and architecture, much of it unchanged since the Imperial family took up residence here more than 1,000 years ago. Even then, the city was Japan's most important cultural center, a legacy that continues with its many museums and art galleries, each bursting with important sculptures, paintings, and other art forms. Highlights of Kyoto's Buddhist-influenced architecture include its many well-preserved temples, 30 of which are still in use, and important structures such as the 14th-century Golden Pavilion (Kinkaku-ji), famous for its exquisite gold-leaf-clad exterior. Be sure to also visit Nijo Castle, a 17th-century fortress that has retained its original walls, towers, and moat; its beautiful gates; and its palace with fine interior décor. Also worth a visit is the original Kyoto Imperial Palace (Kyoto-gosho), built in AD 794 and one of the city's most visited historic sites. Finally, no visit to Kyoto is complete without spending time exploring the Arashiyama Bamboo Grove, a beautiful area of tall bamboo just a few minutes' walk from the town center.''',
      image: 'https://www.planetware.com/photos-large/JPN/japan-attractions-kyoto.jpg',
      rating: 5,
      time: 'March to May and from September to November',
      location: 'Kansai, Kyoto'
    ),
    ItemModel(
      title: 'The Atsuta Shrine, Nagoya',
      image: 'https://www.planetware.com/photos-large/JPN/japan-attractions-atsuta-shrine.jpg',
      description: 'The Atsuta Shrine, in the heart of the city of Nagoya, is the most important Shinto shrine in Japan, and attracts more than five million visitors each year. Established in the first century, this religious site is famous for its preserved Imperial insignia, the "grass-mowing sword" (kusanagi-no-tsurugi), one of only three in the country. Also of interest are its principal shrine, Hongu, surrounded by an enclosing wall, and the treasury with its numerous works of art, including old and modern paintings, ceramics, jewelry, and traditional masks. While in Nagoya, be sure to also visit Nagoya Castle, a splendid moated complex built in 1612 boasting a 48-meter-high main tower that is famous for its two gilded dolphins (shachi), its museum containing art treasures from the former palace, and its spectacular views over the city and the Nobi Plain.',
      rating: 5,
      time: 'All year Around',
      location: 'Jingu, Atsuta Ward, Nagoya'
    ),
    ItemModel(
      title: 'Sapporo, Hokkaido',
      image: 'https://www.planetware.com/photos-large/JPN/japan-attractions-sapporo-hokkaido.jpg',
      description: '''Located on Japan's northernmost island, Hokkaido, the city of Sapporo offers many things to see and do for tourists. As the island's largest city, it's a hub of cultural activity, hosting many excellent events and festivals; a distinctive culinary style; a rich theatrical history; and plenty of museums, galleries, and parks. The focal point here is very much the city's attractive downtown area, the center of which is Odori Park, a large swath of green that's very pleasant to explore. From here, you can also access points of interest such as the Sapporo TV Tower, as well as the city's famous aerial tramway, an easy walk away. The Mount Moiwa Ropeway will eventually get you to the summit's Upper Station, from where you can enjoy incredible views over the city, a real treat at night. The mountain is also the location of the Mount Moiwa Ski Resort, a popular winter destination, especially since the 1972 Winter Olympics were held in the city. And if you're arriving in winter, be sure to visit the Sapporo Snow Festival, held here each February and drawing in excess of two million revelers.''',
      rating: 4.9,
      time: 'March to May',
      location: 'Kita-ichijō-nishi, Chūō-ku, Sapporo-shi, Hokkaido'
    )
  ];
}