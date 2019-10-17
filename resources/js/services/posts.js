export default {
  async getPosts (page) {
    try {
      let response = await axios.get('/api/posts/get-posts', {
        params: { page: page }
      });
      return response;
    } catch (error) {
      toastr['error']('Could not fetch userinfo', 'Error');
      return null;
    }
  },
  async addPostLike (postid) {
    try {
      let response = await axios.post('/api/posts/add-post-like', {
        post_id: postid
      });
      return response;
    } catch (error) {
      toastr['error']('Failed', 'Error');
      return null;
    }
  },
  async addPostComment (postid, description) {
    try {
      let response = await axios.post('/api/posts/add-post-comment', {
        post_id: postid,
        description: description
      });
      return response;
    } catch (error) {
      toastr['error']('Could not fetch userinfo', 'Error');
      return null;
    }
  }
};
