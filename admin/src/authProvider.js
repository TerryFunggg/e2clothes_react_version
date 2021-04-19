export default {
  login: ({ username, password }) => {
    const request = new Request('http://localhost:3000/login', {
      method: 'POST',
      body: JSON.stringify({ email: username, password }),
      headers: new Headers({ 'Content-Type': 'application/json' }),
    });
    return fetch(request)
      .then(response => {
        // Unauthorized errro
        if (response.status == 401) {
          throw new Error("Email or password invalid")
        } else if (response.status < 200 || response.state >= 300) {
          throw new Error(response.statusText)
        }
        return response.json()
      }).then(auth => {
        localStorage.setItem('auth_token', `${auth.token}`);
      }).catch(e => {
        throw new Error(e)
      })
  },

  checkError: error => {
    const status = error.status;
    if (status === 401 || status === 403) {
      localStorage.removeItem('auth_token');
      return Promise.reject({ redirectTo: '/credentials-required' });
    }
    // other error code (404, 500, etc): no need to log out
    return Promise.resolve();
  },

  checkAuth: () => localStorage.getItem('auth_token')
    ? Promise.resolve()
    : Promise.reject({ message: 'login is required' }),

  logout: () => {
    localStorage.removeItem('auth_token')
    return Promise.resolve()
  },

  getIdentity: async () => {
    const request = new Request('http://localhost:3000/me', {
      method: 'POST',
      body: '',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${localStorage.getItem('auth_token')}`
      }
    });
    const response = await (fetch(request))
    if (response.status < 200 || response.state >= 300) {
      return Promise.reject(response.statusText + response.message)
    }
    const user = await response.json()

    if (user.role == "admin") {
      return Promise.resolve({ id: user.id, fullName: user.username, avatar: user.avatar })
    }

    return Promise.reject("You are not admin")
  },
  // authorization
  getPermissions: params => Promise.resolve(),
}
