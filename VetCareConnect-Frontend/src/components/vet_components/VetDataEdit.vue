<template>
    <SureInEdit v-if="!store.show"></SureInEdit>
    <div class="main">
        <div class="myDatas">
            <div class="dataHeader">
                <img src="../../assets/icons/profile-line.svg">
                <h1>Adataim</h1>
            </div>
            <div class="dataSheet">
                <label>Név:</label>
                <InputText v-model="editedVetData.name" />

                <label>Orvosi azonosító:</label>
                <InputMask mask="9999" placeholder="0000" v-model="editedVetData.stamp" />

                <label>Telefon szám:</label>
                <InputMask mask="99/999-9999" placeholder="00/000-0000" v-model="editedVetData.phone" />

                <label>Lakcím:</label>
                <InputText placeholder="2900, Arany János u. 52." v-model="editedVetData.address" />

                <label>E-mail cím:</label>
                <InputText v-model="editedVetData.email" placeholder="bodri@gmail.com" />

                <button @click="saveChanges()">Változások mentése</button>
                <div class="profileDelete">
                    <p class="showConfirmation">Kijelentkezés és profil törlése</p>
                </div>

            </div>
        </div>

    </div>
</template>

<script setup>
import { ref } from 'vue';
import SureInEdit from '../SureInEdit.vue';
import InputText from 'primevue/inputtext';
import InputMask from 'primevue/inputmask';
import { useToast } from 'vue-toastification';
import userservice from '@/services/userservice';
import { useUserStore } from '@/store/userstore';
import { storeToRefs } from 'pinia';

const store = useUserStore();

const { user } = storeToRefs(useUserStore());
const toast = useToast();

const editedVetData = ref({
    name: "",
    phone: "",
    stamp: 0,
    address: "",
    email: ""
})

let VetData = {
    name: "",
    phone: "",
    stamp: 0,
    address: "",
    email: ""
}

function sureInEdit() {
    store.showAppointmentCancel(true);
}

function getUsersData() {
    userservice.getUserData(user.value.token)
        .then((resp) => {
            editedVetData.value = resp.data.data;
            VetData.name = resp.data.data.name;
            VetData.phone = resp.data.data.phone;
            VetData.address = resp.data.data.address;
            VetData.email = resp.data.data.email;
        });
}
getUsersData();


function saveChanges() {
    if (editedVetData.value.name == VetData.name &&
        editedVetData.value.phone.replace(/[/-]/g, '') == VetData.phone &&
        editedVetData.value.address == VetData.address &&
        editedVetData.value.stamp == VetData.stamp &&
        editedVetData.value.email == VetData.email) {
        toast.error('Nem történt változás!', { position: "top-center" });
    } else {
        sureInEdit();
        toast.success('Sikeres módosítás!', { position: "top-center" });
        VetData.name = editedVetData.value.name;
        VetData.phone = editedVetData.value.phone.replace(/[/-]/g, '');
        VetData.address = editedVetData.value.address;
        VetData.email = editedVetData.value.email;
        VetData.stamp = editedVetData.value.stamp;
    }

}
</script>

<style scoped>
.main {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 80vh;
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
    padding: 32px;
    border-radius: 0 0 7px 7px;
    height: fit-content;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}
.dataSheet p {
    color: #C54F4F;
    font-size: 0.8rem;
    text-align: center;
    margin: 0;
}

input {
    margin-bottom: 28px;
    width: 70%;
}


button {
    margin: 36px 0 12px;
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