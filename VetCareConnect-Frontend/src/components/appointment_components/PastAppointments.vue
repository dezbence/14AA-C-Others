<template>
    <div class="cardsBack">
        <div class="heading">
            <h3>Bodika</h3>
            <h3>2023.02.04</h3>
        </div>
        <p>Orr plasztika</p>
        <div class="footing">
            <p>Dr. Állat Orvos</p>
            <p>,</p>
            <p>7246 Duranda, Dögkút u. 5</p>
        </div>
    </div>
</template>

<script setup>

</script>

<style scoped>
.cardsBack {
    background-color: #50B692;
    border-radius: 7px;
    height: 140px;
    width: 80%;
    padding: 20px 30px;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
    color: #fff;
    margin: 0 0 20px 40px;
}

h3 {
    margin: 0 0 10px;
}

.heading, .footing {
    display: flex;
    
}

.heading {
    justify-content: space-between;
}

.footing {
    gap: 5px;
}

@media (max-width: 600px) {
    .cardsBack {
        font-size: 0.8rem;
    }
}

</style>