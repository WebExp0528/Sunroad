export default {
  async getUser () {
    try {
      let response = await axios.get('/api/users/get-user');
      switch (response.status) {
        case 200: {
          return response.data.user;
        }
        case 500: {
          toastr['error']('Server error', 'Error');
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
      toastr['error']('Could not fetch userinfo', 'Error');
      return null;
    }
  }
};
