<template>
  <v-app>
    <v-main class="pink lighten-5">
      <v-container class="my-10">
        <v-row>
          <v-col cols="12" class="text-center">
            <v-img
              class="mx-auto mb-3"
              src="../../assets/img/Poručivanje-header-420x280-1.png"
              width="500"
              height="400"
            ></v-img>
            <div class="my-5">
              <h1>Neko je pojeo ovu krofnu, pardon stranicu...</h1>
              <p>Stranica nije pronađena.</p>
            </div>
            <router-link to="/">
              <v-btn color="pink lighten-3 white--text">Vrati se na početnu stranicu</v-btn>
            </router-link>
          </v-col>
        </v-row>
      </v-container>
    </v-main>
  </v-app>
</template>