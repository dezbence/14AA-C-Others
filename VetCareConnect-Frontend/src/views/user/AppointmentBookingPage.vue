<template>
  <Header></Header>
  <h1 class="pageTitle">Időpontfoglalás</h1>
  <div class="container">
    <div
      v-if="!showBookApprove"
      class="row d-flex align-items-start mx-auto my-auto"
    >
      <div class="d-flex justify-content-center p-0 mb-3 col-xl-4 col-lg-12">
        <div class="col p-0">
          <div class="choosePanel rounded">
            <div class="col">
              <p class="mb-xl-2 mb-lg-2">Válasszon orvost!</p>
              <select
                v-model="choosedData.vet"
                name="orvosok"
                id="orvosok"
                class="selectClass mt-0"
                @change="refreshTimes()"
              >
                <option value="0" disabled selected hidden>
                  Kérem válasszon!
                </option>
                <option v-for="vet in vets" :value="vet">{{ vet.name }}</option>
              </select>
            </div>

            <div class="col">
              <p class="mb-xl-2 mt-xl-4 mt-lg-0 mb-lg-2">
                Válassza ki az időpont típusát!
              </p>
              <select
                v-model="choosedData.type"
                name="types"
                id="type"
                class="selectClass mt-0"
              >
                <option value="0" disabled selected hidden>
                  Kérem válasszon!
                </option>

                <option v-for="curetype in cureTypes" :value="curetype">
                  {{ curetype.type }}
                </option>
              </select>
            </div>

            <div class="col">
              <p class="mb-xl-2 mt-xl-4 mt-lg-0 mb-lg-2">
                Válassza ki kiskedvencét!
              </p>
              <select
                v-model="choosedData.pet"
                name="pets"
                id="pet"
                class="selectClass mt-0"
              >
                <option value="0" disabled selected hidden>
                  Kérem válasszon!
                </option>

                <option v-for="pet in pets" :value="pet">{{ pet.name }}</option>
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

      <div
        class="calendarAndChoosePanel d-flex align-items-center justify-content-center mb-3 mt-0 col-xl-8 col-lg-12"
      >
        <Calendar
          class="calendar text-center col-md-12"
          v-model="choosedDate"
          :min-date="new Date()"
          @date-select="refreshTimes()"
        />
        <div class="chooseDate rounded-end col-md-12">
          <h5 class="text-center choosedDate">{{ formattedDate }}</h5>
          <div class="line"></div>
          <div class="dates">
            <div v-for="(time, index) in appointments" :key="index">
              <div
                class="times btnStyle"
                @click="isActiveToggle(index, time)"
                :class="{ active: activeIdx == index }"
              >
                {{ time }}
              </div>
            </div>
          </div>
          <div class="d-flex align-items-center justify-content-center">
            <button
              class="btnStyle btnBook text-center mt-5"
              @click="BookClick()"
            >
              Lefoglalom
            </button>
          </div>
          <div v-if="showError" class="errorMessage">
            <div class="alert alert-danger show errMess" role="alert">
              {{ errorMessage }}
              <button
                type="button"
                class="btn-close"
                @click="closeErrorMessage()"
              ></button>
            </div>
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
    <div v-else>
      <AppointmentApprove
        @remove="hideBook"
        :choosed-vet="choosedData.vet"
        :choosed-pet="choosedData.pet"
        :choosed-type="choosedData.type"
        :choosed-date="formattedDate"
        :choosed-time="choosedData.time"
        :date-format="dateSend"
      >
      </AppointmentApprove>
    </div>
  </div>
  <Footer></Footer>
</template>

<script setup>
import Header from "../../components/page_controls/Header.vue";
import Footer from "../../components/page_controls/Footer.vue";
import Calendar from "../../components/Calendar.vue";
import vetservice from "../../services/vetservice.js";
// import AppointmentApprove from "../../components/AppointmentApprove.vue";

import { ref, onMounted } from "vue";
import { useDateFormat } from "@vueuse/core";
import { storeToRefs } from "pinia";
import { useUserStore } from "../../store/userstore";
import { defineAsyncComponent } from "vue";
import { useRoute } from "vue-router";

const AppointmentApprove = defineAsyncComponent(() =>
  import("../../components/AppointmentApprove.vue")
);

