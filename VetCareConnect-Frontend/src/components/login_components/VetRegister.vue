<template>
    <div class="backToHome">
        <img @click="back()" src="../../assets/icons/arrow_back.svg">
    </div>

    <div class="signInBackground">

        <div class="main">
            <!-- <TermsOfUse v-if="buttonTrigger" :TogglePopup="() => TogglePopup()" /> -->
            <!-- Bal oldal -->
            <div class="formCardLeft">
                <form @submit.prevent="handelSubmit">
                    <h3>Regisztrálás orvosként</h3>
                    <div class="noAccount">
                        <span>Már van fiókja?</span>
                        <router-link to="/bejelentkezes">Bejelentkezés</router-link>
                    </div>
                    <div class="nameLabel">
                        <label>Vezetéknév:</label>
                        <label>Keresztnév:</label>
                    </div>
                    <div class="nameInput">
                        <InputText v-model="userData.firstName" />
                        <InputText v-model="userData.lastName" />
                    </div>
                    <label>Tel. szám:</label>
                    <InputMask mask="99/999-9999" placeholder="99/999-9999" v-model="userData.fon"/>
                    <label>E-mail cím:</label>
                    <InputText v-model="userData.email" placeholder="bodri@gmail.com" />
                    <!-- <input type="email" placeholder="bodri@gmail.com" v-model="userData.email" /> -->
                    <label>Jelszó:</label>
                    <!-- <div class="passInfo">
                        <svg @mouseenter="passwordInfoToggle()" @mouseleave="passwordInfoToggle()" class="passwordInfo"
                            xmlns="http://www.w3.org/2000/svg" fill="#246951" height="24" viewBox="0 -960 960 960"
                            width="24">
                            <path
                                d="M478-240q21 0 35.5-14.5T528-290q0-21-14.5-35.5T478-340q-21 0-35.5 14.5T428-290q0 21 14.5 35.5T478-240Zm-36-154h74q0-33 7.5-52t42.5-52q26-26 41-49.5t15-56.5q0-56-41-86t-97-30q-57 0-92.5 30T342-618l66 26q5-18 22.5-39t53.5-21q32 0 48 17.5t16 38.5q0 20-12 37.5T506-526q-44 39-54 59t-10 73Zm38 314q-83 0-156-31.5T197-197q-54-54-85.5-127T80-480q0-83 31.5-156T197-763q54-54 127-85.5T480-880q83 0 156 31.5T763-763q54 54 85.5 127T880-480q0 83-31.5 156T763-197q-54 54-127 85.5T480-80Z" />
                        </svg>
                        <input v-model="userData.password" type="password" placeholder="Bodri123" />
                    </div> -->
                    <Password class="password" v-model="userData.password" :class="problem ? 'p-invalid' : ''">
                        <template #footer>
                            <p class="mt-4 mb-1">Kötelező</p>
                            <ul class="pl-2 ml-2 mt-0" style="line-height: 1.5">
                                <li>legalább egy kisbetű</li>
                                <li>legalább egy nagybetű</li>
                                <li>legalább egy szám</li>
                                <li>minimum 8 karakter</li>
                            </ul>
                        </template>
                    </Password>
                    <div v-if="passwordError" class="error">{{ passwordError }}</div>
                    <!-- <PasswordRequirements v-if="passwordInfo"></PasswordRequirements> -->
                    <label>Jelszó újra:</label>
                    <Password class="password" v-model="userData.passwordAgain" placeholder="Bodri123" />
                    <div v-if="passwordErrorAgain" class="error">{{ passwordErrorAgain }}</div>
                    <div class="terms">
                        <input type="checkbox" v-model="userData.terms" />
                        <label id="terms" @click="TogglePopup()">Elfogadom a felhasználási feltételeket!</label>
                    </div>
                    <div class="submit">
                        <button>Regisztráció</button>
                    </div>
                </form>
            </div>
            <!-- Jobb oldal -->
            <div class="formCardRight">
                <ul>
                    <li>
                        <img id="logo" src="../../assets/images/logo.png" />
                    </li>
                    <li>
                        <img id="singInDog" src="../../assets/images/sign_in.png" />
                    </li>
                    <li>
                        <p>
                            <span>Minden</span> állat <br />
                            megérdemli a <span>legjobbat!</span>
                        </p>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</template>
<script setup>
import { ref } from "vue";
import TermsOfUse from "./TermsOfUse.vue";
import InputMask from 'primevue/inputmask';
import InputText from "primevue/inputtext";
import Password from 'primevue/password';

import router from '@/router';
import PasswordRequirements from "./PasswordRequirements.vue";
import { usePrimeVue } from 'primevue/config';

const primevue = usePrimeVue();




function back() {
    router.go(-1)
}

const buttonTrigger = ref(false);
const passwordError = ref("");
const passwordErrorAgain = ref("");
const problem = ref(true);

const lowerCaseLetters = /[a-z]/g;
const upperCaseLetters = /[A-Z]/g;
const numbers = /[0-9]/g;

