<template>
    <Header></Header>
    <h1 class="pageTitle">Állatorvosok</h1>
    <div class="page">
        <div class="searchBar">
            <div class="nameSearch">
                <label>Név:</label>
                <InputText  placeholder="Dr. Állat Orvos" v-model="vetSearch.name"/>
            </div>
            <div class="postalCodeSearch">
                <label>Irányítószám:</label>
                <InputMask mask="9999" placeholder="9022" v-model="vetSearch.postal_code"/>
            </div>
            <div class="addressSearch">
                <label>Cím:</label>
                <InputText  placeholder="Komárom" v-model="vetSearch.address"/>
            </div>
            <div class="btnBox">
                <button class="btnStyle" @click="onSearch()">Keresés</button>
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
                        <button class="btnStyle" @click="book(vet.id)">Időpontot foglalok!</button>
                        
                    
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
import InputMask from 'primevue/inputmask';
import vetservice from "../services/vetservice.js";
import router from '@/router';
import { onMounted, ref } from 'vue';

const vets = ref();
const vetSearch = ref({
    name: "",
    postal_code: "",
    address: ""
});

// vetservice.getAllVet().then((resp) => {
//   vets.value = resp.data;
// });

function onSearch(){
    vetservice.getVetsByParams(vetSearch.value).then((resp) => {
        vets.value = resp.data;
    });
}

function book(vetId) {
    router.push(`/idopontfoglalas/${vetId}`);
}
onMounted(() => {
    onSearch();
});
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

@media (max-width: 1100px) {
    .searchResults {
        padding-left: 25px;
    }
    .searchBar {
        margin-right: 25px;
    }
}

@media (max-width: 990px) {
    .page {
        flex-direction: column;
        align-items: center;
    }
    .searchResults {
        padding-left: 0;
        margin-top: 25px;
    }
    .searchBar {
        margin-right: 0;
    }
}
@media (max-width: 670px) {
    .searchResults {
        width: 300px;
    }
    .vetsBox {
        flex-direction: column;
        align-items: start;
    }
}
</style>
