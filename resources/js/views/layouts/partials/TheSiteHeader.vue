<template>
  <header class="site-header navbar justify-content-between">
    <div class="container">
      <a href="#" class="brand-main">
        <img
          id="logo-desk"
          src="/images/sunroad_logo-04.png"
          alt="Sunroad Logo"
          class="d-none d-md-inline"
        >
        <img
          id="logo-mobile"
          src="/images/sunroad_logo-04.png"
          alt="Sunroad Logo"
          class="d-md-none"
        >
      </a>
      <a
        href="#"
        class="nav-toggle"
        @click="onNavToggle"
      >
        <div class="hamburger hamburger--arrowturn">
          <div class="hamburger-box">
            <div class="hamburger-inner"/>
          </div>
        </div>
      </a>
      <ul class="action-list nav nav-pills nav-justified flex-grow-1">
        <li class="nav-item">
          <router-link class="text-success" to="/">Home</router-link>
        </li>
        <li class="nav-item ">
          <router-link class="text-success" to="/messages">Messages</router-link>
        </li>
        <div class="rounded-circle "></div>
        <li class="nav-item ">
          <router-link class="text-success" to="/friends">Friends</router-link>
        </li>
        <li class="nav-item ">
          <router-link class="text-success" to="/discover">Discover</router-link>
        </li>
        <li class="nav-item ">
          <router-link class="text-success" to="/settings">Settings</router-link>
        </li>
        <li class="nav-item">
          <a class="text-success" href="#" @click.prevent="logout()">Logout</a>
        </li>
      </ul>
    </div>
  </header>
</template>
<script type="text/babel">
import Auth from '../../../services/auth'

export default {
  methods: {
    onNavToggle () {
      this.$utils.toggleSidebar()
    },
    logout () {
      Auth.logout().then(() => {
        this.$router.replace('/login')
      })
    }
  }
}
</script>
