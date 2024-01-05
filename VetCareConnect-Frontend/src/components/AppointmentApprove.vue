<template>
  <div class="approve">
    <div class="show">
      <h2 class="header">Időpont részletei</h2>
      <p>Orvos neve: {{}}</p>
      <p>Időpont: {{}}</p>
      <p>Helyszín: {{}}</p>
      <p>Kisállat: {{}}</p>
      <div class="buttons">
        <button class="btnStyle btnBook" @click="Back()">Vissza</button>
        <button class="btnStyle btnBook" @click="Book()" >Lefoglalom</button>
      </div>
    </div>
  </div>
</template>

<script setup>
import router from "@/router";
import { defineEmits } from "vue";

// @click="showSuccess"
// import { useToast } from "primevue/usetoast";
// const toast = useToast();

// const showSuccess = () => {
//     toast.add({ severity: 'success', summary: 'Success Message', detail: 'Message Content', life: 3000 });
// };

const emit = defineEmits(["remove"]);

function Back() {
  emit("remove");
}

function Book() {
  router.push("/naptaram");
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
  height: 350px;
  width: 400px;
  padding: 40px;
  padding-left: 50px;
  padding-right: 50px;
  border-radius: 7px;
}
.btnStyle {
  background-color: #246951;
  margin: 5px;
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
</style>
