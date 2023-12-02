<template>
  <base-dialog :show="!!error" title="Chyba!" @close="handleError">
    <p>{{ error }}</p>
  </base-dialog>
  <section class="view">
    <base-card>
      <h1>Wi-Fi</h1>
      <h3>Wireless Fidelity</h3>
      <section>
        <br /><br />
        <h4>Úvod</h4>
        <p>
          Wi-Fi (alebo Wi-fi, WiFi, Wifi, wifi) je súbor štandardov umožňujúci
          elektrickým zariadeniam pripojiť sa na bezdrôtovú lokálnu sieť LAN (WLAN)
          v súčasnosti založených na špecifikácii IEEE 802.11. Wi-Fi bolo navrhnuté
          pre bezdrôtové zariadenia ale dnes sa najčastejšie používa na pripojenie
          k internetu. Umožňuje osobe so zariadením s bezdrôtovým adaptérom
          (PC, notebook, PDA, mobil) pripojenie k internetu v blízkosti prístupového
          bodu (access point). Oblasť pokrytá Wi-Fi signálom sa nazýva hotspot.
        </p>
        <span
        ><img
            src="https://thenetworkinstallers.com/wp-content/uploads/2022/06/network-works-1024x684.jpg"
            alt="Ako funguje Wi-fi"
        /></span>
        <p class="imgTitle">Ako funguje Wi-fi</p>
      </section>
      <section>
        <br /><br />
        <h4>História</h4>
        <p>
          Wi-Fi bolo vynájdené v roku 1991 vo firme NCR Corporation / AT&T
          (neskôr Lucent & Agere Systems) v meste Nieuwegein, Holandsko.
          Prvé bezdrôtové produkty (pôvodne určené pre pokladničné systémy)
          prišli na trh pod názvom WaveLAN s rýchlosťami 1 Mbps/2 Mbps.
          Vic Hayes (vynálezca Wi-Fi, nazývaný „otec Wi-Fi“) sa so svojím
          tímom podieľal na návrhu štandardov IEEE 802.11b, 802.11a a 802.11g.
          V roku 2003 Vic odišiel z Agere Systems do dôchodku. Agere Systems
          bol pod silným tlakom konkurencie, hoci ich produkty boli špičkovej
          kvality, zákazníci požadovali lacnejšie Wi-Fi riešenia.
          Chipset 802.11abg all-in-one od Agere (kódové označenie: WARP) nikdy
          neuspel na trhu. Agere Systems sa rozhodli opustiť Wi-Fi trh na konci
          roka 2004. Veľkú zásluhu na masovom rozšírení Wi-Fi nesie firma Apple,
          ktorá ako prvá predstavila v roku 2001 svoj iBook G3 s Wi-Fi.
        </p>
      </section>
      <section>
        <br /><br />
        <h4>Ako funguje</h4>
        <ul>
          <p>
            Typická Wi-Fi zostava obsahuje jeden alebo viac prístupových bodov
            (AP z anglického slovného spojenia „access point“) a jedného alebo
            viacerých klientov. AP vysiela svoj SSID (Service Set Identifier,
            sieťové meno) prostredníctvom paketov nazývaných beacons (signály, majáky),
            ktoré sú vysielané väčšinou každých 100 ms rýchlosťou 1 Mbps
            (najnižšia rýchlosť Wi-Fi). To zaručuje, že klient prijímajúci signál
            z AP, môže komunikovať rýchlosťou aspoň 1 Mbps. Na základe nastavení
            (napr. podľa SSID) sa klient môže rozhodnúť, či sa k AP pripojí.
            Ak sú napr. v dosahu klienta dva prístupové body s rovnakým SSID,
            klient sa podľa sily signálu môže rozhodnúť, ku ktorému AP sa pripojí.
            Wi-Fi štandard ponecháva pripojovacie kritériá a roaming
            (prechod medzi hotspotmi) úplne na klienta. Toto je sila Wi-Fi,
            ale zároveň to znamená, že jeden bezdrôtový adaptér môže dosiahnuť
            podstatne lepší výkon ako druhý. Vo Windows XP existuje vlastnosť nazývaná
            nulová konfigurácia (zero configuration), ktorá umožňuje používateľovi
            vidieť všetky dostupné siete a pripojiť sa ku ktorejkoľvek z nich „za behu“.
            V budúcnosti budú bezdrôtové adaptéry viac riadené operačným systémom.
            Hoci sa Wi-Fi prenáša vzduchom, má rovnaké vlastnosti ako neprepínaný ethernet.
            Dokonca sa môžu objaviť aj kolízie podobne ako v neprepínaných ethernetových sieťach.
            802.11 používa ako metódu prístupu na médium povinne DCF (CSMA/CA).
          </p>
        </ul>
      </section>
      <section>
        <br /><br />
        <h4>WiFi kontra štandardy mobilných telefónov</h4>
        <ul>
          <p>
            Existujú predpovede, že Wi-Fi a súvisiace technológie nahradia mobilné telefónne
            siete (napr. GSM). Tomu bránia najmä: chýbajúci roaming a autentifikačné funkcie
            (pozri 802.1x, SIM karty a RADIUS), malá šírka prenosového pásma a obmedzený
            dosah Wi-Fi. Je pravdepodobnejšie, že WiMax bude konkurovať ďalším mobilným
            telefónnym protokolom ako sú GSM, UMTS alebo CDMA. Wi-Fi je však ideálny na VoIP
            aplikácie v podnikových sieťach LAN alebo v prostredí SOHO
            (small office / home office). Hoci sa prvé zariadenia objavili už koncom 90-tych
            rokov, trh explodoval v roku 2005. Firmy Zyxell, UT Starcomm, Samsung, Sony Ericsson,
            Nokia, Hitachi a ďalšie ponúkajú VoIP Wi-Fi telefóny za dostupné ceny.
          </p>
          <p>
            V roku 2005 začali poskytovatelia prístupu do internetu poskytovať svojim zákazníkom
            VoIP služby. Pretože je telefonovanie cez VoIP lacné, veľmi často zadarmo, trh s VoIP
            službami bude akcelerovať. Začínajú sa objavovať GSM telefóny s integrovanými Wi-Fi
            a VoIP schopnosťami. Jedného dňa možno nahradia klasické telefóny.
          </p>
          <p>
            Otázka, či bude Wi-Fi konkurovať mobilnej telefónii, sa zdá byť nesprávne položená.
            Trhu budú dominovať zariadenia zodpovedajúce viacerým štandardom. Čisté Wi-Fi telefóny
            majú veľmi obmedzený dosah, vybudovanie globálnej siete by bolo príliš drahé.
            Preto sú vhodné len pre lokálne siete ako sú firemné siete.
          </p>
        </ul>
      </section>
      <section>
        <br /><br />
        <h4>Výhody WiFi</h4>
        <ul>
          <li>
            Na rozdiel od paketových rádiových systémov, Wi-Fi využíva nelicencované rádiové pásmo
            a individuálny používateľ nepotrebuje súhlas miestnych úradov.
          </li>
          <li>
            Umožňuje vybudovať LAN bez káblov, a tak znížiť náklady na vybudovanie či rozširovanie
            siete. Bezdrôtové siete sú výhodné v priestoroch, kde sa nemôžu použiť káble – napr.
            vo vonkajších priestoroch alebo v historických budovách.
          </li>
          <li>
            Wi-Fi produkty sú na trhu široko dostupné. Rozličné značky prístupových bodov
            a klientských sieťových adaptérov medzi sebou spolupracujú na základnej úrovni.
          </li>
          <li>
            Konkurencia medzi výrobcami významne znížila ceny.
          </li>
          <li>
            Viacero prístupových bodov a sieťových adaptérov podporuje rozličné stupne
            kryptovania, vďaka čomu je komunikácia zabezpečená pred zachytením neželanou osobou.
          </li>
          <li>
            Wi-Fi je globálna skupina štandardov. Na rozdiel od mobilnej telefónie ten istý Wi-Fi
            klient pracuje v rôznych krajinách na celom svete.
          </li>
        </ul>
      </section>
    </base-card>
    <base-card>
      <section>
        <h2>Videá</h2>
        <iframe
            src="https://www.youtube.com/embed/xmabFJUKMdg?si=C3UNtVUQPS7FaHpJ"
            title="YouTube video player"
            frameborder="0"
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
            allowfullscreen
            ng-show="showvideo"
        ></iframe>
        <p>
          How Does Wi-Fi Work? | Earth Lab
        </p>
        <br />
        <iframe
            src="https://www.youtube.com/embed/vvKbMueRzrI?si=XTM9ZM0LgAZ9HwYe"
            title="YouTube video player"
            frameborder="0"
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
            allowfullscreen
            ng-show="showvideo"
        ></iframe>
        <p>
          How WiFi Works - Computerphile
        </p>
      </section>
      <br /><br />
      <base-button @click="moveUp">Späť na začiatok</base-button>
    </base-card>
    <base-card v-if="isLoggedIn">
      <section>
        <h2>Testy pre Wi-Fi</h2>
        <ul v-if="testTitles">
          <test-title
              v-for="test in titles"
              :key="test.id"
              :id="test.id"
              :title="test.title"
              :course="test.course"
          ></test-title>
        </ul>
        <h3 v-else><i>Tests not found for this course.</i></h3>
      </section>
      <br /><br />
      <base-button @click="moveUp">Späť na začiatok</base-button>
    </base-card>
    <base-card>
      <section>
        <h2>Referencie</h2>
        <ul>
          <li>
            Wi-Fi Wikipedia
            <a
                href="https://sk.wikipedia.org/wiki/Wi-Fi"
            >Viac</a
            >
          </li>
        </ul>
      </section>
      <br /><br />
      <base-button @click="moveUp">Späť na začiatok</base-button>
    </base-card>
  </section>
</template>

<script>
import TestTitle from "../../components/TestTitle.vue";

export default {
  components: {
    TestTitle,
  },
  data() {
    return {
      titles: [],
      error: null,
    };
  },
  created() {
    this.loadTestTitlesForThisCourse();
  },
  computed: {
    testTitles() {
      return this.$store.getters["test/hasTests"];
    },
    isLoggedIn() {
      return this.$store.getters.isLoggedIn;
    },
  },
  methods: {
    moveUp() {
      window.scrollTo(0, 0);
    },
    async loadTestTitlesForThisCourse() {
      const actionPayload = new FormData();
      actionPayload.append("action", "getTestTitles");
      actionPayload.append("course", "wifi");
      try {
        await this.$store.dispatch("test/fetchTests", actionPayload);
        this.titles = await this.$store.getters["test/getTests"];
      } catch (error) {
        this.error = error;
      }
    },
    handleError() {
      this.error = null;
    },
  },
};
</script>