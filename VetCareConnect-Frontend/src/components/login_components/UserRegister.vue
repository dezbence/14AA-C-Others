<template>
    <div class="backToHome">
        <img @click="back()" src="../../assets/icons/arrow_back.svg">
    </div>

    <div class="signInBackground">

        <div class="main">
            <TermsOfUse v-if="buttonTrigger" :TogglePopup="() => TogglePopup()" />
            <!-- Bal oldal -->
            <div class="formCardLeft">
                <form @submit.prevent="handleSubmit">
                    <h3>Regisztrálás gazdaként</h3>

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
                    <InputMask mask="99/999-9999" placeholder="00/000-0000" v-model="userData.phone" />

                    <label>Irányítószám:</label>
                    <InputMask mask="9999" placeholder="0000" v-model="userData.postal_code" />

                    <label>E-mail cím:</label>
                    <InputText v-model="userData.email" placeholder="bodri@gmail.com" />

                    <label>Jelszó:</label>
                    <div class="passInfo">
                        <img src="../../assets/icons/help.svg" @mouseenter="passwordInfoToggle()"
                            @mouseleave="passwordInfoToggle()" class="passwordInfo">
                        <InputText v-model="userData.password" type="password" placeholder="Bodri123" />
                    </div>

                    <div v-if="passwordError" class="error">{{ passwordError }}</div>
                    <PasswordRequirements v-if="passwordInfo"></PasswordRequirements>
                    <label>Jelszó újra:</label>
                    <InputText v-model="userData.confirm_password" type="password" placeholder="Bodri123" />
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
import { useToast } from 'vue-toastification'
import TermsOfUse from "./TermsOfUse.vue";
import PasswordRequirements from "./PasswordRequirements.vue";
import InputMask from 'primevue/inputmask';
import InputText from "primevue/inputtext";
import router from '@/router';
import userservice from "@/services/userservice";

const toast = useToast();

function back() {
    router.go(-1)
}

const buttonTrigger = ref(false);
const passwordError = ref("");
const passwordErrorAgain = ref("");
const isRegistrationFailed = ref(true);

const lowerCaseLetters = /[a-z]/g;
const upperCaseLetters = /[A-Z]/g;
const numbers = /[0-9]/g;
const emailPattern = /^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+\.[a-zA-z]{2,3}$/;

const userData = ref({
    firstName: "",
    lastName: "",
    phone: "",
    postal_code: "",
    email: "",
    password: "",
    confirm_password: "",
    terms: null
})

const registerData = ref()

const isFilled = ref();


function TogglePopup() {
    buttonTrigger.value = !buttonTrigger.value;
};

const passwordInfo = ref(false);
function passwordInfoToggle() {
    passwordInfo.value = !passwordInfo.value;
}

function handleSubmit() {
    userData.value.stamp = parseInt(userData.value.stamp);
    userData.value.postal_code = parseInt(userData.value.postal_code);
    if (userData.value.firstName == "" || userData.value.lastName == "" || userData.value.phone == "" || userData.value.postal_code == 0 || userData.value.email == "" || userData.value.password == "" || userData.value.confirm_password == "" || userData.value.terms == null) {
        isFilled.value = false;
    }
    else isFilled.value = true;
    console.log(userData.value)

    if (!isFilled.value) { toast.error("Kérem töltsön ki minden mezőt!", { position: 'top-center' }); }
    else {

        if (!emailPattern.test(userData.value.email)) {
            toast.error("Nem megfelelő email formátum!", { position: 'top-center' });
            isRegistrationFailed.value = true;
        }

        if (userData.value.password.length < 8) {
            toast.error("A jelszónak minimum 8 karakter hosszúnak kell lenni!", { position: 'top-center' })
        } else {
            if (!userData.value.password.match(lowerCaseLetters)) {
                toast.error("A jelszó nem tartalmaz kisbetűs karaktert!", { position: 'top-center' })
            } else {
                if (!userData.value.password.match(upperCaseLetters)) {
                    toast.error("A jelszó nem tartalmaz nagybetűs karaktert!", { position: 'top-center' })
                } else {
                    if (!userData.value.password.match(numbers)) {
                        toast.error("A jelszó nem tartalmaz számot!", { position: 'top-center' })
                    } else {
                        if (userData.value.password === userData.value.confirm_password) {
                            isRegistrationFailed.value = false;
                        }
                        else toast.error("Nem egyezik a két jelszó!", { position: 'top-center' }), isRegistrationFailed.value = true;
                    }
                }
            }
        }
    }


    if (!isRegistrationFailed.value) {
        console.log('form submitted')

        registerData.value = {
            name: userData.value.firstName + " " + userData.value.lastName,
            phone: userData.value.phone.replace(/[/-]/g, ''),
            email: userData.value.email,
            postal_code: userData.value.postal_code,
            password: userData.value.password,
            confirm_password: userData.value.confirm_password,
            role: 0
        }

        userservice.registerUser(registerData.value)
            .then(resp => {
                router.push('/bejelentkezes');
                toast.success('Sikeres regisztráció', { position: 'top-center' });
                console.log(resp);
            })
            .catch(err => {
                console.log(err.data);
                //errorMessages.value = err.data;
            })

    }



}
</script>
<style scoped>
.main {
    display: flex;
    align-items: center;
    justify-content: center;
    position: relative;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
    border-radius: 7px;
}

.formCardLeft {
    background-color: #fff;
    border-radius: 7px 0 0 7px;
    height: 760px;
    width: 420px;
}

.nameLabel {
    display: flex;
    gap: 79px;
}

.nameInput {
    display: flex;
    gap: 10px;
}

.nameInput input {
    width: 160px;
}

.passwordInfo {
    max-width: 20px;
    min-width: 10px;
    z-index: 50;
    cursor: pointer;
    position: absolute;
    right: 15px;
    filter: invert(30%) sepia(12%) saturate(2322%) hue-rotate(108deg) brightness(101%) contrast(80%);
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
    width: 220px;
}

.formCardRight {
    height: 760px;
    width: 340px;
    background-color: #246951;
    border-radius: 0 7px 7px 0;
    display: flex;
    padding: 50px 30px 50px 20px;
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
    padding-right: 50px;
    width: 280px;
}

.formCardRight ul li {
    margin-top: 60px;
    color: white;
    text-align: center;
    font-size: 1.2rem;
}

.formCardRight ul li span {
    font-weight: bolder;
}

form {
    background-color: white;
    height: 100%;
    text-align: left;
    padding: 50px;
    border-radius: 7px 0 0 7px;
}

h3 {
    color: #246951;
    margin-top: 0;
    margin-bottom: 15px;
    font-size: 1.6rem;
}

label {
    font-size: 0.9rem;
    color: #246951;
    font-weight: bolder;
    letter-spacing: 0;
    display: inline-block;
    margin-top: 25px;
}

input,
.password {
    display: block;
    box-sizing: border-box;
    width: 100%;
    padding: 5px 40px 5px 10px;
    color: #000;
    border-radius: 7px;
    background-color: #ededed;
    border: 1px solid #c5c5c5;
    outline: none;
    max-height: 45px;
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

.noAccount {
    text-align: left;
    margin-top: 10px;
    font-size: 0.9rem;
}

.noAccount span {
    font-weight: bold;
    margin-right: 10px;
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
    margin-top: 30px;
}

.error {
    color: #ff0062;
    margin-top: 4px;
    font-size: 0.8em;
    position: absolute;
    font-weight: 500;
}
</style>