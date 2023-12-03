<template>
  <base-dialog :show="!!error" title="Chyba!" @close="handleError">
    <p>{{ error }}</p>
  </base-dialog>
  <section class="view">

    <base-card>
      <h1> -- TITLE -- </h1>
      <h3> -- SUBTITLE -- </h3>

      <section>
        <br/><br/>
        <h4> -- SECTION TITLE -- </h4>
        <p>
          -- SECTION CONTENT --
        </p>
        <p>
          -- SECTION CONTENT --
        </p>

        <span><img
            src=" -- IMAGE 1 SOURCE (link) -- "
            alt=" -- IMAGE 1 DESCRIPTON -- "
        /></span>
        <p class="imgTitle"> -- IMAGE 1 DESCRIPTON -- </p>

        <p>
          -- SECTION CONTENT --
        </p>

        <span><img
            src=" -- IMAGE 2 SOURCE (link) -- "
            alt=" -- IMAGE 2 DESCRIPTON -- "
        /></span>
        <p class="imgTitle"> -- IMAGE 1 DESCRIPTON -- </p>

        <ul>
          <li>
            <span><strong> -- LIST ELEMENT 1 TITLE -- </strong></span>
            -- LIST ELEMENT 1 --
          </li>
          <li>
            <span><strong> -- LIST ELEMENT 2 TITLE -- </strong></span>
            -- LIST ELEMENT 2 --
          </li>
          <li>
            <span><strong> -- LIST ELEMENT 3 TITLE -- </strong></span>
            -- LIST ELEMENT 3 --
          </li>
        </ul>

      </section>
    </base-card>

    <base-card>
      <section>
        <h2>Videá</h2>

        <iframe
            src=" --YOUTUBE VIDEO LINK -- "
            title="YouTube video player"
            frameborder="0"
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
            allowfullscreen
            ng-show="showvideo"
        ></iframe>
        <p> -- VIDEO DESCRIPTION -- </p>
        <br/>

        <iframe
            src=" --YOUTUBE VIDEO LINK 2 -- "
            title="YouTube video player"
            frameborder="0"
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
            allowfullscreen
            ng-show="showvideo"
        ></iframe>
        <p> -- VIDEO 2 DESCRIPTION -- </p>

      </section>
      <br/><br/>
      <base-button @click="moveUp">Späť na začiatok</base-button>
    </base-card>

    <base-card v-if="isLoggedIn">
      <section>
        <h2>Testy pre -- TITLE -- </h2>
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
      <br/><br/>
      <base-button @click="moveUp">Späť na začiatok</base-button>
    </base-card>

    <base-card>
      <section>
        <h2>Referencie</h2>
        <ul>
          <li>
            -- REFERENCE NAME 1 --
            <a
                href=" -- REFERENCE 1 LINK -- "
            >Viac</a
            >
          </li>
          <li>
            -- REFERENCE NAME 2 --
            <a href=" -- REFERENCE 2 LINK -- ">Viac</a>
          </li>
        </ul>
      </section>
      <br/><br/>
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
      actionPayload.append("course", " -- TITLE -- ");
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