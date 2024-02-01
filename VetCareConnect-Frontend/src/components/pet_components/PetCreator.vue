<template>
    <div class="darkBack">
        <div class="petCreatingForm">

            <div class="close">
                <img @click="showCreator()" src="../../assets/icons/arrow_back.svg">
            </div>

            <h4>Hozza létre kedvence adatlapját!</h4>
            <form submit.pervent="handleSubmit"></form>

            <div class="pages">
                <button class="page" @click="active = 0" :class="{ 'activePage': active == 0 }">1</button>
                <button class="page" @click="active = 1" :class="{ 'activePage': active == 1 }">2</button>
            </div>

            <TabView v-model:activeIndex="active">
                <TabPanel>
                    <label>Kedvence neve:</label>
                    <InputText v-model.trim="pet.name"></InputText>

                    <label>Chip szám (15 számjegy):</label>
                    <InputNumber v-model="pet.chip_number" :min="0" :max="999999999999999" :useGrouping="false" />
                    <label>Törzskönyv száma (8 számjegy):</label>
                    <InputNumber v-model="pet.pedigree_number" :min="0" :max="99999999" :useGrouping="false" />
                    <p></p>
                    <label>Fajtajelleg:</label>
                    <Dropdown v-model="pet.species" :options="species" showClear placeholder="Kérem válasszon!"
                        class="petDropdown" />

                    <label>Ivar:</label>
                    <Dropdown v-model="gender" :options="genders" showClear placeholder="Kérem válasszon!"
                        class="petDropdown" />
                    <button @click="active = 1">Tovább</button>
                </TabPanel>


                <TabPanel>
                    <label>Súlya (kg):</label>
                    <InputNumber v-model="pet.weight" placeholder="0" :useGrouping="false" :minFractionDigits="0"
                        :maxFractionDigits="2" :min="0.1" :max="999" suffix=" kg" />
                    <label>Születési dátuma:</label>
                    <Calendar class="bornDate" v-model="pet.born_date" :max-date="new Date()" dateFormat="yy.mm.dd"
                        placeholder="éééé.hh.nn" />
                    <label>Megjegyzés:</label>
                    <Textarea placeholder="Allergiák, különlegességek, stb." v-model.trim="pet.comment" rows="4" cols="40"
                        autoResize></Textarea>
                    <button @click="handleSubmit()">Létrehozás</button>
                </TabPanel>
            </TabView>

        </div>
    </div>
</template>

<script setup>
import TabView from 'primevue/tabview';
import TabPanel from 'primevue/tabpanel';
import InputText from 'primevue/inputtext';
import Dropdown from 'primevue/dropdown';
import InputNumber from 'primevue/inputnumber';
import Calendar from 'primevue/calendar';
import Textarea from 'primevue/textarea';
import { useUserStore } from '@/store/userstore';
import { storeToRefs } from 'pinia';
import { ref } from 'vue';
import ownerservice from '../../services/ownerservice.js'
import { useDateFormat } from "@vueuse/core";

const active = ref(0);

const { user } = storeToRefs(useUserStore());

const props = defineProps(['showCreator', 'submitPet']);

const species = ['kutya', 'macska', 'hörcsög', 'nyúl', 'tengeri malac', 'görény', 'papagáj', 'teknős', 'ló', 'patkány', 'egér', 'sündisznó']
const genders = ['hím', 'nőstény']
const gender = ref();

const pet = ref({
    name: "",
    chip_number: 0,
    pedigree_number: 0,
    species: "",
    gender: 0,
    weight: 0,
    born_date: "",
    comment: ""
})


function petGenderFormat(gender1) {
    if (gender1 == 'nőstény') return 0;
    else return 1;
}

function handleSubmit() {
    pet.value.born_date = useDateFormat(pet.value.born_date, "YYYY-MM-DD");
    ownerservice.postNewPet(pet.value, user.value.token)
        .then((resp) => {
            props.submitPet();
        });
    pet.value.gender = petGenderFormat(gender.value);

}
</script>

<style scoped>
.petCreatingForm {
    background-color: white;
    border-radius: 7px;
    padding: 40px 30px 30px;
    display: flex;
    align-items: center;
    flex-direction: column;
    position: relative;
}



.pages {
    display: flex;
    justify-content: center;
    align-items: center;
}

.page {
    display: flex;
    justify-content: center;
    align-items: center;
    border-radius: 100px;
    width: 38px;
    padding: 7px;
    margin: 12px;
    background-color: #50B692;
    color: white;
    cursor: pointer;
}



.activePage {
    background-color: #368267;
}

button {
    width: 300px;
    border: none;
    border-radius: 7px;
    margin-top: 20px;
    background-color: #50B692;
    color: white;
    padding: 5px 10px;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
}

label {
    margin-top: 12px;
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



@media (max-width: 514px) {
   h4 {
    font-size: 1.1rem;
   }

   .page {
    font-size: 0.8rem;
    width: 34px;
   }

   .petCreatingForm {
    width: 350px;
    padding: 30px;
   }
   
   .p-dropdown,
.p-inputtext,
.p-inputnumber,
.bornDate, button {
    width: 260px;
}
}
</style>