import Axios from './dataservice.js';

export default {
    getAllVet() {
        return Axios.get('/vet-all')
            .then(resp => {
                return resp.data;
            })
            .catch(err => {
                return Promise.reject(err.response);
            })
    },
    getAllCureTypes(){
        return Axios.get('/cure-types-all')
            .then(resp => {
                return resp.data;
            })
            .catch(err => {
                return Promise.reject(err.response);
            }) 
    },
    getUsersPets(token){
        return Axios.get(`/pets`, {headers: {"Authorization" : "Bearer "+token}})
        .then(resp => {
            return resp.data;
        })
        .catch(err => {
            return Promise.reject(err.response);
        }) 
    },
    getVetsByParams(data){
        return Axios.post(`/search-vets`, data)
        .then(resp => {
            return resp.data;
        })
        .catch(err => {
            return Promise.reject(err.response);
        }) 
    },
    getFreeAppointments(id, date, token){
        return Axios.get(`/free-appointments/${id}/${date}`, {headers: {"Authorization" : "Bearer "+token}})
        .then(resp => {
            return resp.data;
        })
        .catch(err => {
            return Promise.reject(err.response);
        })
    }
}