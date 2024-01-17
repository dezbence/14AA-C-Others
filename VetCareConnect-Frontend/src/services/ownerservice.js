import Axios from './dataservice.js';

export default {
    postNewPet(data) {
        return Axios.post('/new-pet', data)
            .then(resp => {
                return resp.data;
            })
            .catch(err => {
                return Promise.reject(err.response);
            })
    },
    getOwnersPets(id, token) {
        return Axios.get('/pets/' + id, {headers: {"Authorization" : "Bearer "+ token}})
            .then(resp => {
                return resp.data;
            })
            .catch(err => {
                return Promise.reject(err.response);
            })
    },
}