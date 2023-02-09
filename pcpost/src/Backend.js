// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
import { getAuth , GoogleAuthProvider, signInWithPopup, signOut} from "firebase/auth";
import { getFirestore, collection, getDocs } from 'firebase/firestore/lite';
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyC_xm-6GQx4xUdUtxfYbupLVGq0ye_2iFA",
  authDomain: "pcpost.firebaseapp.com",
  projectId: "pcpost",
  storageBucket: "pcpost.appspot.com",
  messagingSenderId: "21356470395",
  appId: "1:21356470395:web:1320f0abfd52ecf94a42de",
  measurementId: "G-D3TD9X8E1J"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);

// Setting up Authentication
const auth = getAuth(app);
const provider = new GoogleAuthProvider();

// When the sign-in button is clicked, the pop-up window will appear for users to sign in via Google.
const signInBtn = () => signInWithPopup(auth, provider);

// When the sign-out button is clicked, the user is signed out and the page reloads.
const signOutBtn = () => {
    signOut(auth, provider);
}


// Get Firebase Database
const db = getFirestore(app);


export {signInBtn};