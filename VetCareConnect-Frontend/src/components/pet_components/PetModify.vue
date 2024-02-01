<template>
    <!-- <SureInEdit v-if="!store.showSure" @cancel="cancelEditing" @editDatas="editDatas"></SureInEdit> -->
    <div class="main">
        <div>
            <div class="dataHeader">
                <img src="../../assets/icons/profile-line.svg">
                <h1>{{ petData.name }} adatai</h1>
            </div>
            <div class="dataSheet">
                <label>Név:</label>
                <InputText v-model="petData.name"></InputText>
                <label>Chip szám (15 számjegy):</label>
                <InputNumber v-model="petData.chip_number" :min="0" :max="999999999999999" />
                <label>Törzskönyv száma (8 számjegy):</label>
                <InputNumber v-model="petData.pedigree_number" :min="0" :max="99999999" />
                <label>Fajtajelleg:</label>
                <Dropdown v-model="petData.species" :options="species" showClear placeholder="Kérem válasszon!" class="petDropdown" />
                <label>Ivar:</label>
                <Dropdown v-model="petData.gender" :options="genders" showClear placeholder="Kérem válasszon!"
                    class="petDropdown" />
                <label>Súlya (kg):</label>
                <InputNumber v-model="petData.weight" placeholder="0" :minFractionDigits="0"
                    :maxFractionDigits="2" :min="0.1" :max="999" suffix=" kg" />
                <label>Születési dátuma:</label>
                <Calendar v-model="petData.born_date" class="bornDate"  :max-date="new Date()" dateFormat="yy.mm.dd"
                    placeholder="éééé.hh.nn" />
                <label>Megjegyzés:</label>
                <Textarea v-model="petData.comment" placeholder="Allergiák, különlegességek, stb." rows="4" cols="40"
                    autoResize></Textarea>
                <button @click="saveChanges()">Változások mentése</button>

            </div>
        </div>

    </div>
</template>

<script setup>
// import SureInEdit from '../SureInEdit.vue';
import InputText from 'primevue/inputtext';
import InputNumber from 'primevue/inputnumber';
import Dropdown from 'primevue/dropdown';
import Textarea from 'primevue/textarea';
import Calendar from 'primevue/calendar';

import { useUserStore } from '@/store/userstore';
import { useToast } from 'vue-toastification';
import { storeToRefs } from 'pinia';
import { ref } from 'vue';

const store = useUserStore();
const { user } = storeToRefs(useUserStore());
const toast = useToast();

const species = ['kutya', 'macska', 'hörcsög', 'nyúl', 'tengeri malac', 'görény', 'papagáj', 'teknős', 'ló', 'patkány', 'egér', 'sündisznó'];
const genders = ['hím', 'nőstény'];

const petGender = store.editPet.gender == 0 ? 'nőstény' : 'hím';

const editedPetData = ref({
    name: "",
    species: "",
    gender: "",
    weight: "",
    born_date: "",
    comment: "",
    chip_number: "",
    pedigree_number: ""
})

let petData = {
    name: store.editPet.name,
    species: store.editPet.species,
    gender: petGender,
    weight: store.editPet.weight,
    born_date: store.editPet.born_date,
    comment: store.editPet.comment,
    chip_number: store.editPet.chip_number,
    pedigree_number: store.editPet.pedigree_number
}

// function cancelEditing() {

// }

// function editDatas() {

// }

// function sureInEdit() {

// }


// function saveChanges() {

// }

</script>

<style scoped>
.main {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 80vh;
    margin-top: 40px;
}

.dataHeader {
    background-color: #246951;
    color: white;
    display: flex;
    border-radius: 7px 7px 0 0;
    justify-content: center;
    align-items: center;
    padding: 18px 0;
    gap: 12px;
    width: 600px;
}

.dataHeader img {
    width: 40px;
}

.dataHeader h1 {
    margin: 0;
}

.dataSheet {
    background-color: white;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
    padding: 15px;
    border-radius: 0 0 7px 7px;
    height: fit-content;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}

.dataSheet label {
    margin-top: 10px;
}

label {
    font-weight: 600;
    color: #246951;
}




button {
    margin: 15px 0 12px;
    background: #246951;
    font-size: 1.05rem;
    border: 0;
    width: 70%;
    padding: 5px;
    color: white;
    border-radius: 7px;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
    display: flex;
    align-items: center;
    justify-content: center;
}

button:hover {
    background-color: #368267;
    transition: 200ms;
}
</style>