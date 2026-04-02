#import "template.typ": *
#show: project

#pagebreak()

= Čo budete potrebovať pred začatím
+ Živicová (resin) tlačiareň
+ Čistiareň
+ UV stanica
+ Živica (resin)
+ Rukavice
+ Respirátor
+ Silikónová stierka
+ Špachtľa
+ Lievik
+ Páska
+ tenký plochý šraubovák

#figure(
  image("assets/tools.excalidraw.png"),
  caption: [Znázornenie častí tlačiarne],
)

#figure(
  image("assets/washer.jpg"),
  caption: [Čistiareň],
)

#figure(
  image("assets/uv_cure.jpg"),
  caption: [UV stanica],
)

= Ako funguje živicová tlač?
Živicová tlač, známa aj ako DPH polymerizácia, využíva tekutú fotopolymérovú živicu, ktorá sa vytvrdzuje pri vystavení UV žiareniu. Tlačiareň má stavebnú platformu, ktorá sa spúšťa do nádržky so živicou. Zdroj UV svetla (LCD obrazovka) selektívne vytvrdzuje živicu vrstvu po vrstve. Po vytvrdnutí jednej vrstvy sa stavebná platforma mierne posunie nahor a proces sa opakuje pre ďalšiu vrstvu, kým sa nevytvorí celý objekt.

Tlačiareň sa skladá z:
+ *Nádrž na živicu (VAT)*: Nádoba, ktorá obsahuje tekutú živicu.
+ *Stavebná platforma*: Plošina, na ktorej sa model vytvára.
+ *Zdroj UV svetla*: LCD obrazovka, ktorá vytvrdzuje živicu.
+ *Z-os*: Mechanizmus, ktorý pohybuje stavebnou platformou hore a dole.
+ *Ovládanie*: Display na ovládanie tlačiarne.

#figure(
  image("assets/printer_parts.excalidraw.svg"),
  caption: [Znázornenie častí tlačiarne],
) <orientation_example>

#figure(
  image("assets/how_it_works.excalidraw.svg"),
  caption: [Znázornenie fungovania],
)

= Ako tlačiť
== Pripravenie 3D modelu
Pred vytlačením modelu treba model konvertovať do formátu .prz, my sme použili softvér #link("https://lychee.co/", [Lychee Slicer]).

=== Podložka (Raft)
Podložka slúži na lepšie priľnutie tlačeného modelu k tlačovej podložke. Zväčšuje plochu prvej vrstvy a znižuje riziko odlepenia modelu počas tlače.

#figure(
  image("assets/raft.png"),
  caption: [Ukážka "sled" podložky],
) <raft_example>

Odporúča sa použiť typ podložky "sled", lebo so špachtľou sa ľahšie odliepa.
Minimálna hrúbka 0.7mm.

=== Orientácia modelu
Správna orientácia modelu je kľúčová pre úspešnú tlač. Ovplyvňuje kvalitu povrchu, potrebu podpier a čas tlače. Všeobecne platí, že je dobré model nakloniť, aby sa znížila plocha jednotlivých vrstiev a predišlo sa tak veľkým prierezom, ktoré môžu spôsobiť zlyhanie tlače.
#figure(
  image("assets/prasa_spodok.png"),
  caption: [Orientácia],
)

#figure(
  image("assets/skyscraper_orientation.png"),
  caption: [Orientácia "mrakodrap" metóda],
)


=== Podpory (Supports)
Podpory sú nevyhnutné pre tlač previsnutých častí modelu. Bez nich by sa tieto časti tlačili do vzduchu a deformovali by sa. Podpory sa po dokončení tlače odstránia. Je dôležité umiestniť dostatok podpier na všetky previsnuté časti. Odstraňovanie podpier takmer vždy zanechá na modeli malé poškodenia, preto je ideálne ich umiestňovať na menej viditeľné miesta.

#figure(
  image("assets/image-1.png"),
  caption: [Ukážka správnych podpier],
)

#figure(
  image("assets/prasa_supports.png"),
  caption: [Ukážka správnych podpier 2],
)
=== Dutiny (Hollowing)
Vytvorenie dutín v modeli môže ušetriť značné množstvo živice a skrátiť čas tlače. Pri vytváraní dutín je dôležité pridať do modelu diery, aby mohla živica z dutiny vytiecť a aby sa zabránilo vzniku podtlaku počas tlače.
#figure(
  image("assets/blockers1.png"),
  caption: [Ukážka dutín],
)
#figure(
  image("assets/blockers2.png"),
  caption: [Ukážka blokovania dutín],
)

=== Prísavky (Suction cups)
Prísavky vznikajú, keď sa v modeli vytvorí uzavretá dutina, ktorá sa pri tlači správa ako prísavka. To môže spôsobiť deformáciu modelu alebo jeho odtrhnutie od podpier. Tomuto javu sa dá predísť správnou orientáciou modelu alebo pridaním odtokových dier.

#figure(
  image("assets/suction_cups.png"),
  caption: [Ukážka vzniknutých prísaviek],
) <suction>

Odtokové diery možno vidieť ako červené cylindre na #ref(<suction>)
== Nastavenie parametrov tlačiarne
Pre dosiahnutie najlepších výsledkov treba nastaviť parametre pre konkrétnu tlačiareň a konkrétnu živicu. Tieto nastavenia je zdĺhavé nastavovať od nuly, preto je dobré nájsť už odskúšané nastavenia a tie poprípade upraviť.

