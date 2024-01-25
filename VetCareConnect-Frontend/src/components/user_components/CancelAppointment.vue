<template>
    <div class="appointmentCancelComponent">
        <p>Biztosan le szeretné mondani az időpontot?</p>
        <div>
            <button class="btnStyle btnNo" @click="ClickNo()">Nem</button>
            <button class="btnStyle btnYes" @click="ClickYes()">Igen</button>
        </div>
    </div>
</template>

<script setup>
import router from '@/router';
import { useUserStore } from "../../store/userstore";
import ownerservice from '@/services/ownerservice';
import { storeToRefs } from "pinia";

const { user } = storeToRefs(useUserStore());
const store = useUserStore();

const appointment = {
    id: store.cancelAppointmentId
};

function ClickNo(){
    store.show = false;
    router.go('/naptaram');
}

function ClickYes(){
    ownerservice.deleteAppointment(appointment, user.value.token).then(resp => {
        console.log(resp.data)
    });
    store.show = false;
    router.go('/naptaram');
}

</script>

<style lang="css" scoped>
.appointmentCancelComponent{
    background-color: #50B692;
    width: 500px;
    height: 250px;
    border-radius: 7px;
    color: white;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    padding: 40px;
    text-align: center;
}
.btnNo, .btnYes {
    margin: 15px;
    margin-top: 5px;
    background-color: #246951;
}

@media (max-width: 500px) {
  .appointmentCancelComponent{
    width: 300px;
  }
}
</style>