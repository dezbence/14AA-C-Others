<template>
    <div class="back">
        <h4>{{ useDateFormat(props.appointmentData.cure_date, "YYYY. MMMM DD.").value }}</h4>
        <h5>{{ appointmentData.pet_species }}</h5>
        <p> {{ appointmentData.cure_type }}</p>
    </div>

</template>

<script setup>
import { useDateFormat } from '@vueuse/core';

const props = defineProps(["appointmentData"]);
</script>

<style scoped>
.back {
    background-color: #368267;
    border-radius: 7px;
    padding: 16px;
    margin: 0 10px 10px 0;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
}
</style>