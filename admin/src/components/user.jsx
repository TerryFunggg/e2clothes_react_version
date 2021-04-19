import React from "react";
import { List, Datagrid, TextField, EmailField, ReferenceField, EditButton } from 'react-admin'

export const UserList = (props) => {
  return (
    <List {...props}>
      <Datagrid >
        <EditButton />
        <TextField source="id" />
        <TextField source="user_name" />
        <EmailField source="email" />
        <TextField source="first_name" />
        <TextField source="last_name" />
        <TextField source="phone" />
        <TextField source="role" />
        <TextField source="is_active" />
        <ReferenceField label="City" source="address_id" reference="addresses">
          <TextField source="city" />
        </ReferenceField>
      </Datagrid>
    </List>
  )
};
