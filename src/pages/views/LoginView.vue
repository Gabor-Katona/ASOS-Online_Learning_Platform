<template>
  <base-dialog :show="!!error" title="Chyba!" @close="handleError">
    <p>{{ error }}</p>
  </base-dialog>
  <base-dialog :show="isLoading" title="Overenie údajov..." fixed>
    <base-spinner></base-spinner>
  </base-dialog>
  <section>
    <base-card>
      <h2>Prihlásenie!</h2>
      <br />
      <login-formkit @save-login="saveLogin"></login-formkit>
    </base-card>
  </section>
</template>

<script>
import LoginFormkit from "../../components/LoginFormkit.vue";

export default {
  components: {
    LoginFormkit,
  },
  data() {
    return {
      isLoading: false,
      error: null,
    };
  },
  methods: {
    async saveLogin(data) {
      this.isLoading = true;
      try {
        await this.$store.dispatch("login", data);
        setTimeout(() => {
          this.isLoading = false;
          this.$router.replace("/");
        }, 500);
      } catch (err) {
        setTimeout(() => {
          this.isLoading = false;
          this.error = err;
        }, 800);
      }
    },
    handleError() {
      this.error = null;
    },
  },
};
</script>
