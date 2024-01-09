<template>
    <Header></Header>
    <PetCreator v-if="isPetCreating"  @submit="createPetCard"></PetCreator>
    <div>
        <h1 class="pageTitle">Kedvenceim</h1>
        <div class="petsCard">
            <Pet v-for="pet in petsList" v-if="petsList.length > 0" @delete-pet="deletePet" ></Pet>
            <div class="noPetsYet" v-else>
                <p>Önnek még nincs egy kedvence sem rögzítve... Hozza létre kedvence(i) adatlapját!</p>
                <img src="../../assets/icons/arrow_forward_ios.svg">
            </div>
            <button class="addPet" @click="showCreator">
                <img class="addPetIcon" src="../../assets/icons/add.svg">
            </button>

        </div>
        <h1 class="pageTitle">Korábbi kezelések</h1>
        <PastAppointments v-for="appointment in appointmentsList" v-if="appointmentsList.length > 0" ></PastAppointments>
        <div class="marginBottom">.</div>
    </div>
    <Footer></Footer>
</template>
  
<script setup>
import { ref } from 'vue';
import Header from '@/components/page_controls/Header.vue';
import Footer from '@/components/page_controls/Footer.vue';
import Pet from '@/components/pet_components/Pet.vue';
import PetCreator from '@/components/pet_components/PetCreator.vue';
import PastAppointments from '@/components/appointment_components/PastAppointments.vue'
import { toRaw } from 'vue';

const isPetCreating = ref(false);
const petsList = ref([]);
const counter = ref(0);
const appointmentsList = ref([1,1]);

function showCreator() {
    isPetCreating.value = true;
}

function createPetCard(pet) {
    
    petsList.value.push(pet.value);
    isPetCreating.value = false;
    console.log(toRaw(petsList.value[counter.value]))
    counter.value++;
}


function deletePet() {
    // petsList.value = petsList.value.filter((pet) => pet.id !== petId)
    console.log(deleting)
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
</style>