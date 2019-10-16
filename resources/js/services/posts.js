export default {
  async getPosts (page) {
    try {
      let response = await axios.get('/api/posts/get-posts', {
        params: { page: page }
      });
      // switch (response.status) {
      //   case 200: {
      //     return response.data.user;
      //   }
      //   case 500: {
      //     toastr['error']('Server error', 'Error');
      //     break;
      //   }
      //   case 401: {
      //     toastr['error']('Invalid Credential', 'Error');
      //     break;
      //   }
      //   default:
      //     break;
      // }
      return response;
    } catch (error) {
      toastr['error']('Could not fetch userinfo', 'Error');
      return null;
    }
  }
};
