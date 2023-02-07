import { onAuthStateChanged } from "firebase/auth";
import React, { useState, useEffect } from 'react';
import Background from "../components/Background";
import "./MainWorld.css";
import "../styles.css";
import { Link } from "react-router-dom";
import { getUserGameData, signInClick, signOutClick, auth } from '../scripts/Backend';
import CubstartText from "../components/CubstartText";

function MainWorld() {
  const [signedIn, setSignedIn] = useState(false);
  const [setUser] = useState(null);
  const [userGameData, setUserGameData] = useState({ username: "" });
  const [rendered, setRendered] = useState(false);

  useEffect(() => {
    document.title = "MainWorld";
}, []);

  // onAuthStateChanged detects if the user signs in or signs out. 
  onAuthStateChanged(auth, async (user) => {
    // user argument is null if a user signs out.
    if (user) {
      if (!signedIn) {
        // If a user signs in:
        setSignedIn(true);
        setUser(user);
        const userData = await getUserGameData(user);
        setUserGameData(userData);
      }
    } else if (signedIn) {
        setSignedIn(false);
        setUser(null);
        setUserGameData({ username: "" });
    }
    if (!rendered) {
      setRendered(true);
    }
  });


  if (!rendered) {
    return (
      <Background />
    )
  }

  if (!signedIn) {
    return (
      <Background>
        <div className="outerContainer">
          <div className="innerContainer">
            <h1 className="text title purple">
              Welcome!
            </h1>
            <h2 className="text description">
              Please sign in to play.
            </h2>
            <div onClick={signInClick} className="button">
              <h1 className="text buttonText">
                Sign in with Google
              </h1>
            </div>
          </div>
          <div className="bottomContainer">
            <CubstartText/>
          </div>
        </div>
      </Background>
    )
  }
  
  return (
    <Background>
      <div className="outerContainer">
        <div className="innerContainer">
          <h1 className="text title purple">
            Welcome,{` `}{userGameData.username}!
          </h1>
          <h2 className="text description">
            Head to the <Link to="/PcPost/NewPost" className="link linkText">play tab</Link> to begin.
          </h2>
          <div onClick={signOutClick} className="button">
            <h1 className="text buttonText">
              Sign Out
            </h1>
          </div>
        </div>

        <div className="bottomContainer">
          <CubstartText/>
        </div>
      </div>
    </Background>
    
  )
}

export default MainWorld;