const userData = ref({
    firstName: "",
    lastName: "",
    fon: "",
    email: "",
    password: "",
    passwordAgain: "",
    terms: false
})

function TogglePopup() {
    buttonTrigger.value = !buttonTrigger.value;
};

const passwordInfo = ref(false);
function passwordInfoToggle() {
    passwordInfo.value = !passwordInfo.value;
}

function handelSubmit() {
    if (userData.value.password.length < 8) {
        passwordError.value = "Minimum 8 karakter hosszúnak kell lenni!";
    } else {
        passwordError.value = "";
        if (!userData.value.password.match(lowerCaseLetters)) {
            passwordError.value = "Nem tartalmaz kisbetűs karaktert!";
        } else {
            passwordError.value = "";
            if (!userData.value.password.match(upperCaseLetters)) {
                passwordError.value = "Nem tartalmaz nagybetűs karaktert!";
            } else {
                passwordError.value = "";
                if (!userData.value.password.match(numbers)) {
                    passwordError.value = "Nem tartalmaz számot!";
                } else {
                    passwordError.value = "";
                    if (userData.value.password === userData.value.passwordAgain) {
                        passwordErrorAgain.value = "";
                        problem.value = false;
                    }
                    else passwordErrorAgain.value = "Nem egyezik a két jelszó!", problem.value = true;
                }
            }
        }
    }

    if (!problem.value) {
        console.log('form submitted')
        console.log(userData.value)
    }



}
</script>
<style scoped>
body {
    overflow-y: hidden;
    margin: 0;
}

.main {
    display: flex;
    align-items: center;
    justify-content: center;
    position: relative;
}

.formCardLeft {
    background-color: #fff;
    border-radius: 10px 0 0 10px;
    min-height: 80vh;
    min-width: 22vw;
}

.nameLabel {
    display: flex;
    gap: 10.5vh;
}

.nameInput {
    display: flex;
    gap: 1vh;
}

.nameInput input[type="text"] {
    max-width: 18vh;
}

.passwordInfo {
    max-width: 20px;
    min-width: 10px;
    z-index: 50;
    cursor: pointer;
    position: absolute;
    right: 15px;
}

#terms {
    cursor: pointer;
}

#terms:hover {
    text-decoration: underline;
}

.passInfo {
    position: relative;
    display: flex;
    justify-content: center;
    align-items: center;
}

#logo {
    width: 22vh;
}

.formCardRight {
    min-height: 80vh;
    min-width: 18vw;
    background-color: #246951;
    border-radius: 0 10px 10px 0;
    display: flex;
    padding: 5vh 3vh 5vh 2vh;
    align-items: center;
    justify-content: center;
}

.formCardRight ul {
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 0;
    list-style: none;
}

.formCardRight ul #singInDog {
    transform: scaleX(-1);
    padding-right: 5vh;
    width: 28vh;
}

.formCardRight ul li {
    margin-top: 6vh;
    color: white;
    text-align: center;
    font-size: 1.2rem;
}

.formCardRight ul li span {
    font-weight: bolder;
}

form {
    background-color: white;
    height: 36vh;
    text-align: left;
    padding: 5vh;
    border-radius: 10px 0 0 10px;
}

h3 {
    color: #246951;
    margin-top: 0;
    margin-bottom: 1.5vh;
    font-size: 1.6rem;
}

label {
    font-size: 0.9rem;
    color: #246951;
    font-weight: bolder;
    letter-spacing: 0;
    display: inline-block;
    margin-top: 3vh;
}

input, .password {
    display: block;
    box-sizing: border-box;
    width: 100%;
    padding: 5px 40px 5px 10px;
    color: #000;
    border-radius: 5px;
    background-color: #ededed;
    border: 1px solid #c5c5c5;
    outline: none;
    max-height: 4.5vh;
}

input[type=text]:focus {
    border: #b7e0b8 3px solid;
}

input[type="checkbox"] {
    display: inline-block;
    width: 16px;
    margin: 0 10px 0 0;
    position: relative;
    top: 2px;
}

input[type="checkbox"]:checked {
    accent-color: #246951;
}

button {
    background: #246951;
    font-size: 1.05rem;
    width: 100%;
    border: 0;
    padding: 5px;
    color: white;
    border-radius: 5px;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
    display: flex;
    align-items: center;
    justify-content: center;
}

button:hover {
    background-color: #368267;
    transition: 200ms;
}

.noAccount {
    text-align: left;
    margin-top: 1vh;
    font-size: 0.9rem;
}

.noAccount span {
    font-weight: bold;
    margin-right: 1vh;
    color: #246951;
}

.noAccount a {
    text-decoration: none;
    color: #005a70;
}

.noAccount a:hover {
    text-decoration: underline;
}

.submit {
    text-align: center;
    margin-top: 6vh;
}

.error {
    color: #ff0062;
    margin-top: 4px;
    font-size: 0.8em;
    position: absolute;
    font-weight: 500;
}
</style>