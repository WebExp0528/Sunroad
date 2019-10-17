<template>
  <div class="sidebar-left">
    <div class="sidebar-body scroll-pane">
      <div class="side-nav">
        <nav class="sidebar-nav ps ps--active-y">
            <div>
                <div class="card border-success mb-0">
                    <div class="card-header">
                        <div class="d-flex justify-content-center" style="background-image:">
                          <img v-if="user.photoURL" v-bind:src="'/user/avatar/'+user.photoURL" class="profile-logo rounded-circle img-thumbnail mr-2"/>
                          <img v-else src="/assets/img/default.png" class="img-thumbnail profile-logo rounded-circle mr-2"/>
                        </div>
                    </div>
                    <div class="card-body text-success">
                        <h5 class="card-title text-center">{{user.displayName}}</h5>
                        <p class="card-text text-center">{{user.email}}</p>
                    </div>
                </div>
                <div class="card border-success mb-0">
                    <div class="card-header text-dark">{{user.about}}</div>
                    <div class="card-body text-success">
                        <p class="card-text">{{user.bio}}</p>
                    </div>
                </div>
                <div class="card border-success mb-0">
                    <div class="card-header text-dark">
                        Featured Content
                    </div>
                    <div class="card-body text-success">
                        
                    </div>
                </div>
            </div>

            <div class="ps__rail-x" style="left: 0px; bottom: 0px;">
                <div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div>
            </div>
            <div class="ps__rail-y" style="top: 0px; height: 869px; right: 0px;">
                <div class="ps__thumb-y" tabindex="0" style="top: 0px; height: 415px;"></div>
            </div>
        </nav>
      </div>
    </div>
  </div>
</template>

<script type="text/babel">
import User from './../../../services/user.js'

export default {
  data () {
    return {
      user: {}
    }
  },
  mounted(){
    User.getUser().then((res)=>{
      if (!res) {
        this.$router.push('/login');
      }
      this.user = res;
    });
  }
}
</script>
