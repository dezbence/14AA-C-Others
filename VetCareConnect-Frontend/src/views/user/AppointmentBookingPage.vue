
<template>
    <Header></Header>
    <div class="container">
        <h1 class="header">Időpontfoglalás</h1>
        <div class="row d-flex align-items-start mx-auto my-auto">
            <div class="d-flex justify-content-center p-0 mb-3 col-xl-4 col-lg-12">
                <div class="col p-0">
                    <div class="choosePanel rounded">
                        <div class="col">
                            <p class="mb-xl-2 mb-lg-2">Válasszon orvost!</p>
                            <select name="orvosok" id="orvosok" class="selectClass mt-0">
                                <option value="dralltorvos">Dr.Állat Orvos</option>
                                <option value="drbarni">Dr.Barni</option>
                                <option value="drbence">Dr.Bence</option>
                            </select>
                        </div>

                        <div class="col">
                            <p class="mb-xl-2 mt-xl-4 mt-lg-0 mb-lg-2">Válassza ki az időpont típusát!</p>
                            <select name="tipus" id="tipus" class="selectClass mt-0">
                                <option value="veszettsegelleni">
                                    Veszettség elleni oltás
                                </option>
                                <option value="idopont">Időpont</option>
                                <option value="kontroll">Kontroll</option>
                            </select>
                        </div>

                        <div class="col">
                            <p class="mb-xl-2 mt-xl-4 mt-lg-0 mb-lg-2">Válassza ki kiskedvencét!</p>
                            <select name="allat" id="allat" class="selectClass mt-0">
                                <option value="bodri">Bodri</option>
                                <option value="lali">Lali</option>
                            </select>
                        </div>
                    </div>

                    <div class="meanings meaningsOutside">
                        <div class="row">
                            <div class="colorMeaning canBeReservated col-3"></div>
                            <div class="col-9">Foglalható időpont</div>
                        </div>
                        <div class="row">
                            <div class="colorMeaning choosed col-3"></div>
                            <div class="col-9">Választott nap</div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="calendarAndChoosePanel d-flex align-items-center justify-content-center mb-3 mt-0 col-xl-8 col-lg-12">
                <Calendar class="calendar text-center col-md-12" v-model="date" dateFormat="dd/mm/yy" />
                <div class="chooseDate rounded-end col-md-12">
                    <h5 class="text-center choosedDate">{{ formattedDate }}</h5>
                    <div class="line"></div>
                    <div class="d-flex flex-row align-items-center justify-content-center">
                        <div class="dates d-flex flex-row align-items-center justify-content-start flex-wrap p-1">
                            <div class="times btnStyle times-clicked">9:25</div>
                            <div class="times btnStyle">10:35</div>
                            <div class="times btnStyle">14:30</div>
                            <div class="times btnStyle">16:30</div>
                            <div class="times btnStyle">17:30</div>
                        </div>
                    </div>
                    <div class="d-flex align-items-center justify-content-center">
                        <button class="btnStyle btnBook text-center mt-5">
                            Lefoglalom
                        </button>
                    </div>
                    <div class="meanings meaningsInDates">
                        <div class="row">
                            <div class="colorMeaning canBeReservated col-3"></div>
                            <div class="col-9">Foglalható időpont</div>
                        </div>
                        <div class="row">
                            <div class="colorMeaning choosed col-3"></div>
                            <div class="col-9">Választott nap</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <Footer></Footer>
</template>
  
<script setup>
import Header from '../../components/page_controls/Header.vue'
import Footer from '../../components/page_controls/Footer.vue'
import Calendar from '../../components/Calendar.vue'

// import Button from "@/components/Button.vue";
// import Calendar from "@/components/Calendar.vue";

import { ref } from "vue";
import { useDateFormat } from "@vueuse/core"

const date = ref();
const formattedDate = useDateFormat(date, "YYYY. MMMM DD.");

const selectedDoctor = ref();
const doctors = ref([
    { name: "Dr. Állat Orvos", code: "NY" },
    { name: "Dr. Barni", code: "RM" },
    { name: "Dr. Kokas", code: "LDN" },
    { name: "Dr. Bence", code: "IST" },
    { name: "Dr. Kata", code: "PRS" },
]);

</script>

<style scoped>
.header {
    text-align: center;
    color: #246951;
    margin-top: 20px;
    margin-bottom: 30px;
}
.btnStyle {
    padding: 10px 20px;
    border-radius: 7px;
    cursor: pointer;
    color: white;
    border: none;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
}

.btnStyle:hover {
    transform: scale(1.03);
    transition: 200ms;
}

/* majd meg kell csinálni, hogy click eseményre maradjon rajta a class, de addig nem rakom rá  */
.times-clicked {
    border: 1.5px solid whitesmoke;
}

