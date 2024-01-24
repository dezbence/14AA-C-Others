<template>
  <div class="nextAppointmentCard" v-if="!showCancelComponent">
    <p class="title">{{ pet }} {{ title }}</p>
    <p class="vet">Orvos: {{ vet }}</p>
    <p class="vet">Helyszín: {{ postalCode }} {{ vetAddress }}</p>
    <p class="date">{{ formattedDate }}</p>

    <button class="btnStyle btnCancelAppointment" @click="Cancel()" v-if="!isOld">Időpont lemondása</button>
  </div>
</template>

<script setup>
import CancelAppointment from '../components/user_components/CancelAppointment.vue';
import { useDateFormat } from "@vueuse/core";;

const props = defineProps({
  pet: String,
  title: String,
  vet: String,
  vetAddress: String,
  postalCode: String,
  date: String,
  isOld: Boolean
});


const formattedDate = useDateFormat(props.date, "YYYY. MMMM DD. HH:mm");

function Cancel(){
  
}

</script>

<style scoped>
.nextAppointmentCard {
  border-radius: 7px;
  background-color: #50b692;
  justify-self: center;
  width: 300px;
  padding: 15px;
  padding-left: 25px;
  margin: 10px;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}

p {
  color: white;
  margin-bottom: 5px;
}

.title {
  font-weight: 700;
  font-size: 18px;
  margin: 0;
}

.vet {
  font-size: 12px;
}

.date {
  font-weight: 700;
  font-size: 20px;
  margin: 5px 0px 0px 0px;
}
.btnCancelAppointment{
  background-color: #246951;
  margin-top: 15px;
}

@media (min-width: 1260px) {
  .nextAppointmentCard {
    width: 400px;
  }
  .title {
    font-size: 24px;
  }

  .vet {
    font-size: 15px;
  }

  .date {
    font-size: 25px;
  }
}
</style>
