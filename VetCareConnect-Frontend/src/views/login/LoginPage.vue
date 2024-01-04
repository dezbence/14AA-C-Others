<template>

    <div class="back-to-home">
        <img @click="back()" src="../../assets/icons/arrow_back.svg">
    </div>

    <div class="signin-background">
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