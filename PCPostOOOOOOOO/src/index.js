import React from "react";
import { createRoot } from "react-dom/client";
import {  createBrowserRouter,  RouterProvider} from "react-router-dom";
import Mainworld from "./pages/MainWorld";
import NotFound from "./pages/NotFound";
import NewPost from "./pages/NewPost";
import SignIn from "./pages/SignIn";

const router = createBrowserRouter([
  {
    path: "/pcpost",
    element: <Mainworld/>,
    errorElement: <NotFound/>,
  },
  {
    path: "/pcpost/NewPost",
    element: <NewPost/>,
    errorElement: <NotFound />,
  },
  {
    path: "/pcpost/SignIn",
    element: <SignIn/>,
    errorElement: <NotFound/>,
  }
]);

createRoot(document.getElementById("root")).render(
  <>
    <RouterProvider router={router} />
    <style jsx global>{`
      body {
        margin: 0;
      }
    `}</style>
  </>
);