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
  caption: [Základné vybavenie potrebné k obsluhe živicovej tlačiarne (ochranné pomôcky a náradie)],
)

#figure(
  image("assets/washer.jpg"),
  caption: [Čistiareň (Wash & Cure Station) slúžiaca na dôkladné odstránenie nevytvrdnutej tekutej živice z povrchu vytlačených modelov pomocou rozpúšťadla],
)

#figure(
  image("assets/uv_cure.jpg"),
  caption: [UV stanica pre finálne vytvrdnutie a stabilizáciu materiálu vytlačeného modelu],
)

= Ako funguje živicová tlač?
Živicová tlač, presnejšie označovaná ako VAT polymerizácia (z anglického slova "vat" znamenajúc nádrž), využíva tekutú fotopolymérovú živicu, ktorá sa vytvrdzuje pri vystavení UV žiareniu. Tlačiareň má stavebnú platformu, ktorá sa spúšťa do VAT (nádržky so živicou). Zdroj UV svetla (LCD obrazovka) selektívne vytvrdzuje živicu vrstvu po vrstve. Po vytvrdnutí jednej vrstvy sa stavebná platforma mierne posunie nahor a proces sa opakuje pre ďalšiu vrstvu, kým sa nevytvorí celý objekt.

Tlačiareň, s ktorou sme pracovali, sa skladala z nasledujúcich komponentov:
+ *VAT (nádrž na živicu)*: Nádoba (vaňa), ktorá obsahuje tekutú živicu.
+ *Stavebná platforma*: Plošina, na ktorej sa model postupne vytvára.
+ *Zdroj UV svetla*: LCD obrazovka, ktorá presne osvetľuje a vytvrdzuje živicu.
+ *Z-os*: Mechanizmus, ktorý plynule pohybuje stavebnou platformou hore a dole.
+ *Ovládanie*: Displej na nastavovanie a obsluhu chodu tlačiarne.

#figure(
  image("assets/printer_parts.excalidraw.svg"),
  caption: [Schematické znázornenie a rozloženie hlavných častí tlačiarne],
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
  caption: [Ukážka použitia podložky typu "sled" (sane) pre zaistenie lepšej priľnavosti k platforme],
) <raft_example>

Odporúča sa použiť typ podložky "sled", lebo so špachtľou sa pri dokončení tlače ľahšie odliepa.
Minimálna hrúbka, ktorá sa odporúča, je 0.7 mm.

=== Orientácia modelu
Pri nastavovaní tlače sme kládli veľký dôraz na správnu orientáciu modelu, keďže táto priamo ovplyvňovala kvalitu povrchu, nevyhnutnosť použitia podpier a celkový čas tlače. Model sme zámerne nakláňali, čím sme znížili plochu jednotlivých vrstiev a eliminovali veľké prierezy, ktoré by inak mohli viesť k zlyhaniu tlače (odtrhnutím modelu).
#figure(
  image("assets/prasa_spodok.png"),
  caption: [Ukážka vhodnej orientácie, pri ktorej pohľadovo dôležité (viditeľné) časti modelu nevyžadujú kontaktné body pre podpery, čím sa predchádza narušeniu ich povrchu],
)

#figure(
  image("assets/skyscraper_orientation.png"),
  caption: [Orientácia metódou "mrakodrap" (vertikálne umiestnenie), ktorá znižuje prierez vrstvy, ale môže predĺžiť čas tlače],
)


=== Podpory (Supports)
Pre úspešné vytlačenie previsnutých častí modelu sme museli definovať adekvátne podpory. Tým sme zabránili tomu, aby sa tieto sekcie tlačili bez opory a následne sa deformovali. Zabezpečovali sme dostatočné množstvo podpier na všetkých rizikových miestach. Keďže odstraňovanie podpier po tlači zanechávalo drobné povrchové defekty, cielene sme ich umiestňovali na menej viditeľné plochy modelu.

#figure(
  image("assets/image-1.png"),
  caption: [Ukážka správnych podpier],
)

#figure(
  image("assets/prasa_supports.png"),
  caption: [Detailná ukážka zahustenia podpier v najnižších kritických bodoch (tzv. ostrovy)],
)
=== Dutiny (Hollowing)
Za účelom úspory materiálu a zníženia celkového času tlače sme do modelu implementovali dutiny. Súčasťou tohto kroku bolo pridanie odtokových dier, ktoré zabezpečovali plynulé odtekanie nevytvrdenej živice z vnútorných priestorov a predchádzali tak vzniku podtlaku v priebehu tlače.
#figure(
  image("assets/blockers1.png"),
  caption: [Ukážka návrhu dutín a odtokových dier (znázornených červenými bodmi) slúžiacich na únik tekutej živice],
)
#figure(
  image("assets/blockers2.png"),
  caption: [Ukážka blokovania dutín na špecifických miestach, kde model vyžaduje plnú výplň kvôli zachovaniu pevnosti],
)

