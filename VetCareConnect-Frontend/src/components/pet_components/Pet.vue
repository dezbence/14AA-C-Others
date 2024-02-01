<template>
    <div class="cardsBack">
        <img @click="petMenuToggle()" class="dotsMenu" src="../../assets/icons/dots.svg" />
        <div class="menu">
            <PetMenu v-if="isMenuOpen" :petMenuToggle="petMenuToggle" :editpetId="pet.id" :deletePet="deletePet" :editPet="editPet"></PetMenu>
        </div>
        <div class="profile"></div>

        <h3>{{ pet.id }}</h3>
        <h3>{{ pet.name }}</h3>
        <div>
            <p>{{ pet.species }}</p>
            <p>{{ pet.gender == 0 ? "nőstény" : "hím" }}</p>
            <p>{{ pet.weight }} kg</p>
            <p>{{ pet.comment }}</p>
        </div>
    </div>
</template>
<script setup>
import { ref } from "vue";
import { defineAsyncComponent } from "vue";
import { useUserStore } from '@/store/userstore';
import { storeToRefs } from 'pinia';

const { user } = storeToRefs(useUserStore());
const store = useUserStore();

const PetMenu = defineAsyncComponent(() => import("./PetMenu.vue"));

const props = defineProps(['pet']);

const isMenuOpen = ref(false);
function petMenuToggle() {
    isMenuOpen.value = !isMenuOpen.value;
}

function deletePet() {
    store.showPetDelete(true);
    store.deletePetId = props.pet.id;
}

function editPet(){
    store.showPetEdit(true);
    store.editPet = props.pet;
    console.log(store.editPet)
}
</script>

<style scoped>
.cardsBack {
    background-color: #50b692;
    border-radius: 7px;
    height: 420px;
    width: 270px;
    padding: 20px 30px;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
    text-align: center;
    color: #fff;
    margin: 0 0 40px 40px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    position: relative;
}

.menu {
    position: absolute;
    top: 20px;
    right: 35px;
}

.profile {
    border-radius: 100%;
    width: 80px;
    height: 80px;
    background-color: #fff;
    margin-bottom: 20px;
}

.dotsMenu {
    position: absolute;
    top: 16px;
    right: 12px;
    cursor: pointer;
    filter: invert(100%);
}

.dotsMenu:hover {
    transform: scale(1.1);
}

h3 {
    margin: 0 0 10px;
}
</style>
