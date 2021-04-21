import React from 'react'
import { Link,useHistory } from 'react-router-dom'
import { useAppDispatch, useAppSelector } from '../hooks'
import { setIsLogged, selectIsLogged } from '../reducers/isLogged'
import { gql, useQuery } from '@apollo/client'
import UserDropDown from './UserDropDown'
import { Disclosure } from '@headlessui/react'
import { ShoppingCartIcon, MenuIcon, XIcon } from '@heroicons/react/outline'
import MyDialog from './MyDialog'


const ME_QUERY = gql`
{
    me {
        user_name
        first_name
        last_name
        avatar
        role
    }
}
`

const navigation = [
  { name: 'Home', href: '#', current: true },
  { name: 'Market', href: '#', current: false },
]

function classNames(...classes: string[]) {
  return classes.filter(Boolean).join(' ')
}



// TODO: responsive for user dropdown menu
export default function NavBar() {
  const isLoggedActive = useAppSelector(selectIsLogged)
  const dispatch = useAppDispatch();
  const history = useHistory()
  const { loading, error, data } = useQuery(ME_QUERY)

  if (error) console.log(error)

  return (
    <Disclosure as="nav" className="bg-white">
      {({ open }) => (
        <>
          <div className="max-w-7xl mx-auto px-2 sm:px-6 lg:px-8">
            <div className="relative flex items-center justify-between h-16">
              <div className="absolute inset-y-0 left-0 flex items-center sm:hidden">
                {/* Mobile menu button*/}
                <Disclosure.Button className="inline-flex items-center justify-center p-2 rounded-md text-gray-400 hover:text-white hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-white">
                  <span className="sr-only">Open main menu</span>
                  {open ? (
                    <XIcon className="block h-6 w-6" aria-hidden="true" />
                  ) : (
                      <MenuIcon className="block h-6 w-6" aria-hidden="true" />
                    )}
                </Disclosure.Button>
              </div>
              <div className="flex-1 flex items-center justify-center sm:items-stretch sm:justify-start">
                <div className="flex-shrink-0 flex items-center text-lg">
                  e2clothes
                </div>
                <div className="hidden sm:block sm:ml-6">
                  <div className="flex space-x-4">
                    {navigation.map((item) => (
                      <a
                        key={item.name}
                        href={item.href}
                        className={classNames(
                          item.current ? 'bg-green-700 text-white' : 'text-gray-600 hover:bg-green-600 hover:text-white',
                          'px-3 py-2 rounded-md text-sm font-medium'
                        )}
                        aria-current={item.current ? 'page' : undefined}
                      >
                        {item.name}
                      </a>
                    ))}
                  </div>
                </div>
              </div>
              <div className="absolute inset-y-0 right-0 flex items-center pr-2 sm:static sm:inset-auto sm:ml-6 sm:pr-0">
                <button className="p-1 rounded-full text-gray-400 hover:text-gray-800 focus:outline-none focus:ring focus:ring-offset-2 focus:ring-offset-gray-800 focus:ring-white">
                  <span className="sr-only">View Shop Cart</span>
                  <ShoppingCartIcon className="h-6 w-6" aria-hidden="true" />
                </button>

                {/* Profile dropdown */}
                {data?.me ?
                  <UserDropDown user={data.me} />
                  : ''
                }
              </div>
            </div>
          </div>

          <Disclosure.Panel className="sm:hidden">
            <div className="px-2 pt-2 pb-3 space-y-1">
              {navigation.map((item) => (
                <a
                  key={item.name}
                  href={item.href}
                  className={classNames(
                    item.current ? 'bg-green-800 text-white' : 'text-gray-600 hover:bg-green-700 hover:text-white',
                    'block px-3 py-2 rounded-md text-base font-medium'
                  )}
                  aria-current={item.current ? 'page' : undefined}
                >
                  {item.name}
                </a>
              ))}
            </div>
          </Disclosure.Panel>
        </>
      )}


    </Disclosure>
  );
}