<template>
    <Header></Header>
    <h1 class="pageTitle">Gyakran ismételt kérdések</h1>
    <div class="questions" v-for="question in questions">
        <questionComponent :question="question.question" :answer="question.answer"></questionComponent>
    </div>
    <Footer></Footer>
</template>

<script setup>
import Header from '@/components/page_controls/Header.vue';
import Footer from '@/components/page_controls/Footer.vue';
import questionComponent from '@/components/Question.vue'

const questions = [
    { question: "asd", answer: "ldsfdsfsdcsísídsdc" },
    { question: "esfdsdf", answer: "scscffsdcsdcsdcscscscscdsdcsdcs" },
    { question: "asdfssd", answer: "dsaddasdsdasdadadadadasdsfsdv" },
    { question: "assfssfeffed", answer: "cfdsfcsddsvsdvsdsdfsd" }
];
</script>

<style lang="css" scoped>
.questions {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    margin-bottom: 20px;
}

</style>