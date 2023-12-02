<template>
  <base-dialog :show="!!error" title="Chyba!" @close="handleError">
    <p>{{ error }}</p>
  </base-dialog>
  <base-dialog :show="isLoading" title="Načítanie..." fixed>
    <base-spinner></base-spinner>
  </base-dialog>
  <v-overlay
      v-model="editUserOverlay"
      contained
      class="align-center justify-center"
  >
    <base-card>
      <h2>Opraviť detaily osobných údajov používateľov</h2>
      <div class="modal-body">
        <registration-formkit
            :admin="'admin'"
            :user="user"
            :edit="true"
            @edit-user="saveEditedUserData"
        ></registration-formkit>
      </div>
    </base-card>
  </v-overlay>
  <v-overlay
      v-model="editTestOverlay"
      contained
      class="align-center justify-center"
  >
    <base-card>
      <h2>Opraviť detaily testov</h2>
      <div class="modal-body">
        <create-test-form
            :test="test"
            :edit="true"
            @edit-test="saveEditedTest"
        ></create-test-form>
      </div>
    </base-card>
  </v-overlay>
  <v-overlay
      v-model="showCourseOverlay"
      contained
      class="align-center justify-center"
  >
    <base-card>
      <h2>Vybratý návrh nového kurzu</h2>
      <p>Návrh kurzu môžete editovať a následne uložiť stlačením tlačidla 'Uložiť zmeny'.</p>
      <div class="modal-body">
        <create-course-form
            :content="content"
            :edit="true"
            @edit-course="saveEditedCourse"
            @close="closeOverlay"
        ></create-course-form>
      </div>
    </base-card>
  </v-overlay>
  <section>
    <base-card>
      <br />
      <h1>Správcovský panel</h1>
      <base-card>
        <h2>Používatelia</h2>
        <br />
        <users-table
            :users="users"
            @delete-user="deleteUser"
            @edit-user="loadEditUser"
        ></users-table>
        <br />
        <h2>Všetky testy</h2>
        <br />
        <tests-table
            :tests="tests"
            :tableheads="testTableheads"
            @edit-test="loadEditTest"
            @delete-test="deleteTest"
        ></tests-table>
        <br />
        <h2>Všetky výsledky</h2>
        <br />
        <results-table :results="results"></results-table>
        <br />
      </base-card>
      <base-button @click="moveUp">Späť na začiatok</base-button>
    </base-card>
    <base-card>
      <h2>Pridať nového Admina (alebo používateľa)</h2>
      <base-card>
        <registration-formkit
            :admin="'admin'"
            :edit="false"
            @register-user="addNewOrEditUser"
        ></registration-formkit>
      </base-card>
      <base-button @click="moveUp">Späť na začiatok</base-button>
    </base-card>

    <base-card>
      <h2>Navrhnuté kurzy</h2>
      <br/>
      <courses-table
          :courses="courses"
          @delete-course="deleteCourse"
          @show-course="showCourse"
      ></courses-table>
      <br/>
      <base-button @click="moveUp">Späť na začiatok</base-button>
    </base-card>
  </section>
</template>

<script>
import UsersTable from "../../components/UsersTable.vue";
import TestsTable from "../../components/TestsTable.vue";
import ResultsTable from "../../components/ResultsTable.vue";
import CoursesTable from "@/components/CoursesTable";
import RegistrationFormkit from "../../components/RegistrationFormkit.vue";
import CreateTestForm from "../../components/CreateTestForm.vue";
import CreateCourseForm from "@/components/CreateCourseForm";

