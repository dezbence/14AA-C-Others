<template>
    <div class="main">
        <div class="back">
            <div class="front">
                <h3>Válasszon profil típust!</h3>
                <p>Ön egy {{ userTypes[activeIdx]?.type }}</p>
                <div class="cards">
                    <div v-for="(userType, index) in userTypes">
                    <div @click="isActiveToggle(index)" :class="{ 'selected': activeIdx == index }" class="cardd">
                        <h4>{{ userType.type }}</h4>
                        <img class="cardImg" :src="userType.imgSrc">
                    </div>
                </div>
                
                </div>
                <div class="buttonSection">
                    <button @click="sendType">Tovább <svg xmlns="http://www.w3.org/2000/svg" height="24"
                            viewBox="0 -960 960 960" width="24">
                            <path d="m313-440 224 224-57 56-320-320 320-320 57 56-224 224h487v80H313Z" />
                        </svg></button>
                </div>

            </div>

        </div>

    </div>
</template>
<script setup>
import { ref } from "vue";
import { defineEmits } from "vue";

const emit = defineEmits(['removeVetOrUser'])

const userTypes = [
    { type: "gazda", imgSrc: "/src/assets/icons/pets.svg" },
    { type: "orvos", imgSrc: "/src/assets/icons/stethoscope.svg" }
];

const activeIdx = ref(-1);

function isActiveToggle(index) {
    activeIdx.value = index;
    console.log(activeIdx.value)
}



function sendType() {
    emit('removeVetOrUser', activeIdx)
}

</script>

<style scoped>
body {
    overflow-y: hidden;
    margin: 0;
}

.main {
    display: flex;
    align-items: center;
    justify-content: center;
    position: relative;

}

.back {
    background-color: #fff;
    border-radius: 7px;
    min-height: 30vh;
    min-width: 40vh;
    width: 600px;
    height: 500px;
    display: flex;
    justify-content: center;
    align-items: center;
}

.front {
    display: flex;
    flex-direction: column;
}

.cards {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 50px;
}


.notSelected {
    background-color: white;
    color: black;
}

.cardd {
    height: 250px;
    width: 200px;
    border-radius: 7px;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
    display: flex;
    justify-content: start;
    flex-direction: column;
    align-items: center;
    font-size: 1.4rem;
    padding: 20px;
    color: #246951;
    cursor: pointer;
    margin: 20px 0;
}

.cardd:hover {
    transform: scale(1.05);
    transition: 200ms;
    background-color: #246951;
    color: white;
}

.cardd:hover .cardImg {
    filter: invert(100%);
}

.cardImg {
    margin-top: 40px;
    filter: invert(30%) sepia(12%) saturate(2322%) hue-rotate(108deg) brightness(101%) contrast(80%);
    width: 60px;
}


form {
    background-color: white;
    height: 36vh;
    text-align: left;
    padding: 5vh;
    border-radius: 7px;
}

h3 {
    color: #246951;
    margin-top: 0;
    margin-bottom: 15px;
    font-size: 1.6rem;
}

label {
    font-size: 0.9rem;
    color: #246951;
    font-weight: bolder;
    letter-spacing: 0;
    display: inline-block;
    margin-top: 3vh;
}


input[type="radio"]:checked {
    accent-color: #246951;
}

.buttonSection {
    display: flex;
    align-items: center;
    justify-content: center;
}

button svg {
    transform: scaleX(-1);
    fill: white;
    margin-left: 4px;
    width: 20px;
    margin-bottom: 1px;
}

button {
    background: #246951;
    font-size: 1.05rem;
    width: 50%;
    border: 0;
    padding: 5px;
    color: white;
    border-radius: 5px;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
    display: flex;
    align-items: center;
    justify-content: center;
    margin-top: 30px;
}

button:hover {
    background-color: #368267;
    transition: 200ms;
}


.submit {
    text-align: center;
    margin-top: 6vh;
}

.selected {
    transform: scale(1.1);
    transition: 200ms;
    background-color: #246951;
    color: #fff;
}
.selected .cardImg {
    filter: invert(100%);
}
</style>
