<template>
    <div class="btns btnChoose">
        <button class="btnStyle" @click="showVet()">Állatorvosok</button>
        <button class="btnStyle" @click="showOwner()">Gazdák</button>
    </div>
    <div v-if="isVet" class="data">
        <h1>Állatorvosok</h1>
        <DataTable class="table" v-model:selection="selectedVet" v-model:editingRows="editingRowsVet" :value="vets" editMode="row" dataKey="id"
            @row-edit-save="onRowEditSave" :pt="{
                table: { style: 'min-width: 50rem' },
                column: {
                    bodycell: ({ state }) => ({
                        style: state['d_editing'] && 'padding-top: 0.6rem; padding-bottom: 0.6rem'
                    })
                }
            }">
            <Column selectionMode="multiple" headerStyle="width: 3rem"></Column>
            <Column field="id" header="Azonosító" style="width: 20%"></Column>
            <Column field="name" header="Név" style="width: 20%">
                <template #editor="{ data, field }">
                    <InputText v-model="data[field]" />
                </template>
            </Column>
            <Column field="email" header="Email" style="width: 20%">
                <template #editor="{ data, field }">
                    <InputText v-model="data[field]" />
                </template>
            </Column>
            <Column field="phone" header="Telefonszám" style="width: 20%">
                <template #editor="{ data, field }">
                    <InputText v-model="data[field]" />
                </template>
            </Column>
            <Column field="" header="Alapértelmezett jelszó" style="width: 20%">
                <template #editor="{ data, field }">
                    <InputText v-model="data[field]" />
                </template>
            </Column>
            <Column :rowEditor="true" style="width: 10%; min-width: 8rem" bodyStyle="text-align:center"></Column>
        </DataTable>
        <div class="btns">
            <button class="btnStyle btnDelete" @click="deleteVet">Törlés</button>
            <button class="btnStyle btnSave" @click="saveData">Mentés</button>
        </div>
    </div>
    <div v-if="isOwner" class="data">
        <h1>Gazdák</h1>
        <DataTable class="table" v-model:selection="selectedOwner" v-model:editingRows="editingRowsOwner" :value="owners" editMode="row" dataKey="id"
            @row-edit-save="onRowEditSave" :pt="{
                table: { style: 'min-width: 50rem' },
                column: {
                    bodycell: ({ state }) => ({
                        style: state['d_editing'] && 'padding-top: 0.6rem; padding-bottom: 0.6rem'
                    })
                }
            }">
            <Column selectionMode="multiple" headerStyle="width: 3rem"></Column>
            <Column field="id" header="Azonosító" style="width: 20%"></Column>
            <Column field="name" header="Név" style="width: 20%">
                <template #editor="{ data, field }">
                    <InputText v-model="data[field]" />
                </template>
            </Column>
            <Column field="email" header="Email" style="width: 20%">
                <template #editor="{ data, field }">
                    <InputText v-model="data[field]" />
                </template>
            </Column>
            <Column field="phone" header="Telefonszám" style="width: 20%">
                <template #editor="{ data, field }">
                    <InputText v-model="data[field]" />
                </template>
            </Column>
            <Column field="" header="Alapértelmezett jelszó" style="width: 20%">
                <template #editor="{ data, field }">
                    <InputText v-model="data[field]" />
                </template>
            </Column>
            <Column :rowEditor="true" style="width: 10%; min-width: 8rem" bodyStyle="text-align:center"></Column>
        </DataTable>
        <div class="btns">
            <button class="btnStyle btnDelete" @click="deleteOwner">Törlés</button>
            <button class="btnStyle btnSave" @click="saveData">Mentés</button>
        </div>
    </div>
</template>

<script setup>
import DataTable from 'primevue/datatable';
import Column from 'primevue/column';
import mainService from '@/services/mainservices';
import InputText from 'primevue/inputtext';

import { ref } from 'vue';
import { storeToRefs } from "pinia";
import { useUserStore } from "@/store/userstore";

const { user } = storeToRefs(useUserStore());

const isVet = ref(false);
const isOwner = ref(false);

const editingRowsVet = ref([]);
const editingRowsOwner = ref([]);

const owners = ref([]);
const vets = ref([]);

const selectedVet = ref();
const selectedOwner = ref();

const onRowEditSave = (event) => {
    let { newData, index } = event;

    vets.value[index] = newData;
};

function saveData(){
    // adatok módosítása
}

function showVet(){
    isVet.value = true;
    isOwner.value = false;
}

function showOwner(){
    isVet.value = false;
    isOwner.value = true;
}

function deleteVet(){
    (selectedVet.value).forEach(vet => {
        mainService.deleteVet(vet.id, user.value.token).then(resp => {
            console.log('siker');
        });
    });
    getPeople();
}

function deleteOwner(){
    (selectedOwner.value).forEach(owner => {
        mainService.deleteOwner(owner.id, user.value.token).then(resp => {
            console.log('siker');
            console.log(resp.data)
        });
    });
    getPeople();
}

function getPeople(){
    mainService.getAllOwner(user.value.token).then(resp =>{
        owners.value = resp.data;
        console.log(resp.data);
    });
    mainService.getAllVet(user.value.token).then(resp =>{
        vets.value = resp.data;
        console.log(resp.data);
    });
}
getPeople();
</script>

<style lang="css" scoped>
.btns {
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: center;
}
.btnChoose {
    width: 100%;
    background-color: #e9ecef;
    position: fixed;
    z-index: 100;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
}
.btnStyle {
    padding: 10px 20px;
    margin: 20px 10px;
    background-color: #555;
}
.btnDelete {
    background-color: red;
}
.btnSave {
    background-color: green;
}
h1 {
    color: #555;
    margin-top: 120px;
}
.table {
    max-width: 1000px;
    margin: 10px 40px;
}
.data {
    display: flex;
    flex-direction: column;
    align-items: center;
}
</style>