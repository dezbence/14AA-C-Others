<template>
    <Header></Header>
    <div>
        <p class="pageTitle">Következő időpontok:</p>
    </div>
    <div class="appointments">
        <Appointment></Appointment>
        <Appointment></Appointment>
        <Appointment></Appointment>
        <Appointment></Appointment>
        <Appointment></Appointment>
        
    </div>
    <div class="buttonContainer">
        <router-link to="/idopontfoglalas">
            <button class="newAppointmentButton">
                <svg xmlns="http://www.w3.org/2000/svg" fill="white" height="35" viewBox="0 -960 960 960" width="35">
                    <path d="M440-440H200v-80h240v-240h80v240h240v80H520v240h-80v-240Z" />
                </svg>
                Új időpont foglalás
            </button>
        </router-link>
    </div>
    <Footer></Footer>
</template>

<script setup>
import { ref } from 'vue';
import Header from '../../components/page_controls/Header.vue'
import Footer from '../../components/page_controls/Footer.vue'
import Appointment from '../../components/Appointment.vue'

import mainservices from '../../services/mainservices.js'

const ownerAppointments = ref();

mainservices.getOwnerAppointments()
    .then(resp => {
        console.log(resp);
        ownerAppointments.value = resp;
    })
    .catch(err => {
        
    })



</script>


<style lang="css" scoped>
.appointments {
    display: flex;
    padding: 0;
    justify-content: center;
    align-items: center;
    flex-direction: row;
    flex-wrap: wrap;

}

.buttonContainer {
    display: flex;
    flex-direction: row;
    justify-content: center;
}

.newAppointmentButton {
    background: #50B692;
    font-size: 18px;
    font-weight: 700;
    border: 0;
    margin: 5px;
    padding: 15px;
    width: 250px;
    color: white;
    border-radius: 7px;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
    display: flex;
    align-items: center;
    justify-content: center;
    font-family: 'Roboto', sans-serif;
}

.buttonContainer a {
    text-decoration: none;
}

.newAppointmentButton svg {
    margin-bottom: 1px;
}

@media (max-width: 959px) {
    .appointments {
        flex-direction: column;
    }
}
</style>