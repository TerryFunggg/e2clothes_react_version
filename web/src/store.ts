import { configureStore } from '@reduxjs/toolkit'
import navItemActiveReducer from './reducers/navItemActive'
import loggedReducer from './reducers/isLogged'

export const store = configureStore({
  reducer: {
    navItemActive: navItemActiveReducer,
    isLogged: loggedReducer
  }
})

export type RootState = ReturnType<typeof store.getState>
export type AppDispatch = typeof store.dispatch
