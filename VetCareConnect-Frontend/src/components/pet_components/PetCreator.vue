<template>
    <div class="darkBack">
        <div class="petCreatingForm">
            <div class="close">
                <img @click="showCreator()" src="../../assets/icons/arrow_back.svg">
            </div>
            <h4>Hozza létre kedvence adatlapját!</h4>
            <form submit.pervent="handleSubmit"></form>

            <label>Kedvence neve:</label>
            <InputText v-model="pet.name"></InputText>

            <div class="officalNumbers">
                <div class="chipNum">
                    <label>Chip szám:</label>
                    <InputMask v-model="pet.chip_number" mask="999999999999999"></InputMask>
                </div>

                <div class="pedigreeNum">
                    <label>Törzskönyv száma:</label>
                    <InputMask v-model="pet.pedigree_number" mask="99999999"></InputMask>
                </div>

            </div>

            <label>Fajtajelleg:</label>
            <Dropdown v-model="pet.species" :options="species" showClear placeholder="Kérem válasszon!"
                class="petDropdown" />

            <label>Ivar:</label>
            <Dropdown v-model="gender" :options="genders" showClear placeholder="Kérem válasszon!" class="petDropdown" />

            <label>Súlya (kg):</label>

            <InputMask v-model="pet.weight" mask="99.99" placeholder="0" />
            <label>Születési dátuma:</label>
            <InputMask v-model="pet.born_date" placeholder="éééé.hh.nn" mask="9999.99.99" />
            <label>Megjegyzés:</label>
            <Textarea placeholder="Allergiák, különlegességek, stb." v-model="pet.comment" rows="4" cols="40" autoResize />

            <button @click="handleSubmit()">Létrehozás</button>

        </div>
    </div>
</template>

<script setup>
import InputText from 'primevue/inputtext';
import Dropdown from 'primevue/dropdown';
import InputMask from 'primevue/inputmask';
import Textarea from 'primevue/textarea';
import { useUserStore } from '@/store/userstore';
import { storeToRefs } from 'pinia';
import { ref } from 'vue';
import ownerservice from '../../services/ownerservice.js'


const { user } = storeToRefs(useUserStore());

const props = defineProps(['showCreator'])
const emits = defineEmits(['submit'])

const species = ['kutya', 'macska', 'hörcsög', 'nyúl', 'tengeri malac', 'görény', 'papagáj', 'teknős', 'ló', 'patkány', 'egér', 'sündisznó']
const genders = ['hím', 'nőstény']

const gender = ref();

function petGenderFormat(gender1) {
    if (gender1 == 'nőstény') return 0;
    else return 1;
}

const pet = ref({
    name: "",
    chip_number: 0,
    pedigree_number: 0,
    species: "",
    gender: 0,
    weight: 0,
    born_date: "",
    comment: "",
    owner_id: user.value.id
})




function handleSubmit() {
    emits('submit', pet)
    ownerservice.postNewPet(pet.value, user.value.token)
    .then((resp) => {
        console.log(resp);
    });
    pet.value.gender = petGenderFormat(gender.value);
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
    padding: 40px 30px 30px;
    max-height: 700px;
    position: relative;
}

input {
    padding: 5px 20px 5px 10px;
    color: #000;
    border-radius: 7px;
    background-color: #ededed;
    border: 1px solid #c5c5c5;
    outline: none;
    max-height: 50px;
}

button {
    width: 300px;
    border: none;
    border-radius: 7px;
    background-color: #50B692;
    color: white;
    padding: 5px 10px;
    margin-top: 30px;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}

label {
    margin-top: 12px;
}

.officalNumbers {
    display: flex;
    gap: 10px;
    align-items: center;

}

.chipNum,
.pedigreeNum {
    display: flex;
    flex-direction: column;
}

.pedigreeNum {
    align-items: end;
}

.chipNum label,
.pedigreeNum label {
    font-size: 0.9rem;
}

.pedigreeNum input {
    width: 110px;
    padding: 5px;
}

.chipNum input {
    width: 160px;
    padding: 5px;
}

h4 {
    padding: 20px 15px 0;
}

.close {
    position: absolute;
    top: 20px;
    left: 20px;
    cursor: pointer;
}

.close:hover {
    transform: scale(1.1);
    transition: 200ms;
}

.p-dropdown,
.p-inputtext {
    color: #000;
    border-radius: 7px;
    background-color: #ededed;
    border: 1px solid #c5c5c5;
    outline: none;
    width: 300px;
}</style>