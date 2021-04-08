import React from "react";

const SearchBox = () => {
  return (
    <div>
      <form className="w-full max-w-sm">
        <div className="flex items-center border-b border-gray-300 py-2">
          <input className="appearance-none bg-transparent border-none w-full text-gray-700 mr-3 py-1 px-2 leading-tight focus:outline-none" type="text" placeholder="Search items" />
          <button className="flex-shrink-0 border-transparent border-4 text-teal-500 hover:text-teal-800 text-sm py-1/2 px-2 rounded" type="button">
            Search
          </button>
        </div>
      </form>
    </div>
  )
};

export default SearchBox;
