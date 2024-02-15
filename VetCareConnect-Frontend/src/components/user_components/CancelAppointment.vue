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

const props = defineProps(['getOwnerAppointments']);

function ClickNo(){
    store.show = false;
    router.push('/naptaram');
}

function ClickYes(){
    console.log(user.value.token)
    ownerservice.deleteAppointment(appointment.id, user.value.token).then((resp) => {
        props.getOwnerAppointments();
    });
    store.show = false;
    router.push('/naptaram');
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

.appointmentCancelComponent div {
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: center;
}
.btnNo, .btnYes {
    margin: 15px;
    margin-top: 5px;
    background-color: #246951;
    padding: 10px 20px;
}

@media (max-width: 500px) {
  .appointmentCancelComponent{
    width: 300px;
  }
}
</style>