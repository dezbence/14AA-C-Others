<template>
    <Header></Header>
    <h1 class="pageTitle">Gyakran ismételt kérdések</h1>
    <div class="questions">
        <questionComponent></questionComponent>
    </div>
    <Footer></Footer>
</template>

<script setup>
import Header from '@/components/page_controls/Header.vue';
import Footer from '@/components/page_controls/Footer.vue';
import questionComponent from '@/components/Question.vue'
</script>

<style lang="css" scoped>
.questions {
    display: flex;
    align-items: center;
    justify-content: center;
}

</style>