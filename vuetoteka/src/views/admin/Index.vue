<template>
  <v-app>
    <dashboard-core-app-bar />

    <dashboard-core-drawer />

    <dashboard-core-view />

    <dashboard-core-settings />
  </v-app>
</template>

<script>
export default {
  name: "DashboardIndex",

  components: {
    DashboardCoreAppBar: () => import("../../components/admin/AppBar"),
    DashboardCoreDrawer: () => import("../../components/admin/Drawer"),
    DashboardCoreSettings: () => import("../../components/admin/Settings"),
    DashboardCoreView: () => import("../../components/admin/View")
  },

  data: () => ({
    expandOnHover: false
  })
};
</script>
