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
    
}