=== Prísavky (Suction cups)
V procese návrhu sme museli dbať na prevenciu vzniku tzv. prísaviek, na ktoré sa mohli premeniť uzavreté dutiny počas tlače. Tieto by mohli zapríčiniť deformáciu alebo odtrhnutie modelu od podpier v dôsledku podtlaku namáhavo ťahajúceho model k FEP fólii. Tento potenciálny problém sme vopred eliminovali optimalizáciou orientácie modelu a integráciou dostatočného počtu odtokových dier v najnižších bodoch.

#figure(
  image("assets/suction_cups.png"),
  caption: [Detekcia kritických miest, kde hrozí vznik "prísaviek", ktoré spôsobujú nebezpečný podtlak],
) <suction>

Odtokové diery sú znázornené ako červené cylindre na #ref(<suction>).
== Nastavenie parametrov tlačiarne
Pre dosiahnutie optimálnych výsledkov sme dôkladne nakonfigurovali parametre špecifické pre danú tlačiareň a zvolený typ živice. Keďže ladenie od nuly je časovo náročné, vychádzali sme z existujúcich profilov nastavení, ktoré sme následne optimalizovali podľa potrieb nášho modelu.

#figure(
  image("assets/printer_settings.png"),
  caption: [Detailné nastavenie expozičných parametrov pre konkrétny typ živice (čas svietenia, zdvih platformy a rýchlosť pohybu)],
)
== Export narezaného modelu
Vo fáze exportu sme systémom nechali vygenerovať jednotlivé rezy modelu (tzv. slicing) vo formáte čitateľnom pre tlačiareň.
#figure(
  image("assets/export.excalidraw.svg"),
  caption: [Proces exportu 3D modelu na jednotlivé 2D obrazce (vrstvy) spracované pre tlačiareň],
)

Výsledný súbor s koncovkou .prz sme následne preniesli pomocou USB flash disku priamo do zariadenia.

== Príprava pracoviska pred tlačou
Z dôvodu bezpečnosti pri práci s fotopolymérovou živicou sme si pred samotným procesom dôkladne nasadili ochranné pomôcky, vrátane rukavíc, zástery a respirátora.
#figure(
  image("assets/oblecenie.png", width: 50%),
  caption: [Odporúčané ochranné vybavenie pre prácu s chemikáliami bežne používanými pri živicovej tlači],
)

Taktiež sme zabezpečili minimalizáciu externých zdrojov UV žiarenia zatiahnutím žalúzií, čím sme predišli nežiaducemu stvrdnutiu materiálu.

== Naliatie živice do VAT
Nádobu so živicou sme najskôr dôkladne pretrepali s dôrazom na zabezpečenie uzáveru pred náhodným uvoľnením. Následne sme živicu naliali do VAT (nádrže), pričom sme prísne dodržali odporúčanú maximálnu hladinu, zobrazenú na #ref(<max_resin>).

#figure(
  image("assets/vat_max.excalidraw.png"),
  caption: [Ukážka indikátora maximálneho povoleného množstva živice v nádržke, ktorý zabraňuje jej preliatiu pri ponorení platformy],
) <max_resin>

Látku sme po naliatí ešte dodatočne rozmiešali *silikónovou stierkou*, aby sme dosiahli úplne jednoliatu farbu a konzistenciu roztoku.

== Spustenie tlače a odkvapkanie
Po pripojení USB flash disku k tlačiarni sme prostredníctvom LCD panelu vybrali cieľový model a iniciovali tlač.

Po ukončení tlače sme využili integrovaný háčik na zavesenie stavebnej platformy. Platformu sme v tejto polohe ponechali minimálne hodinu, čím sme zabezpečili dôkladné odkvapkanie prebytočnej nevyužitej živice späť do nádrže.

#figure(
  image("assets/zavesenie.jpg"),
  caption: [Zavesená stavebná platforma umožňujúca jednoduché a úsporné odkvapkanie nespotrebovanej živice],
)

