<html><head><style>@import url("https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css");

* {
    padding: 0;
    margin: 0;
    border: 0;
    outline: 0;
}

body {
    background: linear-gradient(-218deg, #231444 48%, #442e71 75%);
    font-family: sans-serif;
    color: #fff;
}

.container-login {
    height: 100vh;
    display: flex;
    flex-flow: column;
}

.header-login {
    width: 100%;
    background: #0b0121;
    border-bottom-style: solid;
    border-bottom-width: thick;
    border-bottom-color: #633fb3;
}

.header-login-box a {
    text-decoration: none;
    color: #fff;
}

.header-login-box a:hover {
    color: #633fb3;
}

.header-login-box {
    display: flex;
    padding: 15px 50px;
}

.header-text-position {
    flex: auto;
}

.login-box {
    display: flex;
    justify-content: center;
    top: 20%;
    position: sticky;
    animation: box-login 2s;
}

@keyframes box-login {
    0% {
        transform: rotateY(100deg);
    }
    50%,
    100% {
        transform: rotateY(0deg);
    }
}

.login {
    display: flex;
    flex-direction: column;
    width: 370px;
    padding: 20px;
    background-image: linear-gradient(-218deg, #0b0121 50%, #231444 66%);
    border-radius: 15px;
    box-shadow: 0 0 3px #0b012185, 0 0 5px #0b012185, 0 0 15px #0b012185, 0 0 40px #0b012185;
}

.login h1 {
    text-align: center;
    font-size: 26px;
    padding: 20px;
}

.login input {
    display: inherit;
    flex-direction: inherit;
    padding: 10px;
}

.login-input-icon {
    position: relative;
    align-self: flex-end;
    top: -38px;
    right: 15px;
    color: #633fb3;
    display: block;
}

::placeholder {
    color: rgb(136, 136, 136);
}

.login input[type="text"],
input[type="password"] {
    margin-bottom: 1em;
    background: rgba(255, 255, 255, 0);
    border-bottom-style: solid;
    border-bottom-width: thin;
    border-bottom-color: #633fb3;
    border-radius: 15px;
    color: #fff;
    animation: login-input-focus-initial 1s normal forwards;
    padding-right: 30px;
}

.login input[type="text"]:focus,
input[type="password"]:focus {
    animation: login-input-focus 1s normal forwards;
}

.login-checkbox {
    display: inherit;
    margin-bottom: 15px;
    color: rgb(136, 136, 136);
}

.login-checkbox input {
    opacity: 0;
    cursor: pointer;
}

.checkmark {
    height: 15px;
    width: 15px;
    background: #fff;
    cursor: pointer;
    border-radius: 5px;
}

.login input:checked ~ .checkmark {
    background-color: #633fb3;
}

.checkmark:after {
    content: "";
    display: none;
}

.login-checkbox input:checked ~ .checkmark:after {
    display: block;
}

.login .checkmark:after {
    left: 5px;
    top: 2px;
    width: 3px;
    height: 5px;
    border: solid white;
    border-width: 0 3px 3px 0;
    transform: rotate(45deg);
    position: relative;
}

.login button {
    cursor: pointer;
    padding: 20px;
    border-radius: 15px;
    font-weight: 700;
    color: #fff;
    background-image: linear-gradient(-218deg, #633fb3 70%, #c5abff 92%);
    animation: login-button 1s normal forwards;
}

.login button:hover {
    background-image: linear-gradient(-218deg, #4c2d8f 70%, #ae95e4 92%);
    animation: login-button-hover 1s normal forwards;
}

.login-social-media {
    display: inherit;
    justify-content: center;
    margin-top: 15px;
}

.login-social-media img {
    padding: 0 5px;
    cursor: pointer;
}

.login-separator {
    width: 70%;
    margin: auto;
    height: 2px;
    background: #633fb3;
    margin-top: 25px;
}

@keyframes login-input-focus-initial {
    0% {
        font-size: 12px;
    }
    50%,
    100% {
        font-size: 14px;
    }
}

@keyframes login-input-focus {
    0% {
        font-size: 14px;
    }
    50%,
    100% {
        font-size: 12px;
    }
}

@keyframes login-button {
    0% {
        background-size: 200%;
    }
    50%,
    100% {
        background-size: 100%;
    }
}

@keyframes login-button-hover {
    0% {
        background-size: 100%;
    }
    50%,
    100% {` 
        background-size: 200%;
    }
}
</style></head><body><div class="container-login">
        <div class="header-login">
            <div class="header-login-box">
                <span class="header-text-position">
                    <a href="SignUp.jsp">&nbsp;<i class="fa fa-user-plus"></i>&nbsp;&nbsp;Register</a>
                </span>
                <a href="#"><i class="fa fa-question"></i>&nbsp;&nbsp;Forgot Password?</a>
            </div>
        </div>
        <div class="login-box">
            <div class="login">
                <h1>Authentication</h1>
               <form action="UserController?op=login" method="post">
                <input id="username" type="text" placeholder="name" name="usermail" />
                <label for="username" class="login-input-icon">
                    <i class="fa fa-user"></i>
                </label>
                <input id="password" type="password" placeholder="password" name="userpassword" />
                <label for="password" class="login-input-icon">
                    <i class="fa fa-lock"></i>
                </label>
                <label class="login-checkbox">
                    <input type="checkbox">
                    <span class="checkmark"></span>&nbsp;&nbsp;Remember
                </label>
                <button type="submit" class="btn btn-primary btn-block btn-lg">login</button>
                </form>
                <span class="login-separator"></span>
                <div class="login-social-media">
                    <img src="https://i.imgur.com/VnezlZf.png" alt="Facebook" width="50px" height="50px">
                    <img src="https://i.imgur.com/yZteilF.png" alt="Linkedin" width="50px" height="50px">
                    <img src="https://i.imgur.com/WsrXQ6U.png" alt="Twitter" width="50px" height="50px">
                </div>
            </div>
        </div>
    </div></body>
</html>