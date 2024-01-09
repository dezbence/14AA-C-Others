<template>
    <div class="darkBack">
        <div class="petCreatingForm">
            <h3>Hozza létre kedvence adatlapját!</h3>
            <form submit.pervent="handleSubmit"></form>

            <label>Kedvence neve:</label>
            <InputText v-model="pet.name"></InputText>

            <label>Fajtája:</label>
            <Dropdown v-model="pet.spieces" :options="spieces" showClear placeholder="Select a City"
                class="" />

            <label>Neme:</label>
            <Dropdown v-model="pet.gender" :options="genders" showClear placeholder="Select a City"
                class="" />

            <label>Súlya:</label>

            <InputMask id="basic" v-model="pet.weight" mask="99-999999" placeholder="0" />
            <label>Születési dátuma:</label>
            <InputMask id="basic" v-model="pet.bornDate" placeholder="éééé.hh.nn" mask="9999.99.99"/>
            <label>Megjegyzés:</label>
            <Textarea v-model="pet.comment" rows="4" cols="40" autoResize />

            <button @click=" handleSubmit()">Létrehozás</button>

        </div>
    </div>
</template>

<script setup>
import InputText from 'primevue/inputtext';
import Dropdown from 'primevue/dropdown';
import InputMask from 'primevue/inputmask';
import Textarea from 'primevue/textarea';
import { ref } from 'vue';

const props = defineProps(['addPetToList', 'petsList'])

const spieces = ['kutya', 'macska', 'hörcsög', 'cápa']
const genders = ['fiú', 'lány']

const pet = ref({
    name: "",
    spieces: "",
    gender: 0,
    weight: 0,
    bornDate: "",
    comment: ""
})

function addPet() {
    props.addPetToList();

}

function handleSubmit() {
    console.log(pet.value)
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
    max-height: 600px;
}

input {
    padding: 5px 40px 5px 10px;
    color: #000;
    border-radius: 7px;
    background-color: #ededed;
    border: 1px solid #c5c5c5;
    outline: none;
    max-height: 60px;

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

.p-dropdown, .p-inputtext {
    color: #000;
    border-radius: 7px;
    background-color: #ededed;
    border: 1px solid #c5c5c5;
    outline: none;
    width: 260px;    
}

</style>