/* ------ */

.btnBook {
    background-color: #50b692;
}

.colorMeaning {
    height: 35px;
    width: 35px;
    border-radius: 100%;
}

.choosed {
    background-color: #3ca27e;
}

.canBeReservated {
    background-color: #3ca27e;
    opacity: 50%;
}

.meanings {
    padding-top: 10px;
    padding-left: 25px;
}


.choosePanel {
    background-color: #50b692;
    color: white;
    width: 300px;
    height: 400px;
    min-width: 300px;
    padding: 40px;
}

.selectClass {
    width: 215px;
    height: 50px;
    border: none;
    border-radius: 7px;
    background-color: #368267;
    padding: 5px 0 5px 10px;
    color: white;
}

.chooseDate {
    background-color: #368267;
    height: 480px;
    width: 380px;
    min-width: 250px;
    padding: 40px;
    color: white;
}

.line {
    height: 5px;
    background-color: #50b692;
    border-radius: 7px;
    width: 100%;
}

.times {
    width: 60px;
    height: 30px;
    background-color: #50b692;
    border-radius: 7px;
    margin: 5px;
    text-align: center;
    padding: 5px;
}

.calendar {
    height: 480px;
    width: 410px;
}

.meaningsInDates {
    display: none;
}



/*----------- media töréspontok ------------*/
@media (min-width: 1200px) {
    .header {
        font-size: 5rem;
        font-weight: 400;
    }

    .chooseDate {
        height: 480px;
        width: 380px;
        min-width: 250px;
        padding: 40px;
    }

    .choosePanel div {
        padding: 0px;
    }

    .calendar {
        overflow: hidden;
        border-radius: 7px 0 0 7px;

    }

}

/* itt már egymás alá kell csúsznia a választós és a foglalós résznek */
@media (max-width: 1200px) {
    .header {
        font-size: 4rem;
        font-weight: 400;
    }

    .calendar {
        overflow: hidden;
        border-radius: 7px 0 0 7px;

    }

    .calendarAndChoosePanel {
        margin-bottom: 80px !important;
    }

    .choosePanel {
        width: 100%;
        height: 170px;
        margin: auto;
        display: flex;
        align-items: center;

    }

    .choosePanel div {
        padding: 0px;
        text-align: center;
    }

    .choosePanel.p {
        margin-top: 0px;
    }

    .meanings {
        margin: auto;
        padding: 20px 40px;
        align-items: center;
        width: 300px;
    }

    .meaningsInDates {
        display: block;
        padding: 20px;
        background-color: #246951;
        border-radius: 7px;
        margin-top: 25px;
        align-items: center;
    }

    .meaningsOutside {
        display: none;
    }
}

@media (max-width: 991px) {
    .header {
        font-size: 4rem;
        font-weight: 400;
    }

    .choosePanel {
        height: 380px;
        width: 410px;
        min-width: 250px;
        padding: 30px;
        display: flex;
        flex-direction: column;
        align-items: center;
        margin: auto;
    }

    .calendar {
        height: 450px;
        border-radius: 7px !important;
        overflow: hidden !important;

    }

    .calendarAndChoosePanel {
        margin-top: 20px;
        flex-direction: column;
    }

    .chooseDate {
        width: 410px;
        height: 480px;
        border-radius: 7px;
        margin-top: 20px;
        margin-bottom: 60px;
    }

    .meaningsInDates {
        display: block;
        padding: 20px;
        background-color: #246951;
        border-radius: 7px;
        margin-top: 25px;
        align-items: center;
    }

    .meaningsOutside {
        display: none;
    }

    .dates {
        margin-left: 20px;
        margin-right: 20px;
    }

}

@media (max-width: 768px) {
    .calendar {
        height: 380px;
        border-radius: 7px;
        overflow: hidden !important;

    }
}

@media (max-width: 576px) {
    .header {
        font-size: 2rem;
        margin-bottom: 15px;
    }

    .calendar {
        width: 250px;
        height: 280px;
        overflow: hidden !important;
    }

    .chooseDate {
        width: 250px;
    }

    .choosePanel {
        height: 350px;
        width: 250px;
        padding: 30px;
    }

    .meaningsInDates {
        display: none;
    }

    .meanings {
        align-items: start;
    }

    .meaningsOutside {
        display: flex;
        flex-direction: column;
        justify-content: start;
        margin-bottom: 0;
    }

    .selectClass {
        height: 30px;
        width: 200px;
    }

    .chooseDate {
        height: 500px;
    }

    .dates {
        justify-content: center !important;
    }

    .choosedDate {
        font-size: 1.1rem;
    }

}</style>
  