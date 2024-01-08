<template>
    <div class="darkBack">
        <div class="petCreatingForm">
            <h3>Hozza létre kedvence adatlapját!</h3>
            <form submit.pervent="handleSubmit"></form>

            <label>Kedvence neve:</label>
            <InputText ></InputText>

            <button @click="addPet(), handleSubmit()">Létrehozás</button>

        </div>
    </div>
</template>

<script setup>
import InputText from 'primevue/inputtext';
import { ref } from 'vue';

const props = defineProps(['addPetToList', 'petsList'])

function addPet() {
    props.addPetToList();
    
}

function handleSubmit() {
    // alert("submitted")
}
</script>

<style scoped>
.petCreatingForm {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    background-color: white;
    border-radius: 7px;
    padding: 30px;
}

input {
    padding: 5px 40px 5px 10px;
    color: #000;
    border-radius: 7px;
    background-color: #ededed;
    border: 1px solid #c5c5c5;
    outline: none;
    max-height: 45px;

}

button {
    border: none;
    border-radius: 7px;
    background-color: #50B692;
    color: white;
    padding: 5px 10px;
    margin-top: 30px;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);

}


</style>