<template>
    <Header></Header>
    <div class="main">
        <div class="todaysToDo">
            <h3>Mai ügyfelek</h3>
            <hr>
            <ToDo></ToDo>
        </div>
        <div>
            <Calendar class="vetCalendar" :min-date="new Date()" />
        </div>
    </div>
    <Footer></Footer>
</template>

<script setup>
import Header from '@/components/page_controls/Header.vue';
import Footer from '@/components/page_controls/Footer.vue';
import Calendar from '@/components/Calendar.vue';
import ToDo from '@/components/vet_components/ToDo.vue'

</script>

<style scoped>
.main {
    margin-top: 80px;
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 100px;
}

.todaysToDo {
    height: 600px;
    width: 300px;
    border-radius: 7px;
    background-color: #50B692;
    padding: 24px;
    color: white;
}

.todaysToDo hr {
    border: #246951 3px solid;
}

.vetCalendar {
    width: 900px;
    height: 700px;
}
</style>