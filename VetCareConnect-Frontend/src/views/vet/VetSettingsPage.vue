<template>
    <Header></Header>
    <h1 class="pageTitle">Beállítások</h1>
    <h3>Nyitvatartás</h3>
    <div>

    </div>
    <h3>Nyitvatartás módosítása</h3>
    <div class="main">
        <div class="days">
            <div v-for="day in days">
                <button class="btnStyle btnDays" @click="showDayOpening(day)">
                    {{ day }}
                </button>
            </div>
        </div>
        <div class="opening" v-if="showOpening">
            <div class="daily">
                <h1>{{ choosedDay }}</h1>
                <div class="closed">
                    <label v-if="!isOpen">Zárva</label>
                    <label v-else>Nyitva</label> <br />
                    <InputSwitch v-model="isOpen" />
                </div>
                <div v-if="isOpen">
                    <div>
                        <label>Nyitvatartás</label>
                        <InputMask mask="99:99-99:99" placeholder="08:00-16:00" v-model="openingHours" />
                    </div>
                    <div>
                        <label>Munkaközi szünet</label>
                        <InputMask mask="99:99-99:99" placeholder="12:00-13:30" :disabled="!isBreak" v-model="breakHours" />
                        <div>
                            <label v-if="isBreak">Van munkaközi szünet</label>
                            <label v-else>Nincs munkaközi szünet</label>
                            <InputSwitch v-model="isBreak" />
                        </div>
                    </div>
                </div>
                <div v-else>Ön ezen a napon zárva tart!</div>
                <button class="btnStyle" @click="saveOpening()">
                    Nyitvatartás mentése
                </button>
            </div>
        </div>
    </div>

    <Footer></Footer>
</template>

<script setup>
import Header from "@/components/page_controls/Header.vue";
import Footer from "@/components/page_controls/Footer.vue";
import InputSwitch from "primevue/inputswitch";
import InputMask from "primevue/inputmask";
import vetService from "@/services/vetservice";
import { ref } from "vue";
import { storeToRefs } from "pinia";
import { useUserStore } from "../../store/userstore";
import { useToast } from 'vue-toastification'

const { user } = storeToRefs(useUserStore());
const toast = useToast();

const isBreak = ref();
const isOpen = ref();
const showOpening = ref(false);
const choosedDay = ref();
const openingHours = ref();
const breakHours = ref();
const opening = ref();

let sendOpeningData = [];
let openDays = [];

const days = [
    "hétköznapok",
    "minden nap",
    "hétfő",
    "kedd",
    "szerda",
    "csütörtök",
    "péntek",
    "szombat",
    "vasárnap",
];

function showDayOpening(day) {
    showOpening.value = true;
    choosedDay.value = day;
}

function addOpeningData(data) {
    vetService.addOpeningTime(user.value.token, data).then(resp => { console.log('siker') });
}

function deleteOpening(day) {
    vetService.deleteOpening(user.value.token, day).then(resp => { console.log('sikeres törlés', day) });
}

function getOpenings() {
    vetService.getOpenings(user.value.token).then(resp => { 
        opening.value = resp.data;
        (opening.value).forEach(o => {
            openDays.push(o.day);
        }); 
    });
}
getOpenings();

function isOpenTime(day) {
    if (isBreak.value) {
        let dataOpen = openingHours.value.split("-");
        let dataBreak = breakHours.value.split("-");
        let opened = [
            dataOpen[0] + "-" + dataBreak[0],
            dataBreak[1] + "-" + dataOpen[1],
        ];
        opened.forEach((o) => {
            sendOpeningData.push({ working_hours: o, day: day });
        });
    } else {
        sendOpeningData.push({ working_hours: openingHours.value, day: day });
    }
}
function addOpenings(day) {
    getOpenings();
    if (sendOpeningData.length != 0) {
        if (openDays.includes(day)) {
            deleteOpening(day);
        }
        addOpeningData(sendOpeningData);
        toast.success(`Nyitvatartás elmentve a következő nap(ok)ra: ${day}.`, { position: "top-center" });
    } else {
        if (openDays.includes(day)) {
            deleteOpening(day);
        }
        toast.success(`Nyitvatartás elmentve a következő nap(ok)ra: ${day}.`, { position: "top-center" });
    }
}

function saveOpening() {
    if (choosedDay.value == "hétköznapok") {
        sendOpeningData = [];
        for (let i = 2; i < days.length - 2; i++) {
            if (isOpen.value) {
                isOpenTime(days[i]);
            }
        }
        addOpenings("hétköznapok");
    } else if (choosedDay.value == "minden nap") {
        console.log('igen')
        sendOpeningData = [];
        for (let i = 2; i < days.length; i++) {
            if (isOpen.value) {
                isOpenTime(days[i]);
            }
        }
        addOpenings("minden nap");
    } else {
        sendOpeningData = [];
        let dayClosed = "";
        for (let i = 2; i < days.length; i++) {
            if (days[i] == choosedDay.value) {
                if (isOpen.value) {
                    isOpenTime(days[i]);
                }
                else{
                    dayClosed = days[i];
                }
            }
        }
        addOpenings(dayClosed);
    }
}
</script>

<style lang="css" scoped>
h3 {
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
    background-color: #50b692;
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
}
</style>
