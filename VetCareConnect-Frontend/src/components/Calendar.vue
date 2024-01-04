<template>
   
    <Calendar v-model="date" inline class="text-center" dateFormat="dd.mm.yy" />
 
</template>

<script setup>
import Calendar from 'primevue/calendar';
import { usePrimeVue } from 'primevue/config';

import { ref } from "vue";

const date = ref();
const primevue = usePrimeVue();
primevue.config.locale.firstDayOfWeek = 1;
primevue.config.locale.dayNamesMin = ['V', 'H', 'K', 'Sz', 'Cs', 'P', 'Sz'];
primevue.config.locale.monthNames = ['Január', 'Február', 'Március', 'Április', 'Május', 'Június', 'Július', 'Augusztus', 'Szeptember', 'Október', 'November', 'December'];
</script>

<style lang="css">


.p-datepicker {
 background-color: #50B692;
 color: #FFF;
 border: none;

}

.p-datepicker .p-datepicker-header {
 background-color: #50B692;
 border-bottom: 5px solid #368267;
}

.p-datepicker-month,
.p-datepicker-year {
 color: #FFF;
}

.p-datepicker-next:hover,
.p-datepicker-prev:hover {
 background-color: transparent;
}

td span:hover {
 background-color: #35a580;

}

.p-datepicker-today span {
 background-color: #368267;
 color: #FFF;
}

.p-datepicker .p-datepicker-header .p-datepicker-prev, .p-datepicker .p-datepicker-header .p-datepicker-next {
 color: #FFF;
 transform: scale(1.1);
}

.p-datepicker .p-datepicker-header .p-datepicker-prev:hover, .p-datepicker .p-datepicker-header .p-datepicker-next:hover {
 transform: scale(1.4);
 transition: ease-in-out 200ms;
}

@media (max-width: 576px) {
 .p-datepicker table td > span {
    width: 1.5rem !important;
    height: 1.5rem !important;
  } 
 
}

</style>