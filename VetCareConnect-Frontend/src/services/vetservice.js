import Axios from './dataservice.js';

export default {
    getAllVet() {
        return Axios.get('/getAllVet')
            .then(resp => {
                return resp.data;
            })
            .catch(err => {
                return Promise.reject(err.response);
            })
    }
}