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
import { ref } from 'vue';
import mainservices from '@/services/mainservices';

const questions = ref();

mainservices.getAllQuestions().then(resp =>{
    questions.value = resp.data;
})

</script>

<style lang="css" scoped>
.questions {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    margin-bottom: 20px;
}

</style>