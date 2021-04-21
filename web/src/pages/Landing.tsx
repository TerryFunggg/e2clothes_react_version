import React from "react";
import NavBar from "../components/nav_bar/NavBar";
import RecommandArea from "../components/RecommandArea";

export default class Landing extends React.Component {
  render() {
    return (
      <>
        <NavBar />
        {/* Hero Start */}
        <div className="grid grid-cols-1 md:grid-cols-2">
          <img
            className="rounded-bl-lg rounded-br-lg shadow-xl"
            src="https://images.unsplash.com/photo-1441986300917-64674bd600d8?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80"
            alt=""
          />
          <div className="relative flex flex-col justify-center items-center mt-5 md:mt-0">
            <p className="text-center text-2xl md:text-5xl z-10">
              <span className="text-green-500 font-bold animate-pulse z-10">Lorem</span>
              ipsum dolor sitamet.
            </p>
            <br />
            <p className="text-center text-xl md:text-4xl text-gray-600 z-10">
              Lorem ipsum dolor sit amet.
            </p>
            {/* TODO: Add some animation? */}
          </div>
        </div>
        {/* Hero End */}
        {/* Recommand Section */}
        <hr className="my-10 w-4/5 mx-auto text-black"/>
        <div className="my-5 w-screen">
            <h2 className="text-center text-lg md:text-3xl">Recommand for you</h2>
        </div>
        

        <RecommandArea style={{ padding: "2rem" }} />
      </>
    );
  }
}
