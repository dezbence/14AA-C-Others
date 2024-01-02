<template>

    <div class="heading"> 
      <div class="hamburgerMenu" >
        <img @click="menuToggle()" id="toggleIcon" src="../assets/icons/menu_FILL0_wght400_GRAD0_opsz24.svg">
        <!-- <svg   xmlns="http://www.w3.org/2000/svg" height="32" viewBox="0 -960 960 960" width="32"><path d="M120-240v-80h720v80H120Zm0-200v-80h720v80H120Zm0-200v-80h720v80H120Z"/></svg> -->
      </div>
  
      <ul class="navigation">
        <li>
          <router-link to="/">
            <img id="logo" src="../assets/Képek/VetCareConnect.png" />
          </router-link>
        </li>
        <div class="routers" v-for="route in Routes">
            <li><router-link :to= "route.link" >{{ route.name }}</router-link></li>
          </div>
      </ul>
  
      <div class="sign">
        <span id="bejelentkezes"><router-link to="/bejelentkezes">Bejelentkezés</router-link></span>
        <span id="regisztracio"><router-link to="/regisztracio">Regisztráció</router-link></span>
      </div>
      <div class="profile">
        <svg xmlns="http://www.w3.org/2000/svg" height="32" viewBox="0 -960 960 960" width="32"><path d="M234-276q51-39 114-61.5T480-360q69 0 132 22.5T726-276q35-41 54.5-93T800-480q0-133-93.5-226.5T480-800q-133 0-226.5 93.5T160-480q0 59 19.5 111t54.5 93Zm246-164q-59 0-99.5-40.5T340-580q0-59 40.5-99.5T480-720q59 0 99.5 40.5T620-580q0 59-40.5 99.5T480-440Zm0 360q-83 0-156-31.5T197-197q-54-54-85.5-127T80-480q0-83 31.5-156T197-763q54-54 127-85.5T480-880q83 0 156 31.5T763-763q54 54 85.5 127T880-480q0 83-31.5 156T763-197q-54 54-127 85.5T480-80Z"/></svg>
      </div>
  </div>
  <SideBar v-if="isMenuOpen"></SideBar>
    
  </template>
  <router-view></router-view>
  
  <script setup>
  import { RouterLink } from "vue-router";
  import SideBar from "./SideBar.vue";
  import { ref } from "vue";
  
  const Routes = [
    { name: "Kezdőlap", link: "/" },
    { name: "Időpont foglalás", link: "/idopontfoglalas" },
    { name: "Kedvenceim", link: "/kedvenceim" },
    { name: "Naptáram", link: "/naptaram" }
  ]
  
      const isMenuOpen = ref(false);
      
      function menuToggle() {
        if (isMenuOpen.value == false) {
          
          isMenuOpen.value = true;
          document.getElementById(
            "toggleIcon"
          ).src = require("../assets/icons/close_FILL0_wght400_GRAD0_opsz24.svg");
          console.log(isMenuOpen.value)
        } else {
         
          isMenuOpen.value = false;
          document.getElementById(
            "toggleIcon"
          ).src = require("../assets/icons/menu_FILL0_wght400_GRAD0_opsz24.svg");
          console.log(isMenuOpen.value)
        }
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
    padding: 1vh 1vw;
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
  .header-right {
    display: flex;
    align-items: center;
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
    background: transparent;
    border-radius: 7px 7px 0 0;
    height: 5px;
    width: 110%;
    box-shadow: 0 27px 0 0 #246951;
  }
  
  .heading a:hover {
    color: #246951;
    transition: 300ms;
  }
  
  .heading #logo {
    height: 28px;
    cursor: pointer;
    z-index: 99;
  }
  
  .sign {
    margin-right: 1vh;
    display: flex;
    align-items: center;
  }
  
  .sign a {
    padding: 1vh 1vw;
  }
  
  #bejelentkezes {
    background-color: #368267;
    border-radius: 45px;
    padding: 6px 8px;
  }
  
  @media (max-width: 991px) {
    .routers, .sign {
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
      .hamburgerMenu, .profile {
        display: block;
      }
      .sign {
        display: none;
      }
      .heading {
        padding: 0.5vh 20px;
      }
  }
  
  </style>
  