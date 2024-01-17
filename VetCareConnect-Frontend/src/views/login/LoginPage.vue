<template>
    <div class="backToHome">
        <img @click="back()" src="../../assets/icons/arrow_back.svg">
    </div>

    <div class="signInBackground">
        <div class="main">
            <div class="formLeft">
                <form @submit.prevent="handleSubmit">
                    <h3>Bejelentkezés</h3>
                    <div class="middle">
                        <div class="noAccount">
                        <span>Még nincs fiókja?</span>
                        <router-link to="/regisztracio">Új fiók készítése</router-link>
                    </div>
                    <label>E-mail cím:</label>

                    <input type="email" required v-model="loginData.email" placeholder="bodri@gmail.com" />

                    <label>Jelszó:</label>
                    <div class="passwordAndEyeIcon">
                        <img @click="passwordToggle" class="eyeIcon" draggable="false"
                            :src="isVisibilityOn ? 'src/assets/icons/visibility_on.svg' : 'src/assets/icons/visibility_off.svg'" />
                        <input :type="typeOfInput" required v-model="loginData.password" placeholder="Bodri123" />
                    </div>

                    <div class="forgotPassword">
                        <router-link to="/forgot-password">Elfelejtette a jelszavát?</router-link>
                    </div>

                    <div class="submit">
                        <button>Bejelentkezés</button>
                    </div>
                    </div>
                    
                </form>
            </div>
            <!-- Jobb oldal -->
            <div class="formRight">
                <ul>
                    <li>
                        <img id="logo" src="../../assets/images/logo.png" draggable="false" alt="" />
                    </li>
                    <li>
                        <img id="singinImage" src="../../assets/images/sign_in.png" draggable="false" alt="" />
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
import { ref } from 'vue';
import router from '@/router';
import { useUserStore } from '@/store/userstore';
import { useToast } from 'vue-toastification'
const toast = useToast();

const {login} = useUserStore();

const isVisibilityOn = ref(true);
const typeOfInput = ref("password")

function back() {
    router.go(-1)
}

const loginData = ref({
    email: "",
    password: ""
})

function handleSubmit(){
    login(loginData.value)
    .then(resp => {
        console.log(loginData.value)
        toast.success('Sikeres bejelentkezés!', {position: "top-center"});
        router.push('/')
    })
}
    


function passwordToggle() {
    isVisibilityOn.value = !isVisibilityOn.value;

    if (isVisibilityOn.value) typeOfInput.value = "password";
    else typeOfInput.value = "text";
}

</script>

<style scoped>
.main {
    display: flex;
}

.formLeft {
    background-color: #fff;
    border-radius: 7px 0 0 7px;
    height: 450px;
    width: 320px;

}

.eyeIcon {
    width: 20px;
    z-index: 50;
    cursor: pointer;
    position: absolute;
    right: 25px;
    filter: invert(33%) sepia(38%) saturate(621%) hue-rotate(108deg) brightness(93%) contrast(92%);
}

.passwordAndEyeIcon {
    position: relative;
    display: flex;
    align-items: center;
}

#logo {
    width: 150px;
}

.formRight {
    height: 450px;
    width: 260px;
    background-color: #246951;
    border-radius: 0 7px 7px 0;
    display: flex;
    padding: 40px 20px;
    align-items: center;
    justify-content: center;
}

.formRight ul {
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 0;
    list-style: none;
}

.formRight ul #singinImage {
    transform: scaleX(-1);
    padding-right: 40px;
    width: 200px;
}

.formRight ul li {
    margin-top: 44px;
    color: white;
    text-align: center;
    font-size: 1.05rem;
}

.formRight ul li span {
    font-weight: bold;
}

form {
    height: fit-content;
    text-align: left;
    padding: 30px 30px 0 30px;
}

h3 {
    color: #246951;
    margin-top: 0;
    margin-bottom: 15px;
    font-size: 1.6rem;
}

label {
    color: #246951;
    font-weight: bold;
    display: inline-block;
    margin-top: 32px;
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

.forgotPassword {
    text-align: right;
    font-size: 0.8rem;
    margin-top: 4px;
    cursor: pointer;
}

.forgotPassword a {
    text-decoration: none;
    color: #246951;
}

.noAccount {
    text-align: left;
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
    margin-top: 50px;
}

.error {
    color: #ff0062;
    margin-top: 10px;
    font-size: 0.6em;
    font-weight: bold;
}


@media (max-width: 768px) {

    label,
    input,
    select,
    p,
    span,
    button {
        font-size: 0.8rem;
    }

    .main {
        flex-direction: column-reverse;
    }

    .formRight {
        height: 180px;
        width: 450px;
        padding: 40px 50px;
        border-radius: 10px 10px 0 0;
        flex-direction: column-reverse;
    }

    .formLeft {
        border-radius: 0 0 10px 10px;
        height: 360px;
        width: 450px;
        padding: 40px 50px;
    }

    .middle {
        display: flex;
        flex-direction: column;
    }

    #logo,
    ul #singinImage {
        width: 100px;
    }
}
</style>