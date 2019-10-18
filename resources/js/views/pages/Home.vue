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
              <!-- Post body TODO: making a component-->
              <div class="card-body">
                <p>{{item.content}}</p>
                <div v-if="item.youtubeURL" class="embed-responsive embed-responsive-16by9">
                  <iframe class="embed-responsive-item" v-bind:src="'https://www.youtube.com/embed/'+item.youtubeURL" allowfullscreen></iframe>
                </div>
                <img v-if="item.photoURL" class="danlazy img-fluid img-thumbnail mx-auto w-100 d-block rounded" v-bind:src="'/user/gallery/'+item.photoURL">
                <audio v-if="item.audioURL" controls>
                  <source v-bind:src="'/user/gallery/audio/'+item.audioURL">
                </audio>
              </div>
              <!-- Post footer TODO: making a component -->
              <div class="card-footer">
                <div class="">
                  <p>
                    <!-- <i class="icon-fa icon-fa-thumbs-o-up"/> -->
                    <img class="icon-dig-sm" src="/assets/img/shovel1_2.png" >
                    {{item.likes || 0 }} &#183; 
                    <span class="fake-link" v-on:click="getComments(item.id)">
                      <!-- <i class="icon-fa icon-fa-comments-o"/> -->
                      <img class="icon-comment-sm" src="/assets/img/coin1_1.png" >
                      {{item.comments || 0 }}
                    </span>
                  </p>
                </div>
                <div class="">
                  <button class="btn btn-outline-success" v-on:click="clickLike(index, item.id)">
                    <span v-if="item.liked">
                      <!-- <i class="icon-fa icon-fa-lg icon-fa-thumbs-up"/> -->
                      <img class="icon-dig-md" src="/assets/img/shovel1_2.png" >
                       Dig
                    </span>
                    <span v-else>
                      <!-- <i class="icon-fa icon-fa-lg icon-fa-thumbs-o-up"/> -->
                      <img class="icon-dig-md" src="/assets/img/shovel1_1.png" >
                       Dig
                    </span>
                  </button>
                  <button class="btn btn-outline-success"  v-on:click="clickComment(index, item.id)">
                    <!-- <i class="icon-fa icon-fa-lg icon-fa-comments-o"/> -->
                    <img class="icon-comment-md" src="/assets/img/coin1_1.png" >
                     Comment
                  </button>
                </div>
                <!-- Add comments TODO: Making a component-->
                <transition name="fade" mode="out-in">
                  <div v-if="!item.isnew" class="d-flex alin-content-center p-2">
                    <div class="">
                        <img v-if="user.photoURL" v-bind:src="'/user/avatar/'+user.photoURL" class="post-avatar rounded-circle mr-2"/>
                        <img v-else src="/assets/img/default.png" class="post-avatar rounded-circle mr-2"/>
                    </div>
                    <div class="flex-grow-1 d-flex ml-1">
                      <form @submit.prevent="addCommentBeforeSubmit(index, item.id)" class="flex-grow-1">
                        <div class="input-group">
                          <input v-model="newComments[index]" type="text" class="form-control" placeholder="Add a comment..." aria-label="Add a comment..." aria-describedby="basic-addon2">
                          <div class="input-group-append">
                            <button v-bind:class="{'btn':true, 'btn-outline-success':true, 'input-group-text':true, 'active':newComments[index]}" id="basic-addon2">
                              <!-- <i class="icon-fa icon-fa-lg icon-fa-comments-o"/> -->
                              <img class="icon-comment-md" src="/assets/img/coin1_1.png" >
                              Comment
                            </button>
                          </div>
                        </div>
                      </form>
                    </div>
                  </div>
                </transition>
                <!-- Show Comments TODO: Making a component -->
                <div v-if="comments[item.id]">
                  <div v-for="comment in comments[item.id]" :key="comment.id" class="d-flex p-2">
                    <div class="">
                      <img v-if="comment.commenter_photo" v-bind:src="'/user/avatar/'+comment.commenter_photo" class="post-avatar rounded-circle mr-2"/>
                      <img v-else src="/assets/img/default.png" class="post-avatar rounded-circle mr-2"/>
                    </div>
                    <div class="flex-grow-1 ml-1 p-2 bg-light rounded-lg d-flex">
                      <div flex-grow-1>
                        <h5>{{comment.commenter_name}}</h5>
                        <p>{{comment.description}}</p>
                      </div>
                      <div class="actions ml-auto">
                        <button class="btn btn-icon">
                          <i class="icon-fa icon-fa-ellipsis-h"/>
                        </button>
                      </div>
                    </div>
                  </div>
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
      newComments:[],
      lastPage:1,
      page: 0,
      posts: [],
      comments:[],
      user:{}
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
          this.user = res.data.user
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
          toastr['success']((res.data.isLike)?'Liked':'Unliked', 'Success');
      })
    },
    clickComment(index, post_id){
      this.posts[index].isnew = !this.posts[index].isnew;
    },
    addCommentBeforeSubmit(index, post_id){
      if(!this.newComments[index]){
        return
      }
      //API Request
      Posts.addPostComment(post_id, this.newComments[index]).then((res)=>{
          toastr['success']('Commented!', 'Success');
          this.newComments[index] = '';
          this.posts[index].comments++;
          this.posts[index].isnew = !this.posts[index].isnew;

          if(this.comments[post_id]){
            this.getComments(post_id);
          }
      })
    },
    getComments(post_id){
      Posts.getCommentsforPost(post_id).then((res)=>{
          this.$set(this.comments, post_id, res);
          console.log(this.comments);
      })
    },
  },
  components: {
    InfiniteLoading,
  },
}
</script>
