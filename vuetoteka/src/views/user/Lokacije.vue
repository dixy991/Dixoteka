<template>
  <v-container id="google-maps" tag="section" class="my-15">
    <v-row>
      <v-col cols="12">
        <base-material-card color="pink lighten-3" title="Lokacije" class="px-5 py-3">
          <div class="d-flex align-start">
            <div class="w-100">
              <div v-for="(location,i) in locations" :key="i">
                <LocationItem :location="location"></LocationItem>
              </div>
            </div>
            <v-card-text class="px-0 pb-0 d-flex justify-end">
              <v-sheet>
                <iframe
                  src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d26356315.701909266!2d-113.65984645545673!3d36.25591957613731!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x54eab584e432360b%3A0x1c3bb99243deb742!2sUnited+States!5e0!3m2!1sen!2sus!4v1566158729223!5m2!1sen!2sus"
                  width="425"
                  height="435"
                  frameborder="0"
                  style="border:0"
                  allowfullscreen
                />
              </v-sheet>
            </v-card-text>
          </div>
        </base-material-card>
      </v-col>
    </v-row>
  </v-container>
</template>
<script>
import LocationItem from "../../components/user/LocationItem.vue";

export default {
  name: "Lokacije",
  mounted() {
    this.locations = this.$store.state.locations;
  },
  data: () => ({
    locations: null
  }),
  components: {
    LocationItem
  }
};
</script>