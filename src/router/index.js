import { createRouter, createWebHistory } from "vue-router";
import HomeView from "../pages/views/HomeView.vue";
import AboutView from "../pages/views/AboutView.vue";
import RegistrationView from "../pages/views/RegistrationView.vue";
import LoginView from "../pages/views/LoginView.vue";
import NotFound from "../pages/NotFound.vue";
import CreateTestView from "../pages/views/CreateTestView.vue";
import AdminPanelView from "../pages/views/AdminPanelView.vue";
import WifiView from "../pages/views/WifiView.vue";
import InternetView from "../pages/views/InternetView.vue";
import TestPage from "../pages/TestPage.vue";
import TestForm from "../components/TestForm.vue";
import StudentPanelView from "../pages/views/StudentPanelView.vue";
import VlcView from "../pages/views/VlcView.vue";
import LifiView from "../pages/views/LifiView.vue";


import store from "../store/index.js";

const router = createRouter({
  history: createWebHistory(),
  routes: [
    { path: "/", name: "home", component: HomeView },
    //{ path: '', name: '', component: }, //topics
    { path: "/lifi", name: "lifi", component: LifiView },
    { path: "/vlc", name: "vlc", component: VlcView },
    { path: "/wifi", name: "wifi", component: WifiView},
    { path: '/internet', name: 'internet', component: InternetView },
    { path: "/about", name: "about", component: AboutView },
    { path: "/login", name: "login", component: LoginView },
    { path: "/register", name: "register", component: RegistrationView },
    {
      path: "/test/:course",
      component: TestPage,
      props: true,
      children: [
        { path: ':id/:title', component: TestForm, props: true } // /test/course/id
      ]
    },
    {
      path: "/student",
      name: "student",
      component: StudentPanelView,
      meta: { requiresAuth: true, requiresStudent: true },
    },
    {
      path: "/createtest",
      name: "createtest",
      component: CreateTestView,
      meta: { requiresAuth: true, requiresTeacher: true },
    },
    {
      path: "/adminpanel",
      name: "adminpanel",
      component: AdminPanelView,
      meta: { requiresAuth: true, requiresAdmin: true },
    },
    { path: "/:notFound(.*)", component: NotFound },
  ],
});

router.beforeEach((to, _, next) => {
  let role = store.getters.userRole;
  let localRole = localStorage.getItem("role");

  if (to.meta.requiresAuth) {
    if (!role && !localRole) {
      router.replace("/login");
    } else {
      if (to.meta.requiresAdmin) {
        if (role === "admin" || localRole === "admin") {
          return next();
        } else {
          router.replace("/login");
        }
      }
      if (to.meta.requiresTeacher) {
        if (
            role === "teacher" ||
            localRole === "teacher" ||
            role === "admin" ||
            localRole === "admin"
        ) {
          return next();
        } else {
          router.replace('/login');
        }
      }
      if (to.meta.requiresStudent) {
        if (
            role === "student" ||
            localRole === "student" ||
            role === "admin" ||
            localRole === "admin"
        ) {
          return next();
        } else {
          router.replace('/login');
        }
      }
    }
  } else {
    return next();
  }
});

export default router;
