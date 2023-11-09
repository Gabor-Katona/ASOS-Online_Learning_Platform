<template>
  <base-dialog :show="!!error" title="Chyba!" @close="handleError">
    <p>{{ error }}</p>
  </base-dialog>
  <section class="view">
    <base-card>
      <h1>Test Course 2</h1>
      <section>
        <br /><br />
        <h4>Úvod</h4>
        <p>
          Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>
      </section>
    </base-card>

    <base-card v-if="isLoggedIn">
      <section>
        <h2>Testy</h2>
        <ul v-if="testTitles">
          <test-title
              v-for="test in titles"
              :key="test.id"
              :id="test.id"
              :title="test.title"
              :course="test.course"
          ></test-title>
        </ul>
        <h3 v-else>No Tests found.</h3>
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
    async displayTestTitlesForThisCourse() {
      const actionPayload = new FormData();
      actionPayload.append("action", "getTestTitles");
      actionPayload.append("course", "course2");
      try {
        await this.$store.dispatch("test/fetchTests", actionPayload);
        this.titles = await this.$store.getters["test/getTests"];
        // for(let test of tests){
        //   this.titles.push({['id']: test.id, ['title']: test.title, ['course']: test.course});
        // }
      } catch (error) {
        this.error = error;
      }
    },
    handleError() {
      this.error = null;
    },
  },
  created() {
    this.displayTestTitlesForThisCourse();
  },
};
</script>