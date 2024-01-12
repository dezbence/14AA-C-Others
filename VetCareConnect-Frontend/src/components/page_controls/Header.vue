<template>
  <div class="heading">
    <div class="hamburgerMenu">
      <img @click="menuToggle()" id="toggleIcon"
        :src="isMenuOpen ? 'src/assets/icons/close.svg' : 'src/assets/icons/menu.svg'">
    </div>

    <ul class="navigation">
      <li>
        <router-link to="/">
          <img id="logo" src="../../assets/images/logo.png" />
        </router-link>
      </li>
      <div class="routers" v-for="route in Routes">
        <li><router-link :to="route.link">{{ route.name }}</router-link></li>
      </div>
    </ul>

    <div class="sign" v-if="!status.loggedIn">
      <button id="bejelentkezes"><router-link to="/bejelentkezes">Bejelentkezés</router-link></button>
      <span id="regisztracio"><router-link to="/regisztracio">Regisztráció</router-link></span>
    </div>
    <div v-else>
      <span class="userName">{{ user.name }}</span>
      <img class="loggedInProfile" src="../../assets/icons/account_circle.svg">
    </div>

      <img class="profile" src="../../assets/icons/account_circle.svg">
   
  </div>

  <SideBar v-if="isMenuOpen"></SideBar>
</template>
  
<script setup>
import { RouterLink } from "vue-router";
import SideBar from "./SideBar.vue";
import { ref } from "vue";
import { storeToRefs } from "pinia";
import { useUserStore } from "@/store/userstore";
const { status, user} = storeToRefs(useUserStore());


const Routes = [
  { name: "Kezdőlap", link: "/" },
  { name: "Időpont foglalás", link: "/idopontfoglalas" },
  { name: "Kedvenceim", link: "/kedvenceim" },
  { name: "Naptáram", link: "/naptaram" }
]

const isMenuOpen = ref(false);

function menuToggle() {
  isMenuOpen.value = !isMenuOpen.value;
}

</script>

<style scoped>
.menuShow {
  display: block;
}

.menuHide {
  display: none;
}

.heading {
  background-color: #50b692;
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 8px 8px;
  width: 100%;
  height: 60px;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  position: relative;
  z-index: 99;
}

.navigation li {
  padding: 15px;
  align-items: center;
  justify-content: center;
  display: flex;
  display: inline-block;
}

.navigation {
  display: flex;
  align-items: center;
  justify-content: center;
  list-style: none;
  margin: 0;
  padding-left: 0;
}

.navigation .routers a {
  display: flex;
  align-items: center;
  justify-content: center;
}

.hamburgerMenu, .profile {
  display: none;
  cursor: pointer;
  filter: invert(100%);
}

.hamburgerMenu:hover, .profile:hover {
  transform: scale(1.1);
  transition: 200ms;
}

.heading a {
  font-weight: 500;
  color: #fff;
  text-decoration: none;
}

.heading a.router-link-exact-active {
  color: #246951;
}

.routers a.router-link-exact-active {
  border-radius: 7px 7px 0 0;
  height: 5px;
  width: 110%;
  box-shadow: 0 27px 0 0 #246951;
}

.heading a:hover {
  color: #246951;
  transition: 200ms;
}

.heading #logo {
  height: 28px;
  cursor: pointer;
  z-index: 99;
}

.sign {
  margin-right: 10px;
  display: flex;
  align-items: center;
}

.sign a {
  padding: 10px;
}

#bejelentkezes {
  background-color: #368267;
  border-radius: 100px;
  padding: 6px 8px;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  border: none;
}

@media (max-width: 991px) {

  .routers,
  .sign {
    font-size: 0.9rem;
  }

  .routers a.router-link-exact-active {
    box-shadow: 0 28px 0 0 #246951;
    height: 4px;
  }

}

@media (max-width: 891px) {
  .routers {
    display: none;
  }

  .hamburgerMenu, #toggleIcon, .profile {
    display: block;
    height: 30px;
  }

  .sign {
    display: none;
  }

  .heading {
    padding: 5px 20px;
  }
}</style>
  