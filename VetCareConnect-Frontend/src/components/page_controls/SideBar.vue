<template>
    <div class="sideBar">
      <div class="front">
        <ul>
          <div class="routers" v-for="route in Routes">
            <li><router-link :to="route.link">{{ route.name }}</router-link></li>
          </div>
        </ul>
  
        <div class="sign">
          <span id="bejelentkezes"><router-link to="/bejelentkezes">Bejelentkezés</router-link></span>
          <span id="regisztracio"><router-link to="/regisztracio">Regisztráció</router-link></span>
        </div>
      </div>
  
    </div>
  </template>
  
  <script setup>
  const Routes = [
    { name: "Kezdőlap", link: "/" },
    { name: "Időpont foglalás", link: "/idopontfoglalas" },
    { name: "Kedvenceim", link: "/kedvenceim" },
    { name: "Naptáram", link: "/naptaram" }
  ]
  </script>
  
  <style scoped>
  .sideBar {
    display: none;
    background-color: #50B692;
    position: absolute;
    top: 0;
    left: 0;
    bottom: 0;
    z-index: 98;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  
  }
  
  .front {
    margin-top: 80px;
  }
  
  ul {
    list-style: none;
    min-width: 300px;
    width: 100%;
    padding: 30px;
  }
  
  .routers li a {
    text-decoration: none;
    color: white;
    font-weight: 500;
  }
  
  .routers li a.router-link-exact-active {
    color: #246951;
  }
  
  .routers li {
    margin-bottom: 15px;
    font-size: 1rem;
    border-bottom: 1px solid white;
  
  }
  
  .sign span {
  
    display: flex;
    align-items: center;
    flex-direction: column;
  
  }
  
  span a {
    font-weight: 500;
    font-size: 1rem;
    margin-top: 20px;
    text-decoration: none;
    color: white;
    text-align: center;
  }
  
  #bejelentkezes a {
    background-color: #368267;
    border-radius: 45px;
    padding: 6px 8px;
    width: 200px;
  }
  
  @media (max-width: 891px) {
    .sideBar {
      display: block;
    }
  }
  
  @media (max-width: 450px) {
    .sideBar {
      right: 0;
    }
  }
  </style>