<template>
    <div class="darkBack">
        <div class="petCreatingForm">
            <h3>Hozza létre kedvence adatlapját!</h3>
            <form submit.pervent="handleSubmit"></form>

            <label>Kedvence neve:</label>
            <InputText></InputText>

            <button @click="addPet(), handleSubmit()">Létrehozás</button>

        </div>
    </div>
</template>

<script setup>
import InputText from 'primevue/inputtext';

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


</style>