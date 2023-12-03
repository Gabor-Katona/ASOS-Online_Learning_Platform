<template>
  <base-dialog :show="!!error" title="Chyba!" @close="handleError">
    <p>{{ error }}</p>
  </base-dialog>
  <section class="view">
    <base-card>
      <h1>Internet</h1>
      <section>
        <br /><br />
        <h4>Úvod</h4>
        <p>
          Internet (z angl. interconnected networks – prepojené siete; hovorovo: net, sieť)
          je verejne dostupný celosvetový systém vzájomne prepojených počítačových sietí,
          ktoré prenášajú dáta pomocou prepínania paketových dát s použitím štandardizovaného
          Internetového Protokolu (IP) a mnohých ďalších protokolov. Pozostáva z tisícok
          menších komerčných, nekomerčných, akademických, súkromných, vládnych a vojenských
          počítačových sietí. Slúži ako prenosové médium pre rôzne informácie a služby ako
          napr. elektronická pošta, chat a najmä systém vzájomne prepojených hypertextových
          dokumentov (webstránok) a webových aplikácií nazývaných World Wide Web (WWW).
          Internet nemá jednotnú centralizovanú správu implementácii technológií ani zásad
          prístupu a používania. Každá sieť, ktorá je jeho súčasťou, si stanovuje svoje
          vlastné zásady. Spoločné definície dvoch hlavných pilierov internetu: priestoru
          internetového protokolu adries (IP adresa) a systému názvov domén (DNS) sú riadené
          Internetovou spoločnosťou pre prideľovanie názvov a čísiel (Internet Corporation
          for Assigned Names and Numbers - ICANN). Technická podpora a štandardizácia
          základných protokolov je v náplni činnosti Pracovnej skupiny pre internetové
          inžinierstvo (Internet Engineering Task Force - IETF).
        </p>
        <span
        ><img
            src="https://upload.wikimedia.org/wikipedia/commons/d/d2/Internet_map_1024.jpg"
            alt="Vizualizácia internetu z dát projektu Opte"
        /></span>
        <p class="imgTitle">Vizualizácia internetu z dát projektu Opte</p>
      </section>
      <section>
        <br /><br />
        <h4>Dnešný internet</h4>
        <p>
          Okrem komplexných fyzických spojení, ktoré tvoria štruktúru internetu,
          existuje internet aj vďaka multilaterálnym dohodám (napr. „peeringovým
          dohodám – dohoda o vzájomnej výmene internetovej premávky“) a technickým
          špecifikáciám alebo protokolom, ktoré určujú, akým spôsobom sa majú
          vymieňať dáta po sieti.
        </p>
        <p>
          Na rozdiel od starších komunikačných systémov bol balík internetových
          protokolov zámerne navrhnutý agnosticky vzhľadom na fyzické médium,
          na ktorom je prevádzkovaný. Akákoľvek komunikačná sieť, pevná alebo
          bezdrôtová, ktorá je schopná prenášať obojsmerne digitálne údaje môže
          prenášať internetovú premávku. Preto je možné internetové pakety prenášať
          pevnými sieťami ako medený drôt, koaxiálny kábel a optický kábel aj
          bezdrôtové siete ako Wi-Fi. Všetky tieto siete zdieľajúce rovnakú sadu
          protokolov vyššej úrovne tvoria internet.
        </p>
        <p>
          Internetové protokoly pochádzajú z diskusií v rámci Internet Engineering
          Task Force (IETF) a jej pracovných skupín, ktoré sú otvorené verejným
          príspevkom a ich revíziám. Tieto komisie produkujú dokumenty známe ako
          Request for comments (RFC). Niektoré RFC povyšuje Internet Architecture
          Board (IAB) na internetový štandard.
        </p>
        <p>
          Medzi najpoužívanejšie internetové protokoly v balíku internetových protokolov
          patria IP, TCP, UDP, DNS, PPP, SLIP, ICMP, POP3, IMAP, SMTP, HTTP, HTTPS, SSH,
          Telnet, FTP, LDAP, SSL a TLS.
        </p>
        <p>
          Služby, ktoré tieto protokoly využívajú sú e-mail, Usenet newsgroups, World Wide Web,
          Gopher, session access, WAIS, finger, IRC, MUDy a MUSHe. Najpoužívanejšie z nich sú
          e-mail a World Wide Web s mnohými ďalšími službami, ktoré sú na nich založené,
          ako mailing listy, blogy a podcasty. Internet umožňuje poskytovanie služieb v reálnom
          čase ako telefonovanie, internetové rádio a internetové (televízne) vysielanie, ktoré
          sú takto prístupné kdekoľvek na svete.
        </p>
        <p>
          Niektoré iné populárne internetové služby nevznikli týmto spôsobom, ale boli pôvodne
          založené na proprietárnych systémoch. Medzi ne patria IRC, ICQ, AIM a Gnutella.
        </p>
        <p>
          Bolo uskutočnených mnoho analýz internetu a jeho štruktúry. Bolo napríklad zistené,
          že routovacia IP štruktúra internetu a hypertextové linky World Wide Webu sú príkladmi
          bezškálových sietí.
        </p>
      </section>
      <section>
        <br /><br />
        <h4>Internetová kultúra</h4>
        <ul>
          <p>
            Internet má aj ďalekosiahly dopad na prácu, vedomosti a pohľad na svet.
            Okrem vytvorenia elektronického obchodu a komunikácie s klientmi e-mailom
            a príbuznými prostriedkami mení internet aj iné aspekty pracoviska.
            Niektoré spoločnosti začali používať blogy na reklamné účely. Keďže väčšina
            ľudí na webe informácie vyhľadáva, obsahom týchto jednoducho aktualizovateľných
            stránok môžu byť rady v poli pôsobnosti spoločnosti. Takáto spoločnosť dúfa,
            že keď návštevník nájde tieto informácie zadarmo, všimne si expertných znalostí
            tvorcov a to ho následne pritiahne na obchodnú stránku spoločnosti.
            Príkladom takéhoto počínania je Microsoft, ktorý umožnil svojim vývojárom
            publikovať osobné blogy, aby zaujal verejnosť ich prácou.
            Z pohľadu kultúrnej uvedomelosti internet poskytuje obrovské množstvo informácií
            a interaktivity pre ľudí, ktorých zaujímajú iné kultúry a pohľady na svet, ktoré
            by im boli inak nedostupné. Existujú však dôkazy, že ľuďom, ktorých iné kultúry
            nezaujímajú umožňuje internet vyhýbať sa kontaktu vo väčšej miere ako kedykoľvek
            predtým.
          </p>
        </ul>
      </section>
      <section>
        <br /><br />
        <h4>Cenzúra</h4>
        <p>
            V demokratických spoločnostiach dosiahol Internet nového významu ako
            politický nástroj. Prezidentská kampaň Howarda Deana v roku 2004 v
            Spojených štátoch sa stala známou prostredníctvom toho, ako dokázala
            zaistiť sponzorské príspevky cez Internet.
            Niektoré vlády, napríklad na Kube, v Iráne, KĽDR, Mjanmarsku, Číne,
            prípadne Saudskej Arábii, obmedzujú, k čomu na Internete môžu ľudia
            v ich krajinách pristupovať. Ide najmä o obmedzenia prístupu k politickému
            a náboženskému obsahu. Tohoto dosahujú prostredníctvom filtrovania domén a
            obsahu, takže nie je jednoducho dostupný bez prepracovaných postupov.
            V Nórsku, Dánsku, Fínsku a Švédsku sa hlavní internetoví poskytovatelia
            dohodli na obmedzení stránok určených políciou. Napriek tomu, že zoznam
            zakázaných URL by mal obsahovať iba adresy známych stránok s detskou
            pornografiou, obsah zoznamu je utajený.
            Množstvo krajín, vrátane Spojených štátov, síce právne označilo držanie
            alebo distribúciu určitých materiálov, ako napríklad detskej pornografie
            za ilegálnu, no nepoužívajú filtrovací softvér.
            Existuje množstvo slobodného a komerčného softvéru, pomocou ktorého si
            môže užívateľ vybrať blokovanie nepríjemných stránok, samostatných počítačov
            alebo celých sietí, napríklad na obmedzenie prístupu detí k pornografii alebo
            k násilnému obsahu.
        </p>
      </section>
      <section>
        <br /><br />
        <h4>Prístup k internetu</h4>
          <p>
            Bežným spôsobom prístupu je vytáčané spojenie (tzv. dial-up cez klasickú pevnú
            telefónnu linku), ktorý je najpomalší. Ďalší je cez telefónnu ISDN linku, je asi
            dvakrát rýchlejší ale v dnešnej dobe je vytláčaný telefónnymi linkami DSL.
            Ďalšie spôsoby sú širokopásmový (broadband) prístup koaxiálnym káblom pomocou
            rozvodov káblovej televízie, alebo optickým káblom (tzv. FTTH) a prístup cez satelit.
            Existuje aj prístup na internet cez sieť elektrickej rozvodnej siete 220V, ktorý
            je vhodný pre bytové domy. Modemy s touto technológiou pracujú do vzdialenosti až
            200 m (prenosová rýchlosť do 200 Mbps) a existujú tzv. premosťovacie články na
            prepojenie dvoch fáz, to znamená že môžete pripojiť aj suseda, ktorý býva vo vedľajšej
            bráne v bloku. Zatiaľ však je technológia vhodná len na rozvody vnútri bytového domu .
            Európska únia financuje výskumno – vývojový projekt na podporu tohto spôsobu
            prepojenia na internet PowerNet.
          </p>
          <p>
            Verejné miesta, kde je možné používať internet sú internetové kaviarne a vo
            svete bežne aj knižnice. Prístupové body bývajú aj na verejných miestach –
            čakárňach letísk, v niektorých vlakoch, na námestiach väčších miest.
          </p>
          <p>
            Wi-Fi poskytuje bezdrôtový prístup k počítačovým sieťam a teda sa dá použiť aj
            na prístup k samotnému internetu. Hotspoty, ktoré takýto prístup umožňujú sa vyskytujú
            na verejných miestach a je potrebné mať vlastné zariadenie s Wi-Fi kartou. Tieto
            služby môžu byť zadarmo pre každého, iba pre zákazníkov alebo spoplatnené. Hotspot
            nie je obmedzený uzavretým priestorom. Existujú celé campusy a parky, dokonca celé
            štvrte s prístupom.
          </p>
          <p>
            V USA bol v roku 2004 schválený širokopásmový prístup s využitím silových vedení
            napriek ostrým protestom z komunity amatérskeho rádia. Problém modulácie nadzemného
            vysokonapäťového vedenia spočíva v tom, že celá linka sa správa ako obrovská anténa
            a úplne blokuje dlhovlnné rádiové frekvencie používané amatérmi, námorníkmi a inými.
          </p>
          <p>
            Krajiny, kde je internet komoditou používanou väčšinou občanov sú Island, Švédsko,
            Austrália, Dánsko, Spojené štáty, Kanada, Spojené kráľovstvo, Holandsko, Japonsko,
            Kórejská republika a Nórsko. V poslednej dekáde 20. storočia rapídne vzrástol počet
            používateľov internetu, hoci sa tento vývoj po roku 2000 o niečo spomalil. Fáza
            rýchleho rastu v priemyselných krajinách končí s tým, že sa tieto technológie nasadzujú
            bežne, ale rast pokračuje v Afrike, latinskej Amerike, Karibiku, na strednom východe aj
            na Slovensku.
          </p>
          <p>
            Prístup k internetu je nerovnomerne rozdelený medzi nízko a vysokorýchlostné pripojenie.
            ADSL a iné širokopásmové technológie sú vzácne alebo neexistujúce vo väčšine rozvojových
            krajín a aj vo vyspelých krajinách môžu ich penetráciu obmedziť vysoké náklady a priemerný
            výkon (väčšina krajín východnej Európy a Spojené štáty), zatiaľ, čo nízke ceny a vysoký výkon
            lákajú veľké množstvá zákazníkov (Škandinávia, Francúzsko). Aj v rámci jednej krajiny môžu
            existovať rozdiely medzi väčšími mestami (ktoré majú často viacerých poskytovateľov
            širokopásmového prístupu) a ostatnými oblasťami (kde často nie je širokopásmový prístup).
          </p>
          <p>
            Šírenie dostupnosti internetu je spôsob, ako premostiť tzv. digitálnu bariéru (angl. digital divide).
          </p>
      </section>
    </base-card>
    <base-card>
      <section>
        <h2>Videá</h2>
        <iframe
            src="https://www.youtube.com/embed/Dxcc6ycZ73M?si=6fnhjAYG1lDGdhXJ"
            title="YouTube video player"
            frameborder="0"
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
            allowfullscreen
            ng-show="showvideo"
        ></iframe>
        <p>
          What is the Internet?
        </p>
        <br />
        <iframe
            src="https://www.youtube.com/embed/TNQsmPf24go?si=AqA-UAfcXxDSzIEN"
            title="YouTube video player"
            frameborder="0"
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
            allowfullscreen
            ng-show="showvideo"
        ></iframe>
        <p>
          How Does the Internet Work? - Glad You Asked S1
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
            Internet Wikipedia
            <a
                href="https://sk.wikipedia.org/wiki/Internet"
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
      actionPayload.append("course", "internet");
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