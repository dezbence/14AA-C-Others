<template>
    <div class="back-to-home">
        <img @click="back()" src="../../assets/icons/arrow_back.svg">
    </div>
    <div class="signin-background">
        <div class="orvosVagyGazda">
            <VetOrUser v-if="választott" @remove="választottE()"></VetOrUser>
        </div>
    </div>
</template>

<script setup>
import router from '@/router';
import { ref } from 'vue';
import VetOrUser from '../../components/login_components/VetOrUser.vue';


const választott = ref(true);

function választottE(activeIdx) {
    választott.value = false;
    console.log(activeIdx)
}


function back() {
    router.go(-1)
}
</script>

<style lang="css" scoped></style>