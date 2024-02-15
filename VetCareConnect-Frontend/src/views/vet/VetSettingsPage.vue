<template>
    <Header></Header>
    <h1 class="pageTitle">Beállítások</h1>
    <h2 class="titles">Nyitvatartás</h2>
    <div>
        <div v-for="open in opening" >
            {{ open.day }}: {{ open.working_hours }}
        </div>

    </div>
    <h2  class="titles">Nyitvatartás módosítása</h2>
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
                            <label v-else>Nincs munkaközi szünet</label> <br>
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

    <h2  class="titles">Különleges nyitvatartás hozzáadása</h2>
    <div class="opening">
            <div class="daily special">
                <h2>Különleges nyitvatartás</h2>
                <Calendar v-model="specialDate" dateFormat="yy-mm-dd" :min-date="new Date()" showIcon iconDisplay="input" class="calendarSpecial"/>
                <div class="closed">
                    <label v-if="!isOpenSpecial">Zárva</label>
                    <label v-else>Nyitva</label> <br />
                    <InputSwitch v-model="isOpenSpecial" />
                </div>
                <div v-if="isOpenSpecial">
                    <div>
                        <label>Nyitvatartás</label>
                        <InputMask mask="99:99-99:99" placeholder="08:00-16:00" v-model="specialOpeningHours" />
                    </div>
                    <div>
                        <label>Munkaközi szünet</label>
                        <InputMask mask="99:99-99:99" placeholder="12:00-13:30" :disabled="!isBreakSpecial" v-model="specialBreakHours" />
                        <div>
                            <label v-if="isBreakSpecial">Van munkaközi szünet</label>
                            <label v-else>Nincs munkaközi szünet</label> <br>
                            <InputSwitch v-model="isBreakSpecial" />
                        </div>
                    </div>
                </div>
                <div v-else>Ön ezen a napon zárva tart!</div>
                <button class="btnStyle" @click="saveSpecialOpening()">
                    Nyitvatartás mentése
                </button>
            </div>
        </div>
    <Footer></Footer>
</template>

<script setup>
import Header from "@/components/page_controls/Header.vue";
import Footer from "@/components/page_controls/Footer.vue";
import InputSwitch from "primevue/inputswitch";
import InputMask from "primevue/inputmask";
import Calendar from 'primevue/calendar';
import vetService from "@/services/vetservice";
import { ref } from "vue";
import { storeToRefs } from "pinia";
import { useUserStore } from "../../store/userstore";
import { useToast } from 'vue-toastification';

const { user } = storeToRefs(useUserStore());
const toast = useToast();

const isBreak = ref();
const isBreakSpecial = ref();
const isOpen = ref();
const isOpenSpecial = ref();
const showOpening = ref(false);
const choosedDay = ref();
const openingHours = ref();
const specialOpeningHours = ref();
const breakHours = ref();
const specialBreakHours = ref();
const opening = ref();
const error = ref(false);
const specialDate = ref(new Date());

let sendOpeningData = [];
let openDays = [];
let dataOpen = [];
let dataBreak = [];
let opened = [];

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
    vetService.addOpeningTime(user.value.token, data);
}

function deleteOpening(day) {
    vetService.deleteOpening(user.value.token, day);
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
    dataOpen = openingHours.value.split("-");
    console.log(dataOpen)
    console.log(dataOpen[0])
    console.log(dataOpen[1])
    if (dataOpen[0] > dataOpen[1]) {
        toast.error("Rossz nyitvatartás formátum!", { position: "top-center" });
        error.value = true;
        return;
    }
    if (isBreak.value) {
        dataBreak = breakHours.value.split("-");
        opened = [
            dataOpen[0] + "-" + dataBreak[0],
            dataBreak[1] + "-" + dataOpen[1],
        ];
        if (dataOpen[0] > dataBreak[0]) {
            toast.error("Rossz nyitvatartás formátum!", { position: "top-center" });
            error.value = true;
            return;
        } else if(dataBreak[1] > dataOpen[1]){
            toast.error("Rossz nyitvatartás formátum!", { position: "top-center" });
            error.value = true;
            return;
        } else if(dataBreak[0] > dataBreak[1]){
            toast.error("Rossz nyitvatartás formátum!", { position: "top-center" });
            error.value = true;
            return;
        }
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
        } else if(day == "minden nap"){
            if (openDays.length != 0) {
                deleteOpening("minden nap");
            }
        }  else if(day == "hétköznapok"){
            if (openDays.length != 0) {
                deleteOpening("hétköznapok");
            }
        }
        addOpeningData(sendOpeningData);
        toast.success(`Nyitvatartás elmentve a következő nap(ok)ra: ${day}.`, { position: "top-center" });
    } else {
        if (openDays.includes(day)) {
            deleteOpening(day);
        } else if(day == "minden nap"){
            if (openDays.length != 0) {
                deleteOpening("minden nap");
            }
        }  else if(day == "hétköznapok"){
            if (openDays.length != 0) {
                deleteOpening("hétköznapok");
            }
        }
        toast.success(`Nyitvatartás elmentve a következő nap(ok)ra: ${day}.`, { position: "top-center" });
    }
}

function saveOpening() {
    //validálás
    if (isOpen.value) {
        if (openingHours.value == null || openingHours.value == "" || openingHours.value == undefined || openingHours.value.length != 11) {
            toast.error(`Kérem töltse ki a nyitvatartási idő mezőt!`, { position: "top-center" });
            return;
        } else if (isBreak.value) {
            if(breakHours.value == null || breakHours.value == "" || breakHours.value == undefined || breakHours.value.length != 11){
                toast.error(`Kérem töltse ki a munkaközi szünet mezőt!`, { position: "top-center" });
                return;
            }
        } 
    }
    //mentés
    if (choosedDay.value == "hétköznapok") {
        sendOpeningData = [];
        for (let i = 2; i < days.length - 2; i++) {
            if (isOpen.value) {
                isOpenTime(days[i]);
                if (error.value) {
                    error.value = false;
                    return;
                }
            }
        }
        addOpenings("hétköznapok");
    } else if (choosedDay.value == "minden nap") {
        console.log('igen')
        sendOpeningData = [];
        for (let i = 2; i < days.length; i++) {
            if (isOpen.value) {
                isOpenTime(days[i]);
                if (error.value) {
                    error.value = false;
                    return;
                }
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
                    if (error.value) {
                    error.value = false;
                    return;
                    }
                }
                else{
                    dayClosed = days[i];
                }
                console.log(days[i])
                addOpenings(days[i]);
            }
        }
    }
}
</script>

<style lang="css" scoped>
.titles {
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
    width: 350px;
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
    display: flex;
    align-items: center;
    justify-content: center;
}

.btnStyle {
    background-color: #246951;
    padding: 10px 20px;
}

.p-inputswitch {
    margin-bottom: 0px !important;
}

.days {
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
    margin: 20px;
    align-items: center;
    justify-content: center;
}

.btnDays {
    margin: 10px;
    padding: 10px 20px;
    width: 140px;
}

.special {
    width: 350px;
    height: 500px;
}
.calendarSpecial{
    margin-bottom: 10px;
    width: 150px;
}

@media(max-width: 991px){
    .days{
        flex-direction: column;
    }
    .main{
        flex-direction: row;
    }
}
@media (max-width: 576px) {
    .days{
        flex-direction: row;
    }
    .main{
        flex-direction: column;
    }
    .daily {
        width: 300px;
    }
}
</style>
