<template>
  <header>
    <nav class="navbar">
      <div class="brand-title">OLP app</div>
      <a href="" class="toggle-button" @click.prevent="toggle">
        <span class="bar"></span>
        <span class="bar"></span>
        <span class="bar"></span>
      </a>
      <div class="navbar-links">
        <ul>
          <li>
            <router-link to="/">Domov</router-link>
          </li>
          <li>
            <div class="dropdown" @click.prevent>
              <span>Kurzy</span>
              <div class="dropdown-content">
                <router-link to="/internet" class="link">Internet</router-link>
                <router-link to="/wifi" class="link">Wi-Fi</router-link>
                <router-link to="/lifi" class="link">LI-FI</router-link>
                <router-link to="/vlc" class="link">Viditeľná sveteľna komunikácia</router-link>
              </div>
            </div>
          </li>
          <li>
            <router-link to="/about">O nás</router-link>
          </li>
          <li v-if="activeRole === 'student' || activeRole === 'admin'">
            <router-link to="/student">Študent</router-link>
          </li>
          <li v-if="activeRole === 'teacher' || activeRole === 'admin'">
            <router-link to="/createtest">Učiteľ</router-link>
          </li>
          <li v-if="activeRole === 'admin'">
            <router-link to="/adminpanel">Admin</router-link>
          </li>
          <li v-if="!isLoggedIn">
            <router-link to="/login">Prihlásiť</router-link>
          </li>
          <li v-if="!isLoggedIn">
            <router-link to="/register">Registrácia</router-link>
          </li>
          <base-button v-else class="flat logout" @click="logout">Odhlásiť</base-button>
        </ul>
      </div>
    </nav>
  </header>
</template>

<script>
export default {
  computed: {
    isLoggedIn() {
      return this.$store.getters.isLoggedIn;
    },
    activeRole() {
      return this.$store.getters.userRole;
    },
  },
  methods: {
    logout() {
      this.$store.dispatch("autoLogout");
      this.$router.replace("/");
    },
    toggle(){
      document.getElementsByClassName('navbar-links')[0].classList.toggle('active');
    },
  },

};
</script>

<style scoped>
.navbar {
  display: flex;
  position: relative;
  justify-content: space-between;
  align-items: center;
  background-color: #333;
  color: white;

}

.brand-title {
  font-size: 2rem;
  margin: .5rem;
}

.navbar-links {
  height: 100%;
}

.navbar-links ul {
  display: flex;
  margin: 0;
  padding: 0;
}

.navbar-links li {
  list-style: none;
}

.navbar-links li a {
  display: block;
  text-decoration: none;
  color: white;
  padding: 1.5rem;
  font-size: 1.5rem;
}

.navbar-links li:hover {
  background-color: #555;
  border-radius: 15px;

}

.toggle-button {
  position: absolute;
  top: .75rem;
  right: 1rem;
  display: none;
  flex-direction: column;
  justify-content: space-between;
  width: 30px;
  height: 21px;
}

.toggle-button .bar {
  height: 4px;
  width: 100%;
  background-color: white;
  border-radius: 10px;
}

@media (max-width: 1000px) {
  .navbar {
    flex-direction: column;
    align-items: flex-start;
  }

  .toggle-button {
    display: flex;

  }

  .navbar-links {
    display: none;
    width: 100%;
  }

  .navbar-links ul {
    width: 100%;
    flex-direction: column;
  }

  .navbar-links ul li {
    text-align: center;
  }

  .navbar-links ul li a {
    padding: .5rem 1rem;
  }

  .navbar-links.active {
    display: flex;
  }

  .dropdown-content{
    width: 160px;
    margin-left: -50px;
  }
  .dropdown-content .link{
    font-size: .8rem;
  }
}

/* The container <div> - needed to position the dropdown content */
.dropdown {
  position: relative;
  display: inline-block;
  text-align: center;
  float: none;
  margin: 25px;
  /* margin-top: 25px; */
  cursor: pointer;
  height: 100%;
}
.dropdown span{
  width: 100%;
  font-size: 1.5rem;
}
/* Dropdown Content (Hidden by Default) */
.dropdown-content {
  display: none;
  position: absolute;
  background-color: #333235;
  width: 200px;
  box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
  z-index: 1;
  margin-left: -70px;
  border-radius: 10px;
}
.dropdown-content .link {
  font-size: 1rem;
  padding: 12px 16px;
}
.logout{
  align-self: center;
  margin: 15px;
  width: 120px;
}

/* Links inside the dropdown */
.dropdown-content a {
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}


/* Change color of dropdown links on hover */
.dropdown-content a:hover {
  background-color: rgb(122, 120, 120);
  color: #f1f1f1;
  border-radius: 12px;
}



/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {
  display: block;
}

/* Change the background color of the dropdown button when the dropdown content is shown */
/* .dropdown:hover .dropbtn {background-color: #3e8e41;} */
</style>
