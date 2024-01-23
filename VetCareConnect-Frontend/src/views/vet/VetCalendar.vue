<template>
    <Header></Header>
    <div class="toDoBack">
        <div class="todaysToDo">
            <h3>Mai ügyfelek</h3>
            <hr>
            <div class="toDos">
                <ToDo></ToDo>
                <ToDo></ToDo>
                <ToDo></ToDo>
                <ToDo></ToDo>
                <ToDo></ToDo>
                <ToDo></ToDo>
                <ToDo></ToDo>
                <ToDo></ToDo>
                <ToDo></ToDo>
                <ToDo></ToDo>
                <ToDo></ToDo>
                <ToDo></ToDo>
                <ToDo></ToDo>
                <ToDo></ToDo>
                <ToDo></ToDo>
                <ToDo></ToDo>
                <ToDo></ToDo>
                <ToDo></ToDo>
                <ToDo></ToDo>
                <ToDo></ToDo>
                <ToDo></ToDo>
                <ToDo></ToDo>
                <ToDo></ToDo>
                <ToDo></ToDo>
                <ToDo></ToDo>
                <ToDo></ToDo>
            </div>
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
.toDoBack {
    margin-top: 80px;
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 100px;
}

.todaysToDo {
    height: 700px;
    width: 400px;
    border-radius: 7px;
    background-color: #50B692;
    padding: 24px;
    color: white;
}

.todaysToDo hr {
    border: #368267 3px solid;
    opacity: 1;
    border-radius: 50px;
}

.todaysToDo .toDos {
    overflow-y: scroll;
    max-height: 580px;
}

/* width */
.toDos::-webkit-scrollbar {
  width: 7px;
}

/* Track */
.toDos::-webkit-scrollbar-track {
  background: #ccc;
  border-radius: 7px;
}

/* Handle */
.toDos::-webkit-scrollbar-thumb {
  background: #368267;
  border-radius: 7px;
}

/* Handle on hover */
.toDos::-webkit-scrollbar-thumb:hover {
  background: #246951;
}

.vetCalendar {
    width: 1000px;
    height: 700px;
}
</style>