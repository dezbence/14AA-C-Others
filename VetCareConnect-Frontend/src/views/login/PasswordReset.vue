<template>
    <div class="backToHome">
        <img @click="back()" src="../../assets/icons/arrow_back.svg">
    </div>

    <div class="signInBackground">
        <div class="main">
            <div class="formLeft">
                <form @submit.prevent="handleSubmit">
                    <h3>Új jelszó létrehozása</h3>
                
                        
                        <label>E-mail cím:</label>
                        <InputText v-model="resetData.email" placeholder="bodri@gmail.com" />

                        <label>Új jelszó:</label>
                        <InputText type="password" v-model="resetData.new_password" placeholder="Bodri123" />

                        <label>Jelszó újra:</label>
                        <InputText type="password" v-model="resetData.confirm_password" placeholder="Bodri123" />
                        
                        <div class="forgotPassword">
                            <router-link to="/bejelentkezes">Vissza a bejelentkezéshez!</router-link>
                        </div>

                        <div>
                            <button class="btnStyle">Jelszó megváltoztatása</button>
                        </div>
                    

                </form>
            </div>
            
        </div>

    </div>
</template>

<script setup>
import InputText from 'primevue/inputtext';
import { ref } from 'vue';
import router from '@/router';
import { useToast } from 'vue-toastification'
import userservice from '@/services/userservice';
import { useUserStore } from '@/store/userstore';
const toast = useToast();
const store = useUserStore();

const isFilled = ref(false);

const isModifyFailed = ref(true);

const resetData = ref({
    email: "",
    new_password: "",
    confirm_password: ""
})

function handleSubmit() {
    if (resetData.value.email == "" || resetData.value.new_password == "" || resetData.value.confirm_password == "") isFilled.value = false;
    else isFilled.value = true;

    if (!isFilled.value) toast.error("Kérem töltsön ki minden mezőt!", { position: 'top-center' });
    else {
       
        
        if (!store.emailPattern.test(resetData.value.email)) {
            toast.error("Nem megfelelő email formátum!", { position: 'top-center' });
            isModifyFailed.value = true;
        } else if (resetData.value.new_password.length < 8) {
            toast.error("A jelszónak minimum 8 karakter hosszúnak kell lenni!", { position: 'top-center' })
        } else {
            if (!resetData.value.new_password.match(store.lowerCaseLetters)) {
                toast.error("A jelszó nem tartalmaz kisbetűs karaktert!", { position: 'top-center' })
            } else {
                if (!resetData.value.new_password.match(store.upperCaseLetters)) {
                    toast.error("A jelszó nem tartalmaz nagybetűs karaktert!", { position: 'top-center' })
                } else {
                    if (!resetData.value.new_password.match(store.numbers)) {
                        toast.error("A jelszó nem tartalmaz számot!", { position: 'top-center' })
                    } else {
                        if (resetData.value.new_password === resetData.value.confirm_password) {
                            isModifyFailed.value = false;
                        }
                        else toast.error("Nem egyezik a két jelszó!", { position: 'top-center' }), isModifyFailed.value = true;
                    }
                }
            }
        }
    }


    if (!isModifyFailed.value) {

        resetData.value = {
            email: resetData.value.email,
            password: resetData.value.new_password,
            confirm_password: resetData.value.confirm_password,
            role: 0
        }
        

        userservice.modifyPassword(resetData.value, "fniOGrcSb5O7jUFMDHZY3y9nalGPC8Mev6tq34jtKuhCRXxE22wVzzSqgTz6")
        .then(res => {
            if (res.status == 200) {
                toast.success("Sikeres jelszóváltoztatás!", { position: 'top-center' })
                router.push('/bejelentkezes')
            }
            else toast.error("Sikertelen jelszóváltoztatás!", { position: 'top-center' })
        })
    }
}

function back() {
    router.go(-1)
}

</script>

<style scoped>


.formLeft {
    background-color: #fff;
    border-radius: 7px;
    height: 450px;
    width: 380px;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);

}

form {
    height: fit-content;
    text-align: left;
    padding: 30px 30px 0 30px;
}

h3 {
    color: #246951;
    margin: 0;
    margin-bottom: 10px;
    font-size: 1.5rem;
}

label {
    color: #246951;
    font-weight: bold;
    display: inline-block;
    margin: 30px 0 3px;
}

.btnStyle {
    background: #246951;
    margin-top: 26px;
    width: 100%;
    padding: 7px;
}

.btnStyle:hover {
    background-color: #368267;
    transition: 200ms;
}

.forgotPassword {
    font-size: 0.9rem;
    text-align: right;
    margin-top: 2px;
}

.forgotPassword a {
    color: #246951;
}



@media (max-width: 400px) {

    .formLeft {
        height: 420px;
        width: 300px;
    }

    h3 {
        font-size: 1.3rem;
    }

    label {
        font-size: 0.85rem;
    }

}

</style>