<template>
    <SureInEdit v-if="store.showSure" @cancel="cancelEditing" @editDatas="editDatas"></SureInEdit>
    <div class="main">
        <button @click="back()" class="btnStyle btnBack"><img style="filter: invert(100);"
                src="../../assets/icons/arrow_back.svg">Vissza</button>
        <div>
            <div class="dataHeader">
                <img src="../../assets/icons/profile-line.svg">
                <h1>{{ editedPetData.name }} adatai</h1>
            </div>
            <div class="dataSheet">
                <label>Név:</label>
                <InputText v-model="editedPetData.name"></InputText>
                <label>Chip szám (15 számjegy):</label>
                <InputMask v-model="editedPetData.chip_number" mask="999999999999999"/>
                <label>Törzskönyv száma (8 számjegy):</label>
                <InputMask v-model="editedPetData.pedigree_number" mask="99999999"/>
                <label>Fajtajelleg:</label>
                <Dropdown v-model="editedPetData.species" :options="species" showClear placeholder="Kérem válasszon!"
                    class="petDropdown" />
                <label>Ivar:</label>
                <Dropdown v-model="editedPetData.gender" :options="genders" showClear placeholder="Kérem válasszon!"
                    class="petDropdown" />
                <label>Súlya (kg):</label>
                <InputNumber v-model="editedPetData.weight" placeholder="0" :minFractionDigits="0" :maxFractionDigits="2"
                    :min="0.1" :max="999" suffix=" kg" :useGrouping="false" />
                <label>Születési dátuma:</label>
                <Calendar v-model="editedPetData.born_date" class="bornDate" :max-date="new Date()" dateFormat="yy.mm.dd"
                    placeholder="éééé.hh.nn" />
                <label>Megjegyzés:</label>
                <Textarea v-model="editedPetData.comment" placeholder="Allergiák, különlegességek, stb." rows="4" cols="40"
                    autoResize></Textarea>
                <button @click="saveChanges()" class="btnStyle">Változások mentése</button>

            </div>
        </div>
        <div class="placeholder"></div>
    </div>
</template>

<script setup>
import SureInEdit from '../SureInEdit.vue';
import InputText from 'primevue/inputtext';
import InputNumber from 'primevue/inputnumber';
import InputMask from 'primevue/inputmask';
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
    name: store.editPet.name,
    species: store.editPet.species,
    gender: petGender,
    weight: store.editPet.weight,
    born_date: store.editPet.born_date,
    comment: store.editPet.comment,
    chip_number: store.editPet.chip_number,
    pedigree_number: store.editPet.pedigree_number
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

store.showSureInEdit(false);

function back() {
    store.showPetEdit(false);

}
function cancelEditing() {
    store.showSureInEdit(false);
    store.showPetEdit(false)
    toast.warning('Módosítások elvetve!', { position: "top-center" });
}



function saveChanges() {
    if (editedPetData.value.name == "" || editedPetData.value.chip_number == 0 || editedPetData.value.pedigree_number == 0 || editedPetData.value.species == null || editedPetData.value.gender == null || editedPetData.value.weight == 0 || editedPetData.value.born_date == null) {
        toast.error("Kérem töltsön ki minden mezőt!", { position: 'top-center' });
        console.log(editedPetData.value)
    } else {
        store.showSureInEdit(true);
        console.log(editedPetData.value)
    }
}

function editDatas() {
    store.showSureInEdit(false);
    store.showPetEdit(false)
    toast.success('Sikeres módosítás!', { position: "top-center" });
    // post datas
}
    
   

</script>

<style scoped>
.main {
    display: flex;
    justify-content: center;
    align-items: start;
    height: 80vh;
    margin-top: 40px;
}



.dataHeader {
    width: 500px;
}

.dataSheet {
    width: 500px;
    padding: 30px 80px;
}

.placeholder {
    width: 120px;
    margin-left: 30px;
    background-color: white;
}

label {
    font-weight: 500;
    color: #246951;
    margin: 10px 0 2px;
}

.btnStyle {
    margin: 15px 0 12px;
    background: #246951;
    width: 100%;
}

.btnBack {
    background-color: #246951;
    width: 120px;
    margin-right: 30px;
}

input,
textarea,
.p-dropdown,
.p-inputtext,
.p-inputnumber,
.bornDate,
.saveChanges {
    width: 100%;
}

button:hover {
    background-color: #368267;
    transition: 200ms;
}</style>