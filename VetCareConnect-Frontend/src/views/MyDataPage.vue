<template>
    <Header></Header>
    <div class="main">
        <div class="myDatas">
            <div class="dataHeader">
                <img src="../assets/icons/profile-line.svg">
                <h1>Adataim</h1>
            </div>
            <div class="dataSheet">
                <div class="nameLabel">
                    <label>Név:</label>
                    <div class="inputEdit">
                        <InputText v-model="editedUserData.name" />
                        <img class="editData" src="../assets/icons/edit.svg">
                    </div>

                    <label>Tel. szám:</label>
                    <div class="inputEdit">
                        <InputMask mask="99/999-9999" placeholder="00/000-0000" v-model="editedUserData.phone" />
                        <img class="editData" src="../assets/icons/edit.svg">

                    </div>
                    <label>Irányítószám:</label>
                    <div class="inputEdit">
                        <InputMask mask="9999" placeholder="0000" v-model="editedUserData.postal_code" />
                        <img class="editData" src="../assets/icons/edit.svg">
                    </div>


                    <label>E-mail cím:</label>
                    <div class="inputEdit">
                        <InputText v-model="editedUserData.email" placeholder="bodri@gmail.com" />
                        <img class="editData" src="../assets/icons/edit.svg">
                    </div>


                    <!-- <label>Jelszó:</label>
                <InputText v-model="userData.password" type="password" placeholder="Bodri123" /> -->

                    <div class="submit">
                        <button @click="saveChanges()">Változások mentése</button>
                    </div>
                    <div class="profileDelete">
                        <p class="showConfirmation">Kijelentkezés és profil törlése</p>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <Footer></Footer>
</template>

<script setup>
import Header from '@/components/page_controls/Header.vue';
import Footer from '@/components/page_controls/Footer.vue';
import { ref } from 'vue';
import InputText from 'primevue/inputtext';
import InputMask from 'primevue/inputmask';
import { useToast } from 'vue-toastification';
import userservice from '@/services/userservice';
import { useUserStore } from '@/store/userstore';
import { storeToRefs } from 'pinia';

const { user } = storeToRefs(useUserStore());
const toast = useToast();

const editedUserData = ref({
    name: "",
    phone: "",
    postal_code: "",
    email: "",
})

let userData = {
    name: "",
    phone: "",
    postal_code: "",
    email: ""
}


function getUsersData() {
    userservice.getUserData(user.value.token)
        .then((resp) => {
            editedUserData.value = resp.data.data;
            userData.name = resp.data.data.name;
            userData.phone = resp.data.data.phone;
            userData.postal_code = resp.data.data.postal_code;
            userData.email = resp.data.data.email;
        });
}
getUsersData();


function saveChanges() {
    if (editedUserData.value.name == userData.name &&
        editedUserData.value.phone.replace(/[/-]/g, '') == userData.phone &&
        editedUserData.value.postal_code == userData.postal_code &&
        editedUserData.value.email == userData.email) {
        toast.error('Nem történt változás!', { position: "top-center" });
    } else {
        toast.success('Sikeres módosítás!', { position: "top-center" });
        userData.name = editedUserData.value.name;
        userData.phone = editedUserData.value.phone.replace(/[/-]/g, '');
        userData.postal_code = editedUserData.value.postal_code;
        userData.email = editedUserData.value.email;
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
}

.dataHeader img {
    width: 32px;
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
}

.dataSheet p {
    color: #C54F4F;
    font-size: 0.8rem;
    text-align: center;
    margin: 0;
}

.inputEdit {
    display: flex;
    cursor: pointer;
}


button {
    margin-top: 24px;
    background: #246951;
    font-size: 1.05rem;
    width: 100%;
    border: 0;
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