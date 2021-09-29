const admin = require("firebase-admin");
const functions = require("firebase-functions");

// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });

// Get Firestore object for db operations
admin.initializeApp();
const db = admin.firestore();

// Function to update total CaloriesBurnt field in User object when CaloriesBurnt
// is updated in an individual UserWorkout
exports.aggregateCaloriesBurnt = functions.firestore
    .document('User/{userID}/UserWorkouts/{workoutID}')
    .onUpdate(async (change, context) => {

        const calorieChange = change.after.data().CaloriesBurnt - change.before.data().CaloriesBurnt;

        const userRef = db.collection('User').doc(context.params.userID);

        await db.runTransaction(async (transaction) => {
            const userDoc = await transaction.get(userRef);

            const newCaloriesBurnt = userDoc.data().CaloriesBurnt + calorieChange;

            transaction.update(userRef, {
                CaloriesBurnt: newCaloriesBurnt
            });
        });
    });