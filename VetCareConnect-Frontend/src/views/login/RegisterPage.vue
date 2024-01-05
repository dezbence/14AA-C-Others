<template>
    <div class="back-to-home">
        <img @click="back()" src="../../assets/icons/arrow_back.svg">
    </div>
    <div class="signin-background">
        <div class="orvosVagyGazda">
            <VetOrUser v-if="választott" @remove="választottE"></VetOrUser>
        </div>
        <div>
            
        </div>
    </div>
</template>

<script setup>
import router from '@/router';
import { ref } from 'vue';
import VetOrUser from '../../components/login_components/VetOrUser.vue';


const választott = ref(true);
const chosedType = ref("");

function választottE(index) {
    if (index.value == 0) chosedType.value = "gazda";
    else if (index.value == 1) chosedType.value = "orvos";
    else chosedType.value = "hiba";
    választott.value = false;
    console.log(chosedType.value)
}


function back() {
    router.go(-1)
}
</script>

<style lang="css" scoped></style>