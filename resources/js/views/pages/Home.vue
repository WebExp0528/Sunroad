<template>
  <section id="dashboardPage" class="main-content">
    <div class="container">
      <div class="row" v-for="(item, index) in posts" :key="item.id">
          <div class="col-sm-8" v-bind:id="item.id">
            <div class="card">
              <div class="card-header">
                <div class="caption">
                  <h6>
                    <img v-if="item.poster_photo" v-bind:src="'/user/avatar/'+item.poster_photo" class="post-avatar rounded-circle mr-2"/>
                    <img v-else src="/assets/img/default.png" class="post-avatar rounded-circle mr-2"/>
                    {{item.poster}}
                  </h6>
                </div>
                <div class="actions">
                  <button class="btn btn-icon btn-outline-success">
                    <i class="icon-fa icon-fa-ellipsis-h"/>
                  </button>
                </div>
              </div>
              <div class="card-body">
                <p>{{item.content}}</p>
                <div v-if="item.youtubeURL" class="embed-responsive embed-responsive-16by9">
                  <iframe class="embed-responsive-item" v-bind:src="'https://www.youtube.com/embed/'+item.youtubeURL" allowfullscreen></iframe>
                </div>
                <img v-if="item.photoURL" class="danlazy img-fluid img-thumbnail mx-auto w-100 d-block rounded" v-bind:src="'/user/gallery/'+item.photoURL" width="320" height="240" alt="Portfolio Gallery with filtering category">
                <audio v-if="item.audioURL" controls>
                  <source v-bind:src="'/user/gallery/audio/'+item.audioURL">
                </audio>
              </div>
              <div class="card-footer">
                <div class="">
                  <p><i class="icon-fa icon-fa-thumbs-o-up"/>{{item.likes || 0 }} &#183; <i class="icon-fa icon-fa-comments-o"/>{{item.comments || 0 }}</p>
                </div>
                <div class="">
                  <button class="btn btn-icon btn-outline-success" v-on:click="clickLike(index, item.id)">
                    <span v-if="item.liked"><i class="icon-fa icon-fa-lg icon-fa-thumbs-up"/> Unlike</span>
                    <span v-else><i class="icon-fa icon-fa-lg icon-fa-thumbs-o-up"/> Like</span>
                  </button>
                  <button class="btn btn-icon btn-outline-success"  v-on:click="clickComment(index, item.id)">
                    <i class="icon-fa icon-fa-lg icon-fa-comments-o"/>
                  </button>
                </div>
                <div v-if="!item.isnew">
                  <form @submit.prevent="addCommentBeforeSubmit(index, item.id)">
                    <div class="input-group mt-3 mb-3 pl-5">
                      <input v-model="comments[index]" type="text" class="form-control" placeholder="Add a comment..." aria-label="Add a comment..." aria-describedby="basic-addon2">
                      <div class="input-group-append">
                        <button class="btn btn-success text-dark input-group-text" id="basic-addon2">
                          <i class="icon-fa icon-fa-lg icon-fa-comments-o"/>
                          Comment
                        </button>
                      </div>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
      </div>
      <infinite-loading @infinite="infiniteHandler"></infinite-loading>
    </div>
  </section>
</template>

<script type="text/babel">
import InfiniteLoading from 'vue-infinite-loading';
import Posts from './../../services/posts'

export default {
  data () {
    return {
      comments:[],
      lastPage:1,
      page: 0,
      posts: []
    }
  },
  methods: {
    infiniteHandler($state) {
      if(this.page<this.lastPage){
        Posts.getPosts(this.page).then((res)=>{
          if(res.status==401){
            return this.$router.push('/login')
          }
          this.posts = this.posts.concat(res.data.posts);
          this.lastPage = res.data.lastPage;
          $state.loaded();
          this.page++;
        })
      }else{
        $state.complete();
      }
    },
    clickLike(index, post_id){
      this.posts[index].liked = !this.posts[index].liked
      if(this.posts[index].liked)
        this.posts[index].likes++;
      else
        this.posts[index].likes--;
      //API Request
      Posts.addPostLike(post_id).then((res)=>{
          toastr['success']((res.isLike)?'Liked':'Unliked', 'Success');
      })
    },
    clickComment(index, post_id){
      this.posts[index].isnew = !this.posts[index].isnew;
    },
    addCommentBeforeSubmit(index, post_id){
      if(!this.comments[index]){
        return
      }
      //API Request
      Posts.addPostComment(post_id, this.comments[index]).then((res)=>{
          toastr['success']('Commented!', 'Success');
          this.posts[index].comments++;
          this.posts[index].isnew = !this.posts[index].isnew;
      })
    }
  },
  components: {
    InfiniteLoading,
  },
}
</script>
