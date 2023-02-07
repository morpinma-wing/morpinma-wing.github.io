import "./HeaderBar.css";
import "../styles.css";
import { Link } from "react-router-dom";
import React  from 'react';

export default function HeaderBar() {
    return (
        <div className="header">
            <h1 className="text siteName purple">
                PCPost
            </h1>
            <div className="row">
                <Link to="/PCPost" className="link">
                    <div>
                        <h1 className="text tabTitle">
                            MainWorld
                        </h1>
                    </div>
                </Link>
                <Link to="/PCPost/NewPost" className="link">
                    <div>
                        <h1 className="text tabTitle">
                            NewPost
                        </h1>
                    </div>
                </Link>
                <Link to="/PCPost/SignIn" className="link">
                    <div>
                        <h1 className="text tabTitle">
                            SignIn
                        </h1>
                    </div>
                </Link>
            </div>
        </div>
    );
}