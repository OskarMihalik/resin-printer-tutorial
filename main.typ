#import "template.typ": *
#show: project

#pagebreak()

= Vybavenie a materiály použité pri tlači
Pri realizácii projektu sme využívali nasledujúce vybavenie a ochranné pomôcky:
+ Živicová (resin) tlačiareň
+ Čistiareň
+ UV stanica
+ Fotopolymérová živica (resin)
+ Ochranné rukavice
+ Respirátor
+ Silikónová stierka
+ Špachtľa
+ Lievik
+ Páska
+ Tenký plochý skrutkovač

#figure(
  image("assets/tools.excalidraw.png"),
  caption: [Vybavenie ku tlačiarni],
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
Živicová tlač, známa aj ako DPH polymerizácia, využíva tekutú fotopolymérovú živicu, ktorá sa vytvrdzuje pri vystavení UV žiareniu. Tlačiareň má stavebnú platformu, ktorá sa spúšťa do nádržky so živicou (VAT). Zdroj UV svetla (LCD obrazovka) selektívne vytvrdzuje živicu vrstvu po vrstve. Po vytvrdnutí jednej vrstvy sa stavebná platforma mierne posunie nahor a proces sa opakuje pre ďalšiu vrstvu, kým sa nevytvorí celý objekt.

Tlačiareň, s ktorou sme pracovali, sa skladala z nasledujúcich komponentov:
+ *Nádrž na živicu (VAT)*: Nádoba, ktorá obsahuje tekutú živicu.
+ *Stavebná platforma*: Plošina, na ktorej sa model vytvára.
+ *Zdroj UV svetla*: LCD obrazovka, ktorá vytvrdzuje živicu.
+ *Z-os*: Mechanizmus, ktorý pohybuje stavebnou platformou hore a dole.
+ *Ovládanie*: Display na ovládanie tlačiarne.

#figure(
  image("assets/printer_parts.excalidraw.svg"),
  caption: [Znázornenie častí tlačiarne],
) <orientation_example>

// #figure(
//   image("assets/how_it_works.excalidraw.svg"),
//   caption: [Znázornenie fungovania],
// )

= Proces prípravy a tlače
== Príprava 3D modelu
Pred samotnou tlačou sme museli model konvertovať do formátu .prz. Pre tento účel sme využili softvér #link("https://lychee.co/", [Lychee Slicer]).

=== Podložka (Raft)
Na zabezpečenie lepšieho priľnutia tlačeného modelu k platforme sme aplikovali podložku. Tento krok nám umožnil zväčšiť plochu prvej vrstvy a významne znížil riziko odlepenia modelu počas procesu tlače.

#figure(
  image("assets/raft.png"),
  caption: [Ukážka "sled" podložky],
) <raft_example>

Odporúča sa použiť typ podložky "sled", lebo so špachtľou sa ľahšie odliepa.
Minimálna hrúbka ktorá sa odporúča je 0.7mm.

=== Orientácia modelu
Pri nastavovaní tlače sme kládli veľký dôraz na správnu orientáciu modelu, keďže táto priamo ovplyvňovala kvalitu povrchu, nevyhnutnosť použitia podpier a celkový čas tlače. Model sme zámerne nakláňali, čím sme znížili plochu jednotlivých vrstiev a eliminovali veľké prierezy, ktoré by inak mohli viesť k zlyhaniu tlače.
#figure(
  image("assets/prasa_spodok.png"),
  caption: [Orientácia],
)

#figure(
  image("assets/skyscraper_orientation.png"),
  caption: [Orientácia "mrakodrap" metóda],
)


=== Podpory (Supports)
Pre úspešné vytlačenie previsnutých častí modelu sme museli definovať adekvátne podpory. Tým sme zabránili tomu, aby sa tieto sekcie tlačili bez opory a následne sa deformovali. Zabezpečovali sme dostatočné množstvo podpier na všetkých rizikových miestach. Keďže odstraňovanie podpier po tlači zanechávalo drobné povrchové defekty, cielene sme ich umiestňovali na menej viditeľné plochy modelu.

#figure(
  image("assets/image-1.png"),
  caption: [Ukážka správnych podpier],
)

#figure(
  image("assets/prasa_supports.png"),
  caption: [Ukážka správnych podpier 2],
)
=== Dutiny (Hollowing)
Za účelom úspory materiálu a zníženia celkového času tlače sme do modelu implementovali dutiny. Súčasťou tohto kroku bolo pridanie odtokových dier, ktoré zabezpečovali plynulé odtekanie nevytvrdenej živice z vnútorných priestorov a predchádzali tak vzniku podtlaku v priebehu tlače.
#figure(
  image("assets/blockers1.png"),
  caption: [Ukážka dutín],
)
#figure(
  image("assets/blockers2.png"),
  caption: [Ukážka blokovania dutín],
)

=== Prísavky (Suction cups)
V procese návrhu sme museli dbať na prevenciu vzniku tzv. prísaviek, na ktoré sa mohli premeniť uzavreté dutiny počas tlače. Tieto by mohli zapríčiniť deformáciu alebo odtrhnutie modelu od podpier. Tento potenciálny problém sme vopred eliminovali optimalizáciou orientácie modelu a integráciou dostatočného počtu odtokových dier.

#figure(
  image("assets/suction_cups.png"),
  caption: [Ukážka vzniknutých prísaviek],
) <suction>

