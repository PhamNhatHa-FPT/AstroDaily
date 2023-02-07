// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAuth } from "firebase/auth";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyCawhsDcP1SpW39wRqqGbhzRixHm2v3xy8",
  authDomain: "astrology-c0fb2.firebaseapp.com",
  projectId: "astrology-c0fb2",
  storageBucket: "astrology-c0fb2.appspot.com",
  messagingSenderId: "275199646634",
  appId: "1:275199646634:web:3c99fda34dbd3a764fe9d3",
  measurementId: "G-H1NDJJFFSX"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
export const auth = getAuth(app);
export default app;
