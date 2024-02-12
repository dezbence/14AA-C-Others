import { defineStore } from "pinia";
import userservice from "../services/userservice";
import ownerservice from "@/services/ownerservice";

export const useUserStore = defineStore('userstore', {
    state: () => ({
        user: {
            name: '',
            token: '',
            role: null
        },
        status: {
            loggedIn: false,
            message: ''
        },
        pets: [],
        show: false,
        showSure: false,
        cancelAppointmentId: null,
        petDelete: false,
        deletePetId: null,
        petEdit: false,
        editPet: {},
        lowerCaseLetters: /[a-záéiíoóöőuúüű]/,
        upperCaseLetters: /[A-ZÁÉIÍOÓÖŐUÚÜŰ]/,
        numbers: /[0-9]/,
        emailPattern: /^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+\.[a-zA-z]{2,3}$/,
        charactersPattern: /[dD]?r?\.?\s?[A-Za-záéiíoóöőuúüűÁÉIÍOÓÖŐUÚÜŰä]+\s?-?[A-Za-záéiíoóöőuúüűÁÉIÍOÓÖŐUÚÜŰä]*/,
        addressPattern: /[A-Za-záéiíoóöőuúüűÁÉIÍOÓÖŐUÚÜŰäß\s-]+\.?\s?[0-9]{1,3}\.?-?\/?[a-zA-Z0-9]{0,3}/,
        stampAndPostalPattern: /[0-9]{4}/
    }),
    getters: {},
    actions: {
        login(data) {
            return userservice.login(data)
                .then(resp => {
                    this.status.loggedIn = true;
                    this.user = resp.data.data;
                    this.status.message = ''; //resp.data.message;
                    localStorage.setItem('user', JSON.stringify(this.user))
                })
                .catch(err => {
                    this.status.loggedIn = false;
                    this.user = { name: '', token: '', role: null }
                    this.status.message = err.data.data.error;
                    return Promise.reject(err.resposne);
                })
        },
        logout() {
            return userservice.logout(this.user.token)
                .then(() => {
                    this.status.loggedIn = false;
                    this.user = { name: '', token: '', role: null }
                    localStorage.removeItem('user');
                });
        },
        showAppointmentCancel(value) {
            this.show = value;
        },
        showPetDelete(value) {
            this.petDelete = value;
        },
        showPetEdit(value) {
            this.petEdit = value;
        },
        showSureInEdit(value) {
            this.showSure = value;
        },
        getPets() {
            ownerservice.getOwnersPets(this.user.token)
                .then((resp) => {
                    this.pets = resp.data;
                });
        }
    }
});