<template>
    <div class="darkBack">
        <div class="back">
            <div class="front">
                <h3>Biztos benne, hogy módosítja az adatait?</h3>
                <p>Nem lehet visszavonni módosítás után!</p>
                <div class="buttons">
                    <button id="yes" @click="editDatas()">Igen</button>
                    <button id="cancel" @click="cancel()">Mégse</button>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
const emits = defineEmits(['cancel', 'editDatas']);

function editDatas() {
    emits('editDatas');
}

function cancel() {
    emits('cancel');
}
</script>

<style scoped>
.back {
    border-radius: 7px;
    width: 400px;
    height: fit-content;
    padding: 32px;
    display: flex;
    flex-direction: column;
    background-color: white;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);

}

.buttons {
    display: flex;
    gap: 18px;
}

button {
    color: white;
    padding: 6px 12px;
    border-radius: 7px;
    border: none;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);

}

#yes {
    background-color: #246951;
}

#cancel {
    border: #246951 1px solid;
    background-color: white;
    color: #246951;
}
</style>