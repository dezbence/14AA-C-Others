<template>
    <Header></Header>
    <h1 class="pageTitle">Állatorvosok</h1>
    <div class="page">
        <div class="searchBar">
            <div class="nameSearch">
                <label>Név:</label>
                <InputText  placeholder="Dr. Állat Orvos"/>
            </div>
            <div class="postalCodeSearch">
                <label>Irányítószám:</label>
                <InputText  placeholder="9022" />
            </div>
            <div class="addressSearch">
                <label>Cím:</label>
                <InputText  placeholder="Komárom" />
            </div>
            <div class="btnBox">
                <button class="btnStyle">Keresés</button>
            </div>
        </div>
        <div class="searchResults">
            <div v-for="vet in vets">
                <div class="vetsBox">
                    <div>
                        <h3 class="vetName">{{ vet.name }} </h3>
                        <label><strong>Email:</strong> {{ vet.email  }}</label> <br>
                        <label><strong>Telefonszám: </strong>{{ vet.phone }} </label> <br>
                        <label><strong>Cím: </strong>{{ vet.postal_code  }} </label>
                    </div>
                    <div>
                        <button class="btnStyle" @click="book()">Időpontot foglalok!</button>
                        {{ vet.id }}
                    
                    </div>
                </div>
                <div>
                    <hr class="line">
                </div>
            </div>
        </div>
    </div>

  <Footer></Footer>
</template>

<script setup>
import Header from '@/components/page_controls/Header.vue';
import Footer from '@/components/page_controls/Footer.vue';
import InputText from "primevue/inputtext";
import vetservice from "../services/vetservice.js";
import router from '@/router';
import { ref } from 'vue';

const vets = ref();

vetservice.getAllVet().then((resp) => {
  vets.value = resp.data;
});

function book() {
    router.push('/idopontfoglalas');
    console.log()
}

</script>

<style lang="css" scoped>
.page {
    display: flex;
    align-items: start;
    justify-content: center;
}
.searchBar{
    background-color: #50b692;
    color: white;
    height: 360px;
    width: 280px;
    padding: 40px;
    border-radius: 7px;
    margin-right: 75px;
}
.nameSearch, .addressSearch, .postalCodeSearch{
    display: flex;
    flex-direction: column;
    height: 80px;
}

input{
    width: 200px;
}
.btnStyle{
    background-color: #368267;
}
.btnBox{
    display: flex;
    align-items: center;
    justify-content: center;
}
.searchResults{
    width: 600px;
    padding-left: 75px;
}
.vetsBox {
    display: flex;
    justify-content: space-between;
    align-items: center;
}
.vetName {
    color: #246951;
}

</style>
