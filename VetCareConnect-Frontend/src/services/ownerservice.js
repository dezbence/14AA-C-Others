import Axios from './dataservice.js';

export default {
    postNewPet(data, token) {
        return Axios.post('/new-pet', data, {headers: {"Authorization" : "Bearer "+ token}})
            .then(resp => {
                return resp.data;
            })
            .catch(err => {
                return Promise.reject(err.response);
            })
    },
    getOwnersPets(token) {
        return Axios.get('/pets', {headers: {"Authorization" : "Bearer "+ token}})
            .then(resp => {
                return resp.data;
            })
            .catch(err => {
                return Promise.reject(err.response);
            })
    },
    deletePet(id, token) {
        return Axios.get('/delete-pet/' + id, {headers: {"Authorization" : "Bearer "+ token}})
        .then(resp => {
            return resp.data;
        })
        .catch(err => {
            return Promise.reject(err.response);
        })
    },
    bookAppointment(appointment, token){
        return Axios.post('/new-appointment', appointment, {headers: {"Authorization" : "Bearer "+ token}})
        .then(resp => {
            return resp.data;
        })
        .catch(err => {
            return Promise.reject(err.response);
        })
    },
    getAppointments(token){
        return Axios.get('/owner-appointments', {headers: {"Authorization" : "Bearer "+ token}})
            .then(resp => {
                return resp.data;
            })
            .catch(err => {
                return Promise.reject(err.response);
            })
    }
}