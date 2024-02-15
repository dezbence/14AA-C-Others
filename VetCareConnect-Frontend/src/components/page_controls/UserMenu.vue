<template>
    <div class="listbox" @mouseleave="userMenuToggle()">
        <div class="list" v-for="menu in MenuItems">
            <routerLink class="menuImg" :to="menu.link"><img :src="menu.img">{{ menu.name }}</routerLink>
        </div>
        <hr v-if="status.loggedIn">
        <div class="list" v-if="status.loggedIn">
            <li class="logOut" @click="onLogout()"><img src="../../assets/icons/logout.svg">
                <p>Kijelentkezés</p>
            </li>
        </div>
    </div>
</template>

<script setup>
import router from '@/router';
import { useUserStore } from '../../store/userstore.js';
import { storeToRefs } from "pinia";
import { useToast } from 'vue-toastification';

const { status } = storeToRefs(useUserStore());
const { logout } = useUserStore();

const toast = useToast();

const MenuItems = [
    { name: "Adataim", link: "/adataim", img: "src/assets/icons/profile-line.svg" },
    { name: "GYIK", link: "/gyik", img: "src/assets/icons/question-mark.svg" }
]

const props = defineProps(['userMenuToggle'])

function onLogout() {
    logout().then(() => {
        props.userMenuToggle();
        router.push('/');
        toast.success('Sikeres kijelentkezés!', { position: "top-center" });
    })
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

.listbox .list {
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

.logOut {
    color: white;
    display: flex;
    align-items: center;
}

.logOut img {
    width: 20px;
    margin-right: 10px;
}

.logOut p {
    margin: 0;
}

.menuImg {
    display: flex;
    align-items: center;
}

.menuImg img {
    width: 20px;
    margin-right: 10px;
}

hr {
    color: #368267;
    border: #368267 2px solid;
}</style>