import { createRouter, createWebHistory } from "vue-router";
import HomeView from "../pages/views/HomeView.vue";
import AboutView from "../pages/views/AboutView.vue";
import RegistrationView from "../pages/views/RegistrationView.vue";
import LoginView from "../pages/views/LoginView.vue";
import NotFound from "../pages/NotFound.vue";
import CreateTestView from "../pages/views/CreateTestView.vue";
import AdminPanelView from "../pages/views/AdminPanelView.vue";
import CourseTest1 from "../pages/views/CourseTest1.vue";
import CourseTest2 from "../pages/views/CourseTest2.vue";

import store from "../store/index.js";

const router = createRouter({
  history: createWebHistory(),
  routes: [
    { path: "/", name: "home", component: HomeView },
    //{ path: '', name: '', component: }, //topics
    { path: '/course1', name: 'course1', component: CourseTest1 },
    { path: '/course2', name: 'course2', component: CourseTest2 },
    { path: "/about", name: "about", component: AboutView },
    { path: "/login", name: "login", component: LoginView },
    { path: "/register", name: "register", component: RegistrationView },
    {
      path: "/createtest",
      name: "createtest",
      component: CreateTestView,
      meta: { requiresAuth: true,
        requiresTeacher: true
      },
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

// router.beforeEach((to, _, next) => {
//   if(to.meta.requiresAuth && !store.getters.isTeacher && !store.getters.isAdmin){ //store.getters.getUserRole
//     next('/login');
//   }
//   else if(to.meta.requiresAuth && to.meta.requiresAdmin && store.getters.isAdmin){
//     next();
//   }
//   else if(to.meta.requiresAuth && store.getters.isTeacher){
//     next();
//   }
//   else {
//     next();
//   }

// });

router.beforeEach((to, _, next) => {
  let role = store.getters.userRole;

  if (to.meta.requiresAuth) {
    if (!role) {
      router.replace('/login');
    } else {
      if (to.meta.requiresAdmin) {
        if (role === "admin") {
          return next();
        } else {
          router.replace('/login');
        }
      } else if (to.meta.requiresTeacher) {
        if (role === "teacher" || role === 'admin') {
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
