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

== Časti
+ *Nádrž na živicu (VAT)*: Nádoba, ktorá obsahuje tekutú živicu.
+ *Stavebná platforma*: Plošina, na ktorej sa model vytvára.
+ *Zdroj UV svetla*: LCD obrazovka, ktorá vytvrdzuje živicu.
+ *Z-os*: Mechanizmus, ktorý pohybuje stavebnou platformou hore a dole.

#figure(
  image("assets/printer_parts.excalidraw.svg"),
  caption: [Znázornenie častí tlačiarne],
) <orientation_example>

= Ako tlačiť
== Naliatie živice do nádržky (VAT)
Najprv fľašu dôkladne pretrepte, pričom druhou rukou pevne držte uzáver (fľaša sa môže pri príliš silnom trepaní otvoriť...). Potom ju nalejte do nádržky (VAT), neplňte ju však viac, než je znázornené na #ref(<max_resin>)

#figure(
  image("assets/vat_max.excalidraw.png"),
  caption: [Maximálne množstvo živice],
) <max_resin>

Po naliatí treba ešte pre istotu rozmiešať živicu *silikónovou stierkou*, treba miešať dokým nebude farba jednoliata.

== Pripravenie 3D modelu
Pred vytlačením modelu treba model konvertovať do formátu .prz, my sme použili softvér #link("https://lychee.co/", [Lychee Slicer]).

=== Podložka (Raft)
Podložka slúži na lepšie priľnutie tlačeného modelu k tlačovej podložke. Zväčšuje plochu prvej vrstvy a znižuje riziko odlepenia modelu počas tlače.

#figure(
  image("assets/raft.png"),
  caption: [Ukážka "sled" podložky],
) <raft_example>

Odporúča sa použiť typ podložky "sled", lebo so špachtľou sa ľahšie odliepa.

=== Orientácia modelu
Správna orientácia modelu je kľúčová pre úspešnú tlač. Ovplyvňuje kvalitu povrchu, potrebu podpier a čas tlače. Všeobecne platí, že je dobré model nakloniť, aby sa znížila plocha jednotlivých vrstiev a predišlo sa tak veľkým prierezom, ktoré môžu spôsobiť zlyhanie tlače.

// #figure(
//   image("assets/test.excalidraw.png"),
//   caption: [Príklad správnej orientácie modelu],
// ) <orientation_example>

=== Podpory (Supports)
Podpory sú nevyhnutné pre tlač previsnutých častí modelu. Bez nich by sa tieto časti tlačili do vzduchu a deformovali by sa. Podpory sa po dokončení tlače odstránia. Je dôležité umiestniť dostatok podpier na všetky previsnuté časti. Odstraňovanie podpier takmer vždy zanechá na modeli malé poškodenia, preto je ideálne ich umiestňovať na menej viditeľné miesta.

#figure(
  image("assets/image-1.png"),
  caption: [Ukážka správnych podpier],
)
=== Dutiny (Hollowing)
Vytvorenie dutín v modeli môže ušetriť značné množstvo živice a skrátiť čas tlače. Pri vytváraní dutín je dôležité pridať do modelu diery, aby mohla živica z dutiny vytiecť a aby sa zabránilo vzniku podtlaku počas tlače.

=== Prísavky (Suction cups)
Prísavky vznikajú, keď sa v modeli vytvorí uzavretá dutina, ktorá sa pri tlači správa ako prísavka. To môže spôsobiť deformáciu modelu alebo jeho odtrhnutie od podpier. Tomuto javu sa dá predísť správnou orientáciou modelu alebo pridaním odtokových dier.

= Zdroje
https://all3dp.com/1/j3dtech-guide-to-resin-3d-printing/ <3d_print_source>
