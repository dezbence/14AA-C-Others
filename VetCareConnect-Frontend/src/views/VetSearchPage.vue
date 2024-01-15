<template>
    <Header></Header>
    <div>
        <h1 class="pageTitle">Állatorvosok</h1>
        <div class="searchBar">
            <div class="nameSearch">
                <label>Név:</label>
                <InputText  placeholder="Dr. Állat Orvos"/>
            </div>
            <div class="postalCodeSearch">
                <label>Irányítószám:</label>
                <InputText  placeholder="9022" />
            </div>
        </div>
    </div>

  <Footer></Footer>
</template>

<script setup>
import Header from '@/components/page_controls/Header.vue';
import Footer from '@/components/page_controls/Footer.vue';
import InputText from "primevue/inputtext";
</script>

<style lang="css" scoped>

.searchBar{
    background-color: #368267;
    height: 300px;
    width: 350px;
    padding: 40px;
    border-radius: 7px;
}
.nameSearch{
    display: flex;
    flex-direction: column;
}
.postalCodeSearch{
    display: flex;
    flex-direction: column;
}

</style>
