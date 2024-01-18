<template>
    <div class="backToHome">
        <img @click="back()" src="../../assets/icons/arrow_back.svg">
    </div>
    <div class="signInBackground">
        <div class="passwordBack">
            <form @submit.prevent="handelSubmit">

                <h3>Elfelejtette a jelszavát?</h3>
                <p>Kérjük írja be a regisztrációnál használt e-mail címét. Kapni fog egy levelet, amelyben tájékoztatjuk
                    hogyan tudja helyreállítani a jelszavát.</p>

                <label>E-mail cím:</label>

                <InputText type="email" placeholder="bodri@gmail.com"></InputText>

                <div class="rememberPassword">
                    Eszébe jutott? <router-link to="/bejelentkezes">Jelentkezzen be!</router-link>
                </div>

                <div class="submit">
                    <button>E-mail küldése</button>
                </div>


            </form>
        </div>
    </div>
</template>
<script setup>
import router from '@/router';
import { useToast } from 'vue-toastification'
import InputText from 'primevue/inputtext';
const toast = useToast();

function back() {
    router.go(-1)
}

function handelSubmit() {
    router.push('/bejelentkezes');
    toast.success('E-mail küldve!', { position: "top-center" });
}

</script>
<style scoped>
.passwordBack {
    background-color: white;
    border-radius: 10px;
    height: 420px;
    width: 400px;
    padding: 45px;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
    text-align: left;
    color: #246951;
    display: flex;
    justify-content: center;
}

h3 {
    margin: 0 0 10px;
}

p {
    font-size: 0.8rem;
    margin-bottom: 30px;
}

.passwordBack label {
    text-align: left;
    font-weight: bold;
}

button {
    background: #246951;
    width: 100%;
    border: 0;
    padding: 5px;
    color: white;
    border-radius: 7px;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
    font-family: 'Roboto', sans-serif;
    margin: 30px 0;
}

.rememberPassword {
    font-size: 0.9rem;
    text-align: right;
    margin-top: 3px;
    margin-bottom: 20px;
    cursor: pointer;
}

.rememberPassword a {
    color: #246951;
    text-decoration: none;
    font-size: 0.8rem;
}

.rememberPassword a:hover {
    text-decoration: underline;
}</style>