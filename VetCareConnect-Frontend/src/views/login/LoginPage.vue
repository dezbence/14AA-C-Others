<template>

    <div class="backToHome">
        <img @click="back()" src="../../assets/icons/arrow_back.svg">
    </div>

    <div class="signInBackground">
        Bejelentkezés
    </div>

</template>

<script setup>
import router from '@/router';

function back() {
    router.go(-1)
}
</script>

<style lang="css" scoped>

</style>