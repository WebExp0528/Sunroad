<template>
  <div class="template-container">
    <div class="container pt-5">
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