== Odoberanie modelu z platformy a odstránenie podpier
Na bezpečné uvoľnenie vytlačeného modelu zo stavebnej platformy sme použili kovovú špachtľu. V prípadoch silnejšieho priľnutia sme si pomohli jemným poklepom kladiva, ako je znázornené na #ref(<tazko_iduci>), pričom v prípade nutnosti by bolo možné využiť aj aplikáciu tepla. Priebeh tohto kroku vo veľkej miere závisel od zvolených expozičných nastavení prvej vrstvy.

#figure(
  image("assets/spachtla.png"),
  caption: [Mechanické odstraňovanie stuhnutého modelu od stavebnej platformy za pomoci na to určenej špachtle],
) <tazko_iduci>

Následne sme pomocou jemných klieští opatrne odstránili všetky podporné štruktúry z modelu. Ako osvedčenú alternatívu k mechanickému odstraňovaniu odporúčame použiť metódu ohrevu: do vhodnej nádoby je možné naliať horúcu vodu a model v nej nechať na krátky čas zohriať. Pôsobením tepla prichádza k zmäknutiu materiálu samotného modelu, ale hlavne podpier. Vďaka tomu často nie je nutné používať kliešte, a podpery je možné bezpečne odstrániť priamo rukami, čím sa minimalizuje riziko poškodenia povrchu.

#figure(
  image("assets/odcvakavanie.png"),
  caption: [Odstraňovanie pomocných podpier z modelu pomocou nožníc/štípacích klieští pred finálnym vytvrdnutím],
)

== Čistenie modelu s využitím izopropylalkoholu (IPA)
Zatiaľ čo pri plných modeloch sme mohli pristúpiť priamo k umývaniu, pri dutých modeloch bola vyžadovaná zvýšená opatrnosť. Dôsledne sme kontrolovali priechodnosť odtokových dier, aby sme zabránili kumulácii vnútorného tlaku pri následnom zrení v UV stanici. Na precízne spriechodnenie dierok sme využívali tenký plochý skrutkovač. Dôkladné čistenie následne prebehlo priamo v automatizovanej čistiarni naplnenej izopropylalkoholom.

#figure(
  image("assets/cleaning.jpg"),
  caption: [Automatizované čistenie modelu v čistiarni s rozpúšťadlom odstraňujúcim zvyškovú viskóznu živicu],
)

== Záverečné zrenie v UV stanici
Umyté a následne osušené modely sme umiestnili na rotačnú sklenenú podložku do UV stanice. Cez ovládací panel sme aktivovali režim „Cure“ na dobu desiatich minút. Pre dosiahnutie rovnomerného vytvrdenia a maximálnej pevnosti materiálu na všetkých stranách sme po prvom cykle modely otočili a proces zopakovali.

#figure(
  image("assets/uv_station.jpg"),
  caption: [Finálne zrenie (curing) vytlačeného modelu pod intenzívnym UV žiarením v špecializovanej UV stanici],
)

== Vyhodnotenie výsledného modelu a možnosti zlepšenia
Pri analýze finálneho modelu sme identifikovali niekoľko nedostatkov. Model prasaťa bol v spodnej časti pokrytý nadmerným množstvom husto umiestnených podpier, čo značne sťažovalo ich odstraňovanie a napokon vyústilo aj k lokálnemu poškodeniu povrchu.

V modeloch nožov pre zmenu neboli aplikované adekvátne podpory pre ich vnútorné otvory, v dôsledku čoho sa geometria dier pri tlači zdeformovala do elipsoidného tvaru.

Ďalšia zistená chyba súvisela s neprimeranou hrúbkou aplikovanej podložky, ktorú sme prednastavili na 1 mm, čo neskôr extrémnym spôsobom skomplikovalo separáciu modelu priamo od kovovej platformy tlačiarne.

Do budúcna by bolo vhodné zvážiť použitie aj iného "slicer" softvéru, nakoľko program Lychee Slicer vo svojej bezplatnej verzii uzamyká viaceré užitočné nástroje (ako napríklad meranie rozmerov modelu či pokročilé generovanie automatických podpier) a podmieňuje ich platenou licenciou.

Zaznamenané zistenia sme zapracovali do našej internej znalostnej bázy a naďalej ich budeme aplikovať ako užitočný podklad pre optimalizáciu tlačových parametrov pri budúcich iteráciách výrobného procesu.

#figure(
  image("assets/prints.png", width: 70%),
  caption: [Ukážka úspešne dokončených a očistených 3D modelov z fotopolymérovej živice],
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