#figure(
  image("assets/printer_settings.png"),
  caption: [Nastavenie parametrov pre konkrétnu živicu],
)
== Export narezaného modelu
Pri exporte modelu sa vygenerujú konkrétne rezy tak aby ich tlačiareň vedela prečítať.
#figure(
  image("assets/export.excalidraw.svg"),
  caption: [Export],
)

Exportovaný súbor .prz môžme nahrať na usb kľúč.

== Príprava pred tlačou
Pred tým ako začneme pracovať so živicou tak si treba na seba dať ochranné pomôcky ako rukavice, zásteru a respirátor.
#figure(
  image("assets/oblecenie.png", width: 50%),
  caption: [Oblečenie pri práci],
)

Minimalizujeme zdroje UV žiarenia, zatiahnutím žalúzií.

== Naliatie živice do nádržky (VAT)
Najprv fľašu dôkladne pretrepte, pričom druhou rukou pevne držte uzáver (fľaša sa môže pri príliš silnom trepaní otvoriť...). Potom ju nalejte do nádržky (VAT), neplňte ju však viac, než je znázornené na #ref(<max_resin>)

#figure(
  image("assets/vat_max.excalidraw.png"),
  caption: [Maximálne množstvo živice],
) <max_resin>

Po naliatí treba ešte pre istotu rozmiešať živicu *silikónovou stierkou*, treba miešať dokým nebude farba jednoliata.

== Výber modelu na tlačiarni
Usb kľúč vpichneme do tlačiarne a zvolíme vyexportovaný model na tlač pomocou LCD displeja.

== Odkvapkanie
Tlačiareň disponuje háčikom na zavesenie celej stavebnej platformy. Treba to nechať zavesené minimálne jednu hodinu aby odkvapkala prebytočná živica.

#figure(
  image("assets/zavesenie.jpg"),
  caption: [Zavesená stavebná platforma],
)

== Odstránenie zo stavebnej platformy a odstránenie podpier
Najľahšie sa odstraňujú vytlačené modely pomocou železnej špachtle. Ak náhodou podložka ide veľmi ťažko tak si môžme opatrne pomôcť kladivom, tak ako na #ref(<tazko_iduci>) alebo pomocou tepla (vriaca voda, tepelná pištoľ). V ideálnom prípade by to malo ísť pomerne ľahko ale záleží na nastaveniach pre konkrétnu živicu.

#figure(
  image("assets/spachtla.png"),
  caption: [Odstraňovanie modelu od stavebnej platformy],
) <tazko_iduci>

Následne nás čaká odstránenie podpier, najlepšie to ide malými kliešťami.

#figure(
  image("assets/odcvakavanie.png"),
  caption: [Odstraňovanie podpier z modelu],
)

== Čistenie modelu pomocou IPA
Pri modeloch bez dutín, modely môžme rovno dať do čistiarne. Ak má model dutiny tak sa treba uistiť aby neboli zapchaté odtokové diery (ak ostanú zapchaté môže nastať výbuch pri zrení v UV stanici). Odporúčame použiť tenký plochý šraubovák na vyčistenie dier.

#figure(
  image("assets/cleaning.jpg"),
  caption: [Čistenie modelu v čistiarni],
)

== Použitie UV stanice
Položme modely do UV stanice na sklenú rotovaciu podložku, zvoľme režim "Cure" na displeji a nastavme desať minúť. Keď zrenie skončí otočme modely a opakujme.

#figure(
  image("assets/uv_station.jpg"),
  caption: [Zrenie v UV stanici],
)

== Výsledný model a ako by sa dali zlepšiť parametre tlače
Prasa malo velmi veľa podpier na spodku modelu, čo zanechalo veľa poškodení a boli veľmi blízko pri sebe, preto sa ťažko dávali dole.

Nôž nemal podperi vo vnútri dier, čo znamenalo že diery skončili elipsoidné.

Tak isto sme nastavili hrúbku podložky 1mm, čo spôsobilo ťažké odlepovanie.

Pri budúcich tlačiach si musíme na toto dať pozor.

#figure(
  image("assets/prints.png"),
  caption: [Ukážka vytlačených modelov],
)

= Zdroje
- https://all3dp.com/1/j3dtech-guide-to-resin-3d-printing/ <3d_print_source>
- https://www.reddit.com/r/resinprinting/comments/1eif61h/do_i_need_to_add_support_for_the_base_or_will/
- https://www.reddit.com/r/LycheeSlicer/comments/1jbqi0q/how_accurate_is_the_resin_volume/
- https://forum.formlabs.com/t/printing-hollow-cyclinders-angled-or-straight/14894
- https://forum.formlabs.com/t/should-objects-not-recommended-to-lay-flat-on-build-plate/23696/3
- https://forum.formlabs.com/t/should-objects-not-recommended-to-lay-flat-on-build-plate/23696
- https://helpcenter.phrozen3d.com/hc/en-us/categories/21705405797017-Sonic-Mega-8K-S
- https://helpcenter.phrozen3d.com/hc/en-us/articles/21706644834201--Sonic-Mega-8K-S-Replacing-the-Film
- https://www.facebook.com/groups/3dprintingforbeginnersandpros/posts/812021977394663/
- https://www.reddit.com/r/ElegooSaturn/comments/1dnu5d7/prints_stuck_to_build_plate/
