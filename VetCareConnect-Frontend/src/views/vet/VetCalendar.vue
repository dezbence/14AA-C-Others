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
            <Calendar dateFormat="dd.mm.yy" v-model="appointmentsDate" inline class="vetCalendar" :min-date="new Date()" />
            <p>{{ appointmentsDate }}</p>
    </div>
    <Footer></Footer>
</template>

<script setup>
import { ref } from 'vue';
import Header from '@/components/page_controls/Header.vue';
import Footer from '@/components/page_controls/Footer.vue';
import Calendar from 'primevue/calendar'
import ToDo from '@/components/vet_components/ToDo.vue'
import { usePrimeVue } from 'primevue/config';

const primevue = usePrimeVue();
primevue.config.locale.dayNamesMin = ['Vasárnap', 'Hétfő', 'Kedd', 'Szerda', 'Csütörtök', 'Péntek', 'Szombat'];
primevue.config.locale.firstDayOfWeek = 1;
primevue.config.locale.monthNames = ['Január', 'Február', 'Március', 'Április', 'Május', 'Június', 'Július', 'Augusztus', 'Szeptember', 'Október', 'November', 'December'];

const appointmentsDate = ref();

</script>

<style scoped>
.toDoBack {
    margin-top: 60px;
    display: flex;
    flex-wrap: wrap;
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
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
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

.vetCalendar{
    width: 1000px;
    height: 700px;
    border-radius: 7px;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
}

</style>