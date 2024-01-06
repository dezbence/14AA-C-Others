import Axios from 'axios';

const instance = Axios.create({
    baseUrl: import.meta.env.VITE_API_URL,
    headers: {
        'Content-Type' : 'application/json'
    }
});

export default instance;