export default {
  components: {
    UsersTable,
    RegistrationFormkit,
    CreateTestForm,
    TestsTable,
    ResultsTable,
    CoursesTable,
    CreateCourseForm,
  },
  data() {
    return {
      users: [],
      tests: [],
      courses:[{id: '2', username:'zoli', title: 'name'},],
      user: [],
      test: [],
      content:[],
      results: [],
      testTableheads: ["Title", "Course", "Username", "Možnosti"],
      isLoading: false,
      error: null,
      editUserOverlay: false,
      editTestOverlay: false,
      showCourseOverlay: false,
      selectedCourseId: null,
    };
  },
  created() {
    this.loadData();
  },
  methods: {
    async loadData() {
      const usersPayload = new FormData();
      usersPayload.append("action", "getAllUsers");
      const testsPayload = new FormData();
      testsPayload.append("action", "getAllTests");
      const resultsPayload = new FormData();
      resultsPayload.append("action", "get-testResults");
      const coursesPayload = new FormData();
      coursesPayload.append("action", "getAllCourses");
      try {
        await this.$store.dispatch("adminpanel/loadAllUsers", usersPayload);
        this.users = await this.$store.getters["adminpanel/getUsers"];
        await this.$store.dispatch("test/fetchTests", testsPayload);
        this.tests = await this.$store.getters["test/getTests"];
        await this.$store.dispatch("test/testResults", resultsPayload);
        this.results = await this.$store.getters["test/getResults"];
        await this.$store.dispatch("course/fetchCourses", coursesPayload);
        this.courses = await this.$store.getters["course/getCourses"];
      } catch (error) {
        this.error = error;
      }
    },
    async addNewOrEditUser(data) {
      this.isLoading = true;
      try {
        await this.$store.dispatch("userRegistration", data);
        setTimeout(() => {
          this.isLoading = false;
          this.moveUp();
        }, 600);
      } catch (err) {
        setTimeout(() => {
          this.isLoading = false;
          this.error = err;
        }, 600);
      }
    },
    handleError() {
      this.error = null;
    },
    moveUp() {
      window.scrollTo(0, 0);
    },
    deleteUser(id) {
      const payload = new FormData();
      payload.append("id", id);
      payload.append("action", "deleteUser");
      try {
        let userUnderDelete = this.users.find((user) => user.id == id);
        if (this.$store.getters["userId"] == userUnderDelete.username) {
          setTimeout(() => {
            this.$store.dispatch("autoLogout");
          }, 600);
        }
        this.$store.dispatch("adminpanel/deleteUser", payload);
        this.$store.dispatch(
            "test/updateResultsAfterUserDelete",
            userUnderDelete.username
        );
        this.users = this.$store.getters["adminpanel/getUsers"];
        this.results = this.$store.getters["test/getResults"];
      } catch (err) {
        this.error = err;
      }
    },
    deleteCourse(id) {
      console.log(id)
      const payload = new FormData();
      payload.append("id", id);
      payload.append("action", "deleteCourse");
      try {
        this.$store.dispatch("course/deleteCourse", payload);
        this.courses = this.$store.getters["course/getCourses"];
      } catch (err) {
        this.error = err;
      }
    },
    deleteTest(id) {
      const payload = new FormData();
      payload.append("id", id);
      payload.append("action", "deleteTest");
      try {
        this.$store.dispatch("test/deleteTest", payload);
        this.tests = this.$store.getters["test/getTests"];
      } catch (err) {
        this.error = err;
      }
    },
    loadEditUser(id) {
      window.scrollTo(0, 0);
      this.editUserOverlay = true;
      this.user = this.users.find((user) => user.id == id);
    },
    async showCourse(id) {
      //console.log(id)
      const coursePayload = new FormData();
      coursePayload.append("id", id);
      coursePayload.append("action", "getCompleteCourseById");
      try {
        await this.$store.dispatch("course/fetchCompleteCourse", coursePayload);
        this.content = await this.$store.getters["course/getCourseContent"];
      } catch (error) {
        this.error = error;
      }
      this.selectedCourseId = id;
      window.scrollTo(0, 0);
      this.showCourseOverlay = true;
    },
    saveEditedUserData(data) {
      this.editUserOverlay = false;
      this.addNewOrEditUser(data);
    },
    async loadEditTest(id) {
      const testsPayload = new FormData();
      testsPayload.append("id", id);
      testsPayload.append("action", "getCompleteTestById");
      try {
        await this.$store.dispatch("test/fetchCompleteTest", testsPayload);
        this.test = await this.$store.getters["test/getCompleteTest"];
      } catch (error) {
        this.error = error;
      }
      window.scrollTo(0, 0);
      this.editTestOverlay = true;
    },
    async saveEditedTest(data) {
      this.editTestOverlay = false;
      this.isLoading = true;
      try {
        await this.$store.dispatch("test/createNewTest", data);
        this.tests = await this.$store.getters["test/getTests"];
        setTimeout(() => {
          this.isLoading = false;
        }, 600);
      } catch (err) {
        setTimeout(() => {
          this.isLoading = false;
          this.error = err;
        }, 600);
      }
    },
    async saveEditedCourse(data) {
      this.showCourseOverlay = false;
      this.isLoading = true;
      data.append("id", this.selectedCourseId)
      try {
        await this.$store.dispatch("course/createNewCourse", data);
        //this.tests = await this.$store.getters["test/getTests"];
        setTimeout(() => {
          this.isLoading = false;
        }, 600);
      } catch (err) {
        setTimeout(() => {
          this.isLoading = false;
          this.error = err;
        }, 600);
      }
    },
    closeOverlay(){
      this.showCourseOverlay = false;
    }
  },
};
</script>