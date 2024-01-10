<template>
    <div class="backToHome">
        <img @click="back()" src="../../assets/icons/arrow_back.svg">
    </div>

    <div class="signInBackground">
        <div class="main">
            <div class="from-card-left">
                <form @submit.prevent="handelSubmit">
                    <h3>Bejelentkezés</h3>
                    <div class="no-account">
                        <span>Még nincs fiókja?</span>
                        <router-link to="/regisztracio">Új fiók készítése</router-link>
                    </div>
                    <label>E-mail cím:</label>

                    <input type="email" required v-model="loginData.email" placeholder="bodri@gmail.com" />

                    <label>Jelszó:</label>
                    <div class="d-flex justify-content-center align-items-center pass-eye">
                        <img @click="passwordToggle" class="toggleEye" draggable="false" id="toggleIcon" :src="isVisibilityOn ? 'src/assets/icons/visibility_on.svg' : 'src/assets/icons/visibility_off.svg'"/>
                        <input :type="typeOfInput" id="bejelPass" required v-model="loginData.password" placeholder="Bodri123" />
                    </div>

                    <div class="forgot-passw">
                        <router-link to="/forgot-password">Elfelejtette a jelszavát?</router-link>
                    </div>

                    <div class="submit">
                        <button>Bejelentkezés</button>
                    </div>
                </form>
            </div>
            <!-- Jobb oldal -->
            <div class="form-card-right">
                <ul>
                    <li>
                        <img id="logo" src="../../assets/images/logo.png" draggable="false" alt="" />
                    </li>
                    <li>
                        <img id="singin-doge" src="../../assets/images/sign_in.png" draggable="false" alt="" />
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

const isVisibilityOn = ref(true);
const typeOfInput = ref("password")

function back() {
    router.go(-1)
}

const loginData = ref({
    email: "",
    password: ""
})

function passwordToggle() {
   isVisibilityOn.value = !isVisibilityOn.value;
   
   if (isVisibilityOn.value) typeOfInput.value = "password";
   else typeOfInput.value = "text";
}

</script>

<style scoped>
.main {
    display: flex;
    align-items: center;
    justify-content: center;
}

.from-card-left {
    background-color: #fff;
    border-radius: 10px 0 0 10px;
    min-height: 50vh;
    min-width: 20vw;
}

.toggleEye {
    max-width: 20px;
    min-width: 10px;
    z-index: 50;
    cursor: pointer;
    position: absolute;
    right: 15px;
    filter: invert(33%) sepia(38%) saturate(621%) hue-rotate(108deg) brightness(93%) contrast(92%);
}

.pass-eye {
    position: relative;
}

#logo {
    width: 150px;
}

.form-card-right {
    min-height: 50vh;
    min-width: 18vw;
    background-color: #246951;
    border-radius: 0 10px 10px 0;
    display: flex;
    padding: 4vh 3vh 4vh 2vh;
    align-items: center;
    justify-content: center;
}

.form-card-right ul {
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 0;
    list-style: none;
}

.form-card-right ul #singin-doge {
    transform: scaleX(-1);
    padding-right: 5vh;
    width: 200px;
}

.form-card-right ul li {
    margin-top: 3vh;
    color: white;
    text-align: center;
    font-size: 1.05rem;
}

.form-card-right ul li span {
    font-weight: bold;
}

form {
    height: fit-content;
    text-align: left;
    padding: 2vw 3vw 0 3vw;
    border-radius: 10px 0 0 10px;
}

h3 {
    color: #246951;
    margin-top: 0;
    margin-bottom: 1.5vh;
    font-size: 1.6rem;
}

label {
    color: #246951;
    font-weight: bold;
    display: inline-block;
    margin-top: 3vh;
}

input,
select {
    display: block;
    box-sizing: border-box;
    width: 200;
    border: none;
    padding: 5px 40px 5px 10px;
    color: #000;
    border-radius: 7px;
    background-color: #ededed;
    border: 1px solid #c5c5c5;
    max-height: 4.5vh;
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
    font-family: 'Roboto', sans-serif;
}

button:hover {
    background-color: #368267;
    transition: 200ms;
}

.forgot-passw {
    text-align: right;
    font-size: 0.8rem;
    margin-top: 0.4vh;
    cursor: pointer;
}

.forgot-passw a {
    text-decoration: none;
    color: #246951;
}

.no-account {
    text-align: left;
    margin-top: 1vh;
    font-size: 0.9rem;
}

.no-account span {
    font-weight: bold;
    margin-right: 1vh;
    color: #246951;
}

.no-account a {
    text-decoration: none;
    color: #005a70;
}

.no-account a:hover {
    text-decoration: underline;
}

.submit {
    text-align: center;
    margin-top: 6vh;
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

    .form-card-right {
        height: 180px;
        width: 60vw;
        padding: 4vh 5vw;
        border-radius: 10px 10px 0 0;
        flex-direction: column-reverse;
    }

    .from-card-left {
        border-radius: 0 0 10px 10px;
        height: 360px;
        width: 60vw;
        padding: 4vh 5vw;
    }

    #logo,
    ul #singin-doge {
        width: 100px;
    }
}
</style>