<template>
    <div class="cardsBack">
        <img @click="petMenuToggle()" class="dotsMenu" src="../../assets/icons/dots.svg">
        <div class="menu">
            <PetMenu v-if="isMenuOpen" :petMenuToggle="petMenuToggle"></PetMenu>
        </div>
        <div class="profile">
            
        </div>

        <h3>{{ }}</h3>
        <p>{{ }}</p>
        <p>{{ }}</p>
        <p>{{ }} kg</p>
        <p>Utoljára {{ }} hónapja módosítva utoljára</p>




    </div>
</template>
<script setup>
import { ref } from 'vue';
import PetMenu from './PetMenu.vue';

const props = defineProps(['petsList']);


const isMenuOpen = ref(false);
function petMenuToggle() {
    isMenuOpen.value = !isMenuOpen.value;
}

</script>
<style scoped>
.petCard .cardsBack {
    background-color: #50B692;
    border-radius: 10px;
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

.petCard .menu {
    position: absolute;
    top: 20px;
    right: 35px;
}

.petCard .profile {
    border-radius: 100%;
    width: 80px;
    height: 80px;
    background-color: #fff;
    margin-bottom: 20px;
}

.petCard .dotsMenu {
    position: absolute;
    top: 16px;
    right: 12px;
    cursor: pointer;
    filter: invert(100%);
}

.petCard .dotsMenu:hover {
    transform: scale(1.1);
}

.petCard h3 {
    margin: 0 0 10px;
}
</style>