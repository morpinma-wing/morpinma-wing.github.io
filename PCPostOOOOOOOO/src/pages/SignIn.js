import React, { useState, useEffect } from 'react';
import Background from '../components/Background';
import "../styles.css";
import "./SignIn.css"

export default function SignIn() {
    const [rendered] = useState(false);

    useEffect(() => {
        document.title = "SignIn";
    }, []);

    if (!rendered) {
        return (
            <Background />
        );
    }

    return (
        <Background>
            <div className="outerContainer">
                
            </div>
        </Background>
    )
}