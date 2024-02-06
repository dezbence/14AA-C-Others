<template>
    <Header></Header>
    <h1 class="pageTitle">Beállítások</h1>
    <h5>Általános nyitvatartás</h5>
    <div class="main">
        <div class="days">
            <div v-for="day in days">
                <button class="btnStyle btnDays">{{ day }}</button>
            </div>
        </div>
        <div class="opening">
            <div class="daily">
                <h4>NAP</h4>
                <div class="closed">
                    <label v-if="!isClosed">Zárva</label>
                    <label v-else>Nyitva</label> <br>
                    <InputSwitch v-model="isClosed" />
                </div>
                <div v-if="isClosed">
                    <div>
                        <label>Nyitvatartás</label>
                        <InputMask mask="99:99-99:99" placeholder="08:00-16:00" />
                    </div>
                    <div>
                        <label>Munkaközi szünet</label>
                        <InputMask mask="99:99-99:99" placeholder="12:00-13:30" :disabled="!isBreak" />
                        <div>
                            <label v-if="isBreak">Van munkaközi szünet</label>
                            <label v-else>Nincs munkaközi szünet</label>
                            <InputSwitch v-model="isBreak" />
                        </div>
                    </div>
                </div>
                <div v-else>
                    Ön ezen a napon zárva tart!
                </div>
                <button class="btnStyle">Nyitvatartás mentése</button>
            </div>
        </div>
    </div>



    <Footer></Footer>
</template>

<script setup>
import Header from '@/components/page_controls/Header.vue';
import Footer from '@/components/page_controls/Footer.vue';
import InputSwitch from 'primevue/inputswitch';
import InputMask from 'primevue/inputmask';
import { ref } from 'vue';

const isBreak = ref();
const isClosed = ref();

const days = ["hétfő-péntek", "minden nap", "hétfő", "kedd", "szerda", "csütörtök", "péntek", "szombat", "vasárnap"];

</script>

<style lang="css" scoped>
h5 {
    margin-left: 40px;
    color: #368267;
    font-weight: 500;
}
.main {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}
.daily {
    background-color: #50B692;
    height: 420px;
    width: 300px;
    border-radius: 7px;
    padding: 40px;
    color: white;
    font-weight: 500;
}

.daily div {
    margin-bottom: 10px;
}

.opening {
    margin: 30px 40px;
}

.btnStyle {
    background-color: #246951;
}

.p-inputswitch {
    margin-bottom: 0px !important;
}

.days {
    display: flex;
    flex-direction: row;
}

.btnDays {
    margin: 10px;
}</style>