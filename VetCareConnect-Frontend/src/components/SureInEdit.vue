<template>
    <div class="darkBack">
        <div class="back">
            <div class="front">
                <h3>Biztos benne, hogy módosítja az adatait?</h3>
                <p>Nem lehet visszavonni módosítás után!</p>
                <div class="buttons">
                    <button>Igen</button>
                    <button @click="Cancel()">Mégse</button>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import { useUserStore } from '../store/userstore';

const store = useUserStore();

function Cancel(){
    store.showAppointmentCancel(false);
}
</script>

<style scoped>

</style>