<template>
  <section class="section section-hero-area" style="margin-top:60px; padding-bottom:80px">
    <div class="container text-sm-center">
      <p v-for="item in posts" v-bind:key="item">
        Line:
        <span v-text="item"></span>
      </p>
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
      page: 0,
      posts: []
    }
  },
  methods: {
    infiniteHandler($state) {
      Posts.getPosts(this.page).then((res)=>{
        this.posts = this.posts.concat("asdfasdasd");
        $state.loaded();
        this.page = this.page+1;
      })
    },
  },
  components: {
    InfiniteLoading,
  },
}
</script>
