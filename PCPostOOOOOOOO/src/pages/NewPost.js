import { onAuthStateChanged} from "firebase/auth";
import React, { useState, useEffect } from "react";
import Background from "../components/Background";
import { Link } from "react-router-dom";
import "../styles.css";
import "./NewPost.css";
import { getUserGameData, auth } from "../scripts/Backend";


function NewPost() {
  const [signedIn, setSignedIn] = useState(false);
  const [setUserGameData] = useState({ money: 0, totalMoney: 0, mostMoney: 0, viewers: 1, hoursStreamed: 0, upgrades: {}, passiveIncomeUpgrades: {} });
  const [rendered, setRendered] = useState(false);

  useEffect(() => {
    document.title = "NewPost";
  }, []);

  // detect if the user has already signed in or not. 
  onAuthStateChanged(auth, async (user) => {
    if (user) {
      if (!signedIn) {
        setSignedIn(true);
        const userData = await getUserGameData(user);
        setUserGameData(userData);
      }
    } else if (signedIn) {
        setSignedIn(false);
        setUserGameData({ username: "" });
    }
    if (!rendered) {
      setRendered(true);
    }
  });

  if (!rendered) {
    return (
      <Background />
    );
  }

  if (!signedIn) {
    return (
      <Background>
        <div className="outerContainer">
          <h1 className="text title">
            Please <Link to="/SignIn" className="link linkText">sign in</Link> to play.
          </h1>
        </div>
      </Background>
    );
  }
  
  return (
    <Background>
    </Background>
  );
}

export default NewPost;
