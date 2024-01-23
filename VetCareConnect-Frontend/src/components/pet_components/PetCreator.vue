<template>
    <div class="darkBack">
        <div class="petCreatingForm">
            <div class="close">
                <img @click="showCreator()" src="../../assets/icons/arrow_back.svg">
            </div>
            <h4>Hozza létre kedvence adatlapját!</h4>
            <form submit.pervent="handleSubmit"></form>
            <div class="">
                <Button @click="active = 0" rounded label="1" class="w-2rem h-2rem p-0" :outlined="active !== 0" />
            <Button @click="active = 1" rounded label="2" class="w-2rem h-2rem p-0" :outlined="active !== 1" />
                <TabView v-model:activeIndex="active">
                    <TabPanel :class="active ? '' : 'disabledTab'">
                        <label>Kedvence neve:</label>
                        <InputText v-model="pet.name"></InputText>

                        <label>Chip szám (15 számjegy):</label>
                        <InputNumber v-model="pet.chip_number" :min="0" :max="999999999999999" :useGrouping="false" />
                        <label>Törzskönyv száma (8 számjegy):</label>
                        <InputNumber v-model="pet.pedigree_number" :min="0" :max="99999999" :useGrouping="false" />
                        <label>Fajtajelleg:</label>
                        <Dropdown v-model="pet.species" :options="species" showClear placeholder="Kérem válasszon!"
                            class="petDropdown" />

                        <label>Ivar:</label>
                        <Dropdown v-model="gender" :options="genders" showClear placeholder="Kérem válasszon!"
                            class="petDropdown" />
                        <button>Tovább</button>
                    </TabPanel>


                    <TabPanel :class="active ? 'disabledTab' : ''">
                        <label>Súlya (kg):</label>
                        <InputNumber v-model="pet.weight" placeholder="0" :useGrouping="false" :minFractionDigits="0"
                            :maxFractionDigits="2" :min="0.1" :max="999" suffix=" kg" />
                        <label>Születési dátuma:</label>
                        <Calendar class="bornDate" v-model="pet.born_date" :max-date="new Date()" dateFormat="yy.mm.dd"
                            placeholder="éééé.hh.nn" />
                        <label>Megjegyzés:</label>
                        <Textarea placeholder="Allergiák, különlegességek, stb." v-model="pet.comment" rows="4" cols="40"
                            autoResize></Textarea>
                        <button @click="handleSubmit()">Létrehozás</button>
                    </TabPanel>
                </TabView>



            </div>



        </div>
    </div>
</template>

<script setup>
import Button from 'primevue/button';
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


const { user } = storeToRefs(useUserStore());

const props = defineProps(['showCreator', 'submitPet']);

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
    ownerservice.postNewPet(pet.value, user.value.token)
        .then((resp) => {
            console.log(pet.value);
            props.submitPet();
        });
    pet.value.gender = petGenderFormat(gender.value);

}



</script>

<style scoped>

.disabledTab {
    display: none;
}


.petCreatingForm {
    background-color: white;
    border-radius: 7px;
    padding: 40px 30px 30px;
    display: flex;
    align-items: center;
    flex-direction: column;
    position: relative;
}

.scrollForm {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    height: 600px;

}


input {
    padding: 5px 20px 5px 10px;
    border-radius: 7px;
    background-color: #ededed;
    border: 1px solid #c5c5c5;
    outline: none;
    max-height: 100px;
    width: 300px;
}

button {
    width: 300px;
    border: none;
    border-radius: 7px;
    margin-top: 20px;
    background-color: #50B692;
    color: white;
    padding: 5px 10px;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
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

.p-dropdown,
.p-inputtext,
.p-inputnumber,
.bornDate {
    border-radius: 7px;
    background-color: #ededed;
    outline: none;
    width: 300px;
}

.scrollForm::-webkit-scrollbar {
    width: 7px;
}

/* Track */
.scrollForm::-webkit-scrollbar-track {
    background: #ccc;
    border-radius: 7px;
}

/* Handle */
.scrollForm::-webkit-scrollbar-thumb {
    background: #368267;
    border-radius: 7px;
}

/* Handle on hover */
.scrollForm::-webkit-scrollbar-thumb:hover {
    background: #246951;
}
</style>