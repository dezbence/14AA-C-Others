<template>
        <SureInEdit v-if="!store.showSure" @cancel="cancelEditing" @editDatas="editDatas"></SureInEdit>
    <div class="main">
        <div class="myDatas">
            <div class="dataHeader">
                <img src="../../assets/icons/profile-line.svg">
                <h1>Adataim</h1>
            </div>
            <div class="dataSheet">
                <label>Név:</label>
                <InputText v-model="editedUserData.name" />

                <label>Telefon szám:</label>
                <InputMask mask="99/999-9999" placeholder="00/000-0000" v-model="editedUserData.phone" />

                <label>Irányítószám:</label>
                <InputMask mask="9999" placeholder="0000" v-model="editedUserData.postal_code" />

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

const editedUserData = ref({
    name: "",
    phone: "",
    postal_code: ""
})

let userData = {
    name: "",
    phone: "",
    postal_code: ""
}

function cancelEditing() {
    editedUserData.value.name = userData.name;
    editedUserData.value.phone = userData.phone;
    editedUserData.value.postal_code = userData.postal_code;
    store.showSureInEdit(true);
    toast.warning('Módosítások elvetve!', { position: "top-center" });
}

function editDatas() {
    store.showSureInEdit(true);
    toast.success('Sikeres módosítás!', { position: "top-center" });
    // post datas
    userservice.modifyUserData(editedUserData.value, user.value.token)
        .then((resp) => {
            user.name = editedUserData.value.name;
            userData.name = editedUserData.value.name;
            userData.phone = editedUserData.value.phone;
            userData.postal_code = editedUserData.value.postal_code;
        });
}

store.showSureInEdit(true);
function sureInEdit() {
    store.showSureInEdit(false);
}

function getUsersData() {
    userservice.getUserData(user.value.token)
        .then((resp) => {
            editedUserData.value = resp.data.data;
            userData.name = resp.data.data.name;
            userData.phone = resp.data.data.phone;
            userData.postal_code = resp.data.data.postal_code;
        });
}
getUsersData();



function saveChanges() {
    console.log(editedUserData.value)
    console.log(userData)
    if (editedUserData.value.name === userData.name &&
        editedUserData.value.phone.replace(/[/-]/g, '') === userData.phone.replace(/[/-]/g, '') &&
        editedUserData.value.postal_code === userData.postal_code) {
        toast.error('Nem történt változás!', { position: "top-center" });
    } else {
        sureInEdit();
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

label {
    font-weight: 600;
    color: #246951;
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