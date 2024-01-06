import Axios from './dataservice.js';

export default {

    getOwnerAppointments() {
        return Axios.get('/ownerAppointmentsORM')
            .then(resp => {
                return resp.data;
            })
            .catch(err => {
                return Promise.reject(err.response)
            })
    }

}