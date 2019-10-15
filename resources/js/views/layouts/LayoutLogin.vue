<template>
  <div class="login-page login-1 d-flex align-items-center">
    <div class="container">
      <transition name="fade" mode="out-in">
        <router-view/>
      </transition>
    </div>
    <site-footer/>
  </div>
</template>

<script type="text/babel">
import SiteFooter from './partials/TheSiteFooter.vue'

export default {
  components: {
    SiteFooter
  }
}
</script>
