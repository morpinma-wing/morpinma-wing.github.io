import './SignIn.css';
import Background from '../components/Background';
import { signInBtn } from '../Backend';

function SignIn() {
  return (
    <div>
      <Background>

        <section >

          <button id = "signInBtn" onClick={signInBtn}>Sign in with Google</button>

        </section>

        <section>

          <button id = "signOutBtn">Sign Out</button>

        </section>

      </Background>
    </div>
  );
}

export default SignIn;
