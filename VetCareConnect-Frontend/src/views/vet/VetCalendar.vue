<template>
    <Header></Header>
    <div class="toDoBack">
        <div class="todaysToDo">
            <h3>{{ selectedDay }} időpontok</h3>
            <hr>
            <div class="toDos">
                <div v-for="appointmentData in appointmentsData">
                    <ToDo :appointmentData="appointmentData"></ToDo>
                </div>
            </div>
        </div>
            <Calendar  v-model="appointmentsDate" inline class="vetCalendar" :min-date="new Date()" />
            <!-- <p>{{ selectedDayFormatted }}</p> -->
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
import { useDateFormat } from "@vueuse/core";
import vetservice from "@/services/vetservice"
import { storeToRefs } from "pinia";
import { useUserStore } from "../../store/userstore";

const {user} = storeToRefs(useUserStore());

const primevue = usePrimeVue();
primevue.config.locale.dayNamesMin = ['Vasárnap', 'Hétfő', 'Kedd', 'Szerda', 'Csütörtök', 'Péntek', 'Szombat'];
primevue.config.locale.firstDayOfWeek = 1;
primevue.config.locale.monthNames = ['Január', 'Február', 'Március', 'Április', 'Május', 'Június', 'Július', 'Augusztus', 'Szeptember', 'Október', 'November', 'December'];

const appointmentsDate = ref();

let selectedDay = useDateFormat(appointmentsDate ,"YYYY. MMMM DD-i");

const selectedDayFormatted = ref(useDateFormat(appointmentsDate, "YYYY-MM-DD"));


const appointmentsData = ref();

function getVetAppointments() {
    vetservice.getVetsAppointmentToDays(user.value.token, selectedDayFormatted)
    .then((resp) => {
            appointmentsData.value = resp.data;
            console.log(selectedDayFormatted.value)
        });
}
getVetAppointments()
</script>

<style scoped>
.toDoBack {
    margin-top: 60px;
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    align-items: center;
    gap: 100px;
    padding: 0 60px;
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


@media (max-width: 1150px) {
   
}

</style>