export default {
    setCourses(state, payload) {
        state.courses = payload;
    },
    setCourseContent(state, payload) {
        state.content = payload;
    },
    deleteCourse(state, payload) {
        let index = state.courses.indexOf(
            state.courses.find((course) => course.id === payload)
        );
        state.courses.splice(index, 1);
    },
}