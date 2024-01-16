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
    getUsersPets(id, token){
        return Axios.get(`/pets/${id}`, {headers: {"Authorization" : "Bearer "+token}})
        .then(resp => {
            return resp.data;
        })
        .catch(err => {
            return Promise.reject(err.response);
        }) 
    }
}