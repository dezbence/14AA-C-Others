<template>
    <div class="petDeleteComponent">
        <p>Biztosan kitörli a kisállatát?</p>
        <div>
            <button class="btnStyle btnYes" @click="ClickYes()">Igen</button>
            <button class="btnStyle btnNo" @click="ClickNo()">Nem</button>
        </div>
    </div>
</template>

<script setup>
import router from '@/router';
import { useUserStore } from "../../store/userstore";
import ownerservice from '@/services/ownerservice';
import { storeToRefs } from 'pinia';

const store = useUserStore();
const { user } = storeToRefs(useUserStore());

function ClickNo() {
    store.petDelete = false;
    router.push('/kedvenceim');

}

function ClickYes() {
    store.petDelete = false;
    ownerservice.deletePet(store.deletePetId, user.value.token)
    .then((resp) => {
        store.getPets();
    });
    router.push('/kedvenceim');
}

</script>

<style lang="css" scoped>
.petDeleteComponent {
    background-color: #50B692;
    width: 500px;
    height: 250px;
    border-radius: 7px;
    color: white;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    padding: 40px;
    text-align: center;
}

.btnNo, .btnYes {
    margin: 15px;
    margin-top: 5px;
    background-color: #246951;
}

@media (max-width: 500px) {
    .petDeleteComponent {
        width: 300px;
    }
}
</style>