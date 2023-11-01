<template>
  <section>
    <base-card>
      <h1>Test Course 1</h1>
      <h3>text</h3>
      <section>
        <br /><br />
        <h4>Úvod</h4>
        <p>
          Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
        </p>
      </section>
    </base-card>

    <base-card>
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
      <br/><br/>
      <base-button @click="moveUp">Späť na začiatok</base-button>
    </base-card>
  </section>
</template>

<script>
import "../../css/TopicPageLayout.css";
import TestTitle from '../../components/TestTitle.vue';

export default {
  components: {
    TestTitle
  },
  data() {
    return {
      titles: [],
    };
  },
  computed: {
    testTitles() {
      return this.$store.getters['test/hasTests'];
    },
  },
  methods: {
    moveUp() {
      window.scrollTo(0, 0);
    },
    async displayTestTitlesForThisCourse() {
      const actionPayload = new FormData();
      actionPayload.append("action", "getTestTitles");
      actionPayload.append("course", "course1");
      try {
        await this.$store.dispatch("test/displayTestsInTopics", actionPayload);
        const tests = await this.$store.getters["test/getTests"];
        for (let test of tests) {
          this.titles.push({['id']: test.id, ['title']: test.title, ['course']: test.course});
        }
      } catch (error) {
        console.log("ERROR: ", error);
      }
    },

  },
  created() {
    this.displayTestTitlesForThisCourse();
  },
};
</script>