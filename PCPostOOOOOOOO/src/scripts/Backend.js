import { initializeApp } from "firebase/app";
import { getAuth, signInWithPopup, signOut, GoogleAuthProvider } from "firebase/auth";
import { getFirestore, setDoc, collection, query, where, getDocs, doc, orderBy, limit } from "firebase/firestore";

const firebaseConfig = {
    apiKey: "AIzaSyBD8L8DqdZ4uVglEysgt25E",
    authDomain: "clicker-game-1769c.firebaseapp.com",
    projectId: "clicker-game-1769c",
    storageBucket: "clicker-game-1769c.appspot.com",
    messagingSenderId: "994622765499",
    appId: "1:994622765499:web:f455ddee094094c870ac9e"
};

const app = initializeApp(firebaseConfig);

// Setting up Authentication
const auth = getAuth(app);
const provider = new GoogleAuthProvider();

// Setting up db
const db = getFirestore(app);
const collectionRef = collection(db, "usergamedata");

// gets user game data or initialize data if the user is a first time player
const getUserGameData = async (user) => {
    const q = query(collectionRef, where("uid", "==", user.uid));
    const querySnapshot = await getDocs(q);

    // if userData does not exist, generate it with default values
    if (querySnapshot.docs.length === 0) {
        await initializeUser(user.uid, user.displayName);
        return await getUserGameData(user);
    }

    const userData = querySnapshot.docs[0].data();
    return userData;
}

const saveUser = async (userData) => {
    await setDoc(doc(collectionRef, userData.uid), userData);
}

const initializeUser = async (userId, username) => {
    await setDoc(doc(collectionRef, userId), {
        uid: userId,
        username: username,
        money: 0,
        totalMoney: 0,
        mostMoney:1,
        viewers: 1,
        hoursStreamed: 0,
        mosthoursStreamed: 0,
        upgrades: {},
        passiveIncomeUpgrades: {}
    });
}

const signInClick = () => {
    signInWithPopup(auth, provider);
};

const signOutClick = () => {
    signOut(auth, provider);
};

const getLeaderboardData = async () => {
    const q = query(collectionRef, orderBy("viewers", "desc"), limit(10));
    const querySnapshot = await getDocs(q);
    const data = querySnapshot.docs.map((doc) => doc.data());
    return data;
}

const getViewerData = async () => {
    const q = query(collectionRef, orderBy("viewers", "desc"), limit(1));
    const querySnapshot = await getDocs(q);
    const data = querySnapshot.docs.map((doc) => doc.data());
    return data[0];
}

const getCurrentMoneyData = async () => {
    const q = query(collectionRef, orderBy("money", "desc"), limit(1));
    const querySnapshot = await getDocs(q);
    const data = querySnapshot.docs.map((doc) => doc.data());
    return data[0];
}

const getTotalMoneyData = async () => {
    const q = query(collectionRef, orderBy("totalMoney", "desc"), limit(1));
    const querySnapshot = await getDocs(q);
    const data = querySnapshot.docs.map((doc) => doc.data());
    return data[0];
}

const getHourData = async () => {
    const q = query(collectionRef, orderBy("hoursStreamed", "desc"), limit(1));
    const querySnapshot = await getDocs(q);
    const data = querySnapshot.docs.map((doc) => doc.data());
    return data[0];
}

export { getUserGameData, signInClick, signOutClick, saveUser, auth, getLeaderboardData, initializeUser,
    getViewerData, getTotalMoneyData, getHourData, getCurrentMoneyData };