Odtokové diery sú znázornené ako červené cylindre na #ref(<suction>).
== Nastavenie parametrov tlačiarne
Pre dosiahnutie optimálnych výsledkov sme dôkladne nakonfigurovali parametre špecifické pre danú tlačiareň a zvolený typ živice. Keďže ladenie od nuly je časovo náročné, vychádzali sme z existujúcich profilov nastavení, ktoré sme následne optimalizovali podľa potrieb nášho modelu.

#figure(
  image("assets/printer_settings.png"),
  caption: [Nastavenie parametrov pre konkrétnu živicu],
)
== Export narezaného modelu
Vo fáze exportu sme systémom nechali vygenerovať jednotlivé rezy modelu vo formáte čitateľnom pre tlačiareň.
#figure(
  image("assets/export.excalidraw.svg"),
  caption: [Export],
)

Výsledný súbor s koncovkou .prz sme následne preniesli pomocou USB flash disku priamo do zariadenia.

== Príprava pracoviska pred tlačou
Z dôvodu bezpečnosti pri práci s fotopolymérovou živicou sme si pred samotným procesom dôkladne nasadili ochranné pomôcky, vrátane rukavíc, zástery a respirátora.
#figure(
  image("assets/oblecenie.png", width: 50%),
  caption: [Oblečenie pri práci],
)

Taktiež sme zabezpečili minimalizáciu externých zdrojov UV žiarenia zatiahnutím žalúzií, čím sme predišli nežiaducemu stvrdnutiu materiálu.

== Naliatie živice do nádržky (VAT)
Nádobu so živicou sme najskôr dôkladne pretrepali s dôrazom na zabezpečenie uzáveru pred náhodným uvoľnením. Následne sme živicu naliali do nádržky (VAT), pričom sme prísne dodržali odporúčanú maximálnu hladinu, zobrazenú na #ref(<max_resin>)

#figure(
  image("assets/vat_max.excalidraw.png"),
  caption: [Maximálne množstvo živice],
) <max_resin>

Látku sme po naliatí ešte dodatočne rozmiešali *silikónovou stierkou*, aby sme dosiahli úplne jednoliatu farbu a konzistenciu roztoku.

== Spustenie tlače a odkvapkanie
Po pripojení USB flash disku k tlačiarni sme prostredníctvom LCD panelu vybrali cieľový model a iniciovali tlač.

Po ukončení tlače sme využili integrovaný háčik na zavesenie stavebnej platformy. Platformu sme v tejto polohe ponechali minimálne hodinu, čím sme zabezpečili dôkladné odkvapkanie prebytočnej nevyužitej živice.

#figure(
  image("assets/zavesenie.jpg"),
  caption: [Zavesená stavebná platforma],
)

== Odoberanie modelu z platformy a odstránenie podpier
Na bezpečné uvoľnenie vytlačeného modelu zo stavebnej platformy sme použili kovovú špachtľu. V prípadoch silnejšieho priľnutia sme si pomohli jemným poklepom kladiva, ako je znázornené na #ref(<tazko_iduci>), pričom v prípade nutnosti by bolo možné použiť aj aplikáciu tepla. Priebeh tohto kroku vo veľkej miere závisel od zvolených expozičných nastavení.

#figure(
  image("assets/spachtla.png"),
  caption: [Odstraňovanie modelu od stavebnej platformy],
) <tazko_iduci>

Následne sme pomocou jemných klieští opatrne odstránili všetky podporné štruktúry z modelu.

#figure(
  image("assets/odcvakavanie.png"),
  caption: [Odstraňovanie podpier z modelu],
)

== Čistenie modelu s využitím izopropylalkoholu (IPA)
Zatiaľ čo pri plných modeloch sme mohli pristúpiť priamo k čisteniu, pri dutých modeloch bola vyžadovaná zvýšená opatrnosť. Dôsledne sme kontrolovali priechodnosť odtokových dier, aby sme zabránili kumulácii tlaku pri následnom zrení v UV stanici. Na precízne spriechodnenie sme využívali tenký plochý skrutkovač. Dôkladné čistenie prebehlo v samotnej čistiarni.

#figure(
  image("assets/cleaning.jpg"),
  caption: [Čistenie modelu v čistiarni],
)

== Záverečné zrenie v UV stanici
Umyté modely sme umiestnili na rotačnú sklenenú podložku do UV stanice. Cez ovládací panel sme aktivovali režim „Cure“ na dobu desiatich minút. Pre dosiahnutie rovnomerného vytvrdenia na všetkých stranách sme po prvom cykle modely otočili a proces opakovali.

#figure(
  image("assets/uv_station.jpg"),
  caption: [Zrenie v UV stanici],
)

== Vyhodnotenie výsledného modelu a možnosti zlepšenia
Pri analýze finálneho modelu sme identifikovali niekoľko nedostatkov. Model prasaťa bol zospodu pokrytý nadmerným množstvom husto umiestnených podpier, čo sťažovalo ich odstraňovanie a vyústilo do poškodenia povrchu.

V modeloch nožov neboli aplikované adekvátne podpory pre vnútorné diery, v dôsledku čoho sa ich tvar pri tlači deformoval do elipsoidu.

Ďalšia identifikovaná chyba súvisela s prílišnej hrúbkou podložky, ktorú sme nastavili na 1 mm, čo extrémnym spôsobom skomplikovalo separáciu modelu od platformy.

Do budúcna by bolo zvážiť použitia iného softvéru, lebo Lychee užitočné nástroje ako meranie alebo lepšie generovanie automatických podpier, schováva za platenou verziou.

Zaznamenané zistenia sme zapracovali do našej znalostnej bázy a budeme ich využívať ako podklad pre optimalizáciu parametrov pri budúcich iteráciách tlače.


#figure(
  image("assets/prints.png", width: 70%),
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
