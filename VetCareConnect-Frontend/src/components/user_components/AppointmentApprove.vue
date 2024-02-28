<template>
  <div class="approve animation-scale">
    <div class="show">
      <h2 class="header">Időpont részletei</h2>
      <p>Orvos neve: {{ choosedVet.name }}</p>
      <p>Időpont: {{ choosedDate }} {{ choosedTime }}</p>
      <p>Időpont típusa: {{ choosedType.type }}</p>
      <p>Helyszín: {{ choosedVet.postal_code }} {{ choosedVet.address }}</p>
      <p>Kisállat: {{ choosedPet.name }}</p>
      <div class="buttons">
        <button class="btnStyle btnBook" @click="Back()">Vissza</button>
        <button class="btnStyle btnBook" @click="Book()" >Lefoglalom</button>
      </div>
    </div>
  </div>
</template>

<script setup>
import router from "@/router";
import ownerservice from "@/services/ownerservice";
import { storeToRefs } from "pinia";
import { useUserStore } from "@/store/userstore";

const props = defineProps({
  choosedVet: Object,
  choosedType: Object,
  choosedPet: Object,
  choosedDate: String,
  choosedTime: String,
  dateFormat: String
});

const { user } = storeToRefs(useUserStore());

const emit = defineEmits(["remove"]);
const appointmentData = {
  date: props.dateFormat + " " + props.choosedTime,
  pet_id: props.choosedPet.id,
  cure_type_id: props.choosedType.id,
  vet_id: props.choosedVet.id
}

function Back() {
  emit("remove");
}

function Book() {
  ownerservice.bookAppointment(appointmentData, user.value.token).then((resp) => {
    router.push("/naptaram");
  });

}
</script>

<style lang="css" scoped>
.approve {
  display: flex;
  align-items: center;
  justify-content: center;
}
.show {
  background-color: #50b692;
  color: white;
  height: 400px;
  width: 400px;
  padding: 40px;
  padding-left: 50px;
  padding-right: 50px;
  border-radius: 7px;
}
.btnStyle {
  background-color: #246951;
  margin: 5px;
  padding: 10px 20px;
}
.header {
  text-align: center;
  margin-bottom: 25px;
}
.buttons{
    display: flex;
    align-items: center;
    justify-content: center;
}

@media (max-width: 576px){
  .show{
    width: 300px;
    height: 450px;
  }
}
</style>
