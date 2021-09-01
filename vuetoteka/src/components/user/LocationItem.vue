<template>
  <v-card elevation="2" class="pa-2 mt-5 w-100">
    <v-card-title class="text-h3">
      <v-icon color="pink lighten-3">mdi-map-marker</v-icon>
      &nbsp;{{location.title}}
    </v-card-title>
    <v-card-text class="black--text">{{location.description}}</v-card-text>
  </v-card>
</template>
<script>
export default {
  name: "LocationItem",
  props: {
    location: {
      type: Object,
      required: false
    }
  }
};
</script>