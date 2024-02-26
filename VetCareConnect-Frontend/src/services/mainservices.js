import Axios from './dataservice.js';

export default {
    getAllQuestions() {
        return Axios.get('/faq-all')
            .then(resp => {
                return resp.data;
            })
            .catch(err => {
                return Promise.reject(err.response);
            })
    },
    getAllOwner(token) {
        return Axios.get('/owner-all', {headers: {"Authorization" : "Bearer "+ token}})
            .then(resp => {
                return resp.data;
            })
            .catch(err => {
                return Promise.reject(err.response);
            })
    },
    getAllVet(token) {
        return Axios.get('/vet-all', {headers: {"Authorization" : "Bearer "+ token}})
            .then(resp => {
                return resp.data;
            })
            .catch(err => {
                return Promise.reject(err.response);
            })
    }
}