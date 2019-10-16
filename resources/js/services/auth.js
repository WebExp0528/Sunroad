import Ls from './ls';

export default {
  async login (loginData) {
    try {
      let response = await axios.post('/api/auth/login', loginData);
      switch (response.status) {
        case 200: {
          Ls.set('auth.token', response.data.token);
          toastr['success']('Logged In!', 'Success');
          return response.data.token;
        }
        case 500: {
          toastr['error']('Server error', 'Error');
          break;
        }
        case 403: {
          toastr['error']('Please verify your email', 'Error');
          break;
        }
        case 401: {
          toastr['error']('Invalid Credential', 'Error');
          break;
        }
        default:
          break;
      }
      return null;
    } catch (error) {
      toastr['error']('Could not login', 'Error');
      console.log('Error', error.message);
      return null;
    }
  },

  async logout () {
    try {
      await axios.get('/api/auth/logout');

      Ls.remove('auth.token');
      toastr['success']('Logged out!', 'Success');
    } catch (error) {
      console.log('Error', error.message);
    }
  },

  async check () {
    let response = await axios.get('/api/auth/check');

    return !!response.data.authenticated;
  },

  async register (registerData) {
    try {
      let response = await axios.post('/api/auth/register', registerData);
      console.log(response);
      switch (response.status) {
        case 200: {
          Ls.set('auth.token', response.data.token);
          toastr['success']('Siginup In!', 'Success');
          return response.data.token;
        }
        case 500: {
          toastr['error']('Server error', 'Error');
          break;
        }
        case 403: {
          toastr['error']('Please verify your email', 'Error');
          break;
        }
        case 401: {
          toastr['error']('Invalid Credential', 'Error');
          break;
        }
        default:
          break;
      }
      return null;
    } catch (error) {
      toastr['error']('Could not register', 'Error');
      console.log('Error', error.message);
      return null;
    }
  }
};
