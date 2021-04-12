import { configureStore } from '@reduxjs/toolkit'
import navItemActiveReducer from './reducers/navItemActive'

export const store = configureStore({
  reducer: {
    navItemActive: navItemActiveReducer
  }
})

export type RootState = ReturnType<typeof store.getState>
export type AppDispatch = typeof store.dispatch
