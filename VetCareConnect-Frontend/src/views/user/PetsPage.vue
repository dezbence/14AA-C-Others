<template>
    <Header></Header>
    <PetCreator v-if="isPetCreating" :add-pet-to-list="addPetToList"></PetCreator>
    <div>
        <h1>Kedvenceim</h1>
        <div class="petsCard">
            <!-- <Pet v-for="pet in petsList" v-if="petsList.length > 0" @delete-pet = deletePet></Pet> -->
            <div class="petCard" v-for="pet in petsList" v-if="petsList.length > 0">
                <div class="cardsBack">
                    <img @click="petMenuToggle()" class="dotsMenu" src="../../assets/icons/dots.svg">
                    <div class="menu">
                        <PetMenu v-if="isMenuOpen" :petMenuToggle="petMenuToggle"></PetMenu>
                    </div>
                    <div class="profile">

                    </div>

                    <h3>{{ pet.name }}</h3>
                    <p>{{ }}</p>
                    <p>{{ }}</p>
                    <p>{{ }} kg</p>
                    <p>Utoljára {{ }} hónapja módosítva utoljára</p>




                </div>
            </div>
            <div class="noPetsYet" v-else>
                <p>Önnek még nincs egy kedvence sem rögzítve... Hozza létre kedvence(i) adatlapját!</p>
                <img src="../../assets/icons/arrow_forward_ios.svg">
            </div>
            <button class="addPet" @click="showCreator">
                <img class="addPetIcon" src="../../assets/icons/add.svg">
            </button>

        </div>
        <h1>Korábbi kezelések</h1>
    </div>
    <Footer></Footer>
</template>
  
<script setup>
import { ref } from 'vue';
import Header from '@/components/page_controls/Header.vue';
import Footer from '@/components/page_controls/Footer.vue';
import Pet from '@/components/pet_components/Pet.vue';
import PetMenu from '@/components/pet_components/PetMenu.vue';
import PetCreator from '@/components/pet_components/PetCreator.vue';

const isPetCreating = ref(false);
const petsList = ref([]);

function showCreator() {
    isPetCreating.value = true;
}

function addPetToList() {
    petsList.value.push({
        id: Math.floor(Math.random() * 1000000),
        name: "",
        species: "",
        gender: 2,
        weight: 0.0,
        born_date: "",
        comment: ""
    });
    isPetCreating.value = false;
};

function deletePet() {
    // petsList.value = petsList.value.filter((pet) => pet.id !== petId)
    console.log(deleting)
}

const isMenuOpen = ref(false);
function petMenuToggle() {
    isMenuOpen.value = !isMenuOpen.value;
}

</script>

<style scoped>
h1 {
    margin: 50px 0 25px 50px;
    color: #368267;
}

.petsCard {
    display: flex;
    align-items: center;
    flex-wrap: wrap;
}

.addPet {
    background-color: #50B692;
    border-radius: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 10px;
    height: max-content;
    width: max-content;
    margin-left: 40px;
    cursor: pointer;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}

button {
    border: 0;
}

.noPetsYet {
    margin: 30px 0 30px 50px;
    padding: 15px 25px;
    width: 500px;
    background-color: #af3b3b;
    color: white;
    display: flex;
    align-items: center;
    border-radius: 7px;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}

.noPetsYet img {
    filter: invert(100%);
}

.addPetIcon {
    width: 40px;
    height: 40px;
    filter: invert(100%);
}
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