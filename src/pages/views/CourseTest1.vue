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
        <ul>
          <li>test 1</li>
          <li>test 2</li>
          <li>test 3</li>
          <li>test 4</li>
          <li>test 5</li>
          <li>test 6</li>
        </ul>
      </section>
      <br /><br />
      <base-button @click="moveUp">Späť na začiatok</base-button>
    </base-card>
  </section>
</template>

<script>
import "../../css/TopicPageLayout.css";

export default {
  data() {
    return {};
  },
  methods: {
    moveUp() {
      window.scrollTo(0, 0);
    },
  },
};
</script>

<style scoped>

</style>
