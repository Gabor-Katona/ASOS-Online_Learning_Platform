<template>
  <section>
    <base-card>
      <h1>Learning Management System</h1>
      <p>
        <span>{{ time }}</span>
      </p>
      <section>
        <v-carousel hide-delimiters height="400" show-arrows="hover" cycle dark>
          <template v-slot:prev="{ props }">
            <v-btn
                rounded="pill"
                size="small"
                variant="outlined"
                @click="props.onClick"
            >Prev</v-btn>
          </template>
          <template v-slot:next="{ props }">
            <v-btn
                rounded="pill"
                size="small"
                variant="outlined"
                @click="props.onClick"
            >Next</v-btn>
          </template>
          <v-carousel-item
              v-for="(slide, i) in slides"
              :key="i"
              @click="transfer(routes[i])"
          >
            <v-sheet :color="'red lighten-1'" height="100%">
              <div class="d-flex fill-height justify-center align-center">
                <div class="text-h2">{{ slide }}</div>
              </div>
            </v-sheet>
          </v-carousel-item>
        </v-carousel>
      </section>
    </base-card>
  </section>
</template>

<script>
export default {
  data() {
    return {
      time: null,
      colors: [
        "grey",
        "warning",
        "pink darken-2",
        "red lighten-1",
        "deep-purple accent-4",
      ],
      slides: ["Course 1", "Course 2", "Free course"],
      routes: ["/course1", "/course2", "/course1"],
    };
  },
  methods: {
    startTime() {
      const today = new Date();
      let h = today.getHours();
      let m = today.getMinutes();
      let s = today.getSeconds();
      m = this.checkTime(m);
      s = this.checkTime(s);

      this.time = h + ":" + m + ":" + s;
      setTimeout(this.startTime, 1000);
    },

    checkTime(i) {
      if (i < 10) {
        i = "0" + i;
      }
      return i;
    },
    transfer(route) {
      window.scrollTo(0, 0);
      this.$router.push(route);
    },
  },

  created() {
    this.startTime();
  },
};
</script>