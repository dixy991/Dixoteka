<template>
  <v-container>
    <v-row>
      <v-col cols="4" class="pr-15">
        <router-link to="/">
          <v-img
            alt="Vuetify Logo"
            class="shrink mr-2 my-5"
            contain
            src="../../assets/img/group-11.svg"
            transition="scale-transition"
            width="200"
          />
        </router-link>
        <p class="pr-5">Prva specijalizovana prodavnica krofni, torti i iznenađenja u Srbiji.</p>
      </v-col>
      <v-col cols="4">
        <ul class="my-5">
          <li v-for="link in links" :key="link.name" class="mb-3">
            <router-link class="white--text" :to="link.path">{{link.name}}</router-link>
          </li>
        </ul>
      </v-col>

      <v-col cols="4">
        <ul class="my-5">
          <li v-for="slink in staticLinks" :key="slink.name" class="mb-3">
            <router-link class="white--text" :to="slink.path">{{slink.name}}</router-link>
          </li>
        </ul>
      </v-col>
    </v-row>
  </v-container>
</template>
<style scoped>
.v-footer {
  background-image: url("../../assets/img/357x299-slatkoteka-krofna.png");
  background-position: right bottom;
  background-size: 240px;
  min-height: 250px;
}
</style>
<script>
export default {
  name: "Footer",
  props: {
    links: {
      type: Array,
      required: true
    },
    staticLinks: {
      type: Array,
      required: true
    }
  }
};
</script>