const choosedData = ref({
  vet: { id: 0 },
  type: { id: 0 },
  pet: { id: 0 },
  time: "",
});
const choosedDate = ref();
const formattedDate = useDateFormat(choosedDate, "YYYY. MMMM DD.");
const dateSend = useDateFormat(choosedDate, "YYYY-MM-DD");

const activeIdx = ref(-1);

const showBookApprove = ref(false);
const showError = ref(false);
const errorMessage = ref("");
const selectedDoctorId = ref(null);
const route = useRoute();

const vets = ref();
const cureTypes = ref([]);
const pets = ref([]);
const appointments = ref([]);


const { user } = storeToRefs(useUserStore());

function isActiveToggle(index, time) {
  activeIdx.value = index;
  choosedData.value.time = time;
}

function BookClick() {
  if (choosedData.value.vet == "") {
    errorMessage.value = "Kérem válasszon orvost!\n";
    showError.value = true;
  } else if (choosedData.value.type == "") {
    errorMessage.value = "Kérem válassza ki az időpont típusát!\n";
    showError.value = true;
  } else if (choosedData.value.pet == "") {
    errorMessage.value = "Kérem válassza ki kisállatát!\n";
    showError.value = true;
  } else if (choosedData.value.time == "") {
    errorMessage.value = "Kérem válasszon időpontot!\n";
    showError.value = true;
  } else {
    showError.value = false;
    errorMessage.value = "";
    showBookApprove.value = true;
  }
}

function closeErrorMessage() {
  showError.value = false;
}

function hideBook() {
  showBookApprove.value = false;
}

function refreshTimes() {
  const freeAppointmentData = {
  id: choosedData.value.vet.id, 
  date: dateSend.value 
};
  console.log(freeAppointmentData)
  vetservice
    .getFreeAppointments(
      freeAppointmentData,
      user.value.token
    )
    .then((resp) => {
      appointments.value = resp.data;
    });
}

onMounted(() => {
  vetservice.getAllVet().then((resp) => {
    vets.value = resp.data;
    if (route.params.doctorId != "") {
      selectedDoctorId.value = parseInt(route.params.doctorId);
      choosedData.value.vet = vets.value.find(
        (x) => x.id == selectedDoctorId.value
      );
      refreshTimes();
    } else {
      choosedData.value.vet = 0;
    }
  });
  vetservice.getAllCureTypes().then((resp) => {
      cureTypes.value = resp.data;
      choosedData.value.type = 0;

    });

    vetservice.getUsersPets(user.value.token).then((resp) => {
      pets.value = resp.data;
      choosedData.value.pet = 0;

    });
});
</script>

<style scoped>
.header {
  text-align: center;
  color: #246951;
  margin-top: 20px;
  margin-bottom: 30px;
}

.active {
  border: 1.5px solid whitesmoke;
}

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
  margin-bottom: 5px;
}

.canBeReservated {
  background-color: #3ca27e;
  opacity: 50%;
}

.meanings {
  padding-top: 25px;
  padding-left: 25px;
  height: 130px;
}

.meanings div {
  margin-bottom: 5px;
  align-items: center;
  text-wrap: nowrap;
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

.dates {
  flex-wrap: wrap;
  display: flex;
  justify-content: center;
}

.errorMessage {
  align-items: center;
  justify-content: center;
  display: flex;
  margin-top: 10px;
  font-size: small;
  margin-bottom: 0px;
}

/*----------- media töréspontok ------------*/
@media (min-width: 1200px) {
  .header {
    font-size: large;
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
    margin-bottom: 30px !important;
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
    align-items: center;
    display: flex;
    flex-direction: column;
  }

  .choosePanel.p {
    margin-top: 0px;
  }

  .meanings {
    margin: auto;
    padding: 10px 40px;
    align-items: center;
    width: 300px;
  }

  .errMess {
    margin-bottom: -10px;
  }

  .meaningsInDates {
    display: block;
    background-color: #246951;
    border-radius: 7px;
    margin-top: 20px;
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
  }

  .meaningsInDates {
    display: block;
    padding: 20px;
    background-color: #246951;
    border-radius: 7px;
    margin-top: 20px;
    align-items: center;
  }

  .meaningsOutside {
    display: none;
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

  .errorMessage {
    font-size: xx-small;
  }
}
</style>
