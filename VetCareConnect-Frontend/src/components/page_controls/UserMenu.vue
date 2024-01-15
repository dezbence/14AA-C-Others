<template>
    <div class="listbox" @mouseleave="userMenuToggle()">
        <div class="list" v-for="menu in MenuItems">
            <routerLink :to="menu.link">{{ menu.name }}</routerLink>
        </div>
        <hr>
        <div class="list">
            <li @click="onLogout()">Kijelentkezés</li>
        </div>
    </div>
</template>

<script setup>
import { useUserStore } from '../../store/userstore.js';
const { logout } = useUserStore();

const MenuItems = [
    { name: "Adataim", link: "/" },
    { name: "GYIK", link: "/idopontfoglalas" },
    { name: "Beállítások", link: "/kedvenceim" }
]

const props = defineProps(['userMenuToggle'])

function onLogout(){
  logout().then(()=>{ router.push('/')  })
}

</script>

<style scoped>
.listbox {
    width: 200px;
    border: 1px solid #368267;
    background-color: #50B692;
    border-radius: 7px;
    padding: 15px 20px 15px;
    position: absolute;
    top: 65px;
    right: 5px;
    z-index: 99;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
}

.listbox .list {
    list-style: none;
    margin: 0;
    padding: 0;
}

.listbox .list  {
    padding: 5px 6px;
    border-radius: 7px;
    cursor: pointer;
}

.listbox .list a {
    text-decoration: none;
    color: white;
}

.listbox .list:hover {
    background-color: #368267;
}
</style>