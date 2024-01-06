<template>
    <div class="card">
        <p class="title">Bodri veszettség oltás</p>
        <p class="vet">Dr. Állat Orvos 7623 Város, Utca 6.</p>
        <p class="date">2023. október 7. 14:30</p>
    </div>
</template>

<script setup>

</script>

<style lang="css" scoped>

.card {
        
        border-radius: 7px;
        background-color: #50B692;
        justify-self: center;
        width: 300px;
        padding: 15px;
        padding-left: 25px;
        margin: 10px;
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}

p {
        color: white;
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

@media (min-width: 1260px) {

.card {
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