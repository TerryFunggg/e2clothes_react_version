import React from "react";
import {
  List,
  Edit,
  Create,
  Datagrid,
  TextField,
  EditButton,
  EmailField,
  TextInput,
  SimpleForm,
  Filter,
  ReferenceInput,
  SelectInput
} from 'react-admin'

import AvatarField from './avatarField'

const UserFilter = (props) => (
  <Filter {...props}>
    <TextInput label="Search" source="q" alwaysOn />
  </Filter>
);

export const UsersList = (props) => {
  return (
    <List filters={<UserFilter />} {...props}>
      <Datagrid >
        <EditButton />
        <TextField source="id" />
        <AvatarField />
        <TextField source="user_name" />
        <EmailField source="email" />
        <TextField source="first_name" />
        <TextField source="last_name" />
        <TextField source="phone" />
        <TextField source="role" />
        <TextField source="is_active" />
        <TextField source="address_id" />
      </Datagrid>
    </List>
  )
};

export const UsersEdit = props => (
  <Edit {...props}>
    <SimpleForm>
      <TextInput source="id" />
      <TextInput source="user_name" />
      <TextInput source="email" />
      <TextInput source="first_name" />
      <TextInput source="last_name" />
      <TextInput source="phone" />
      <TextInput source="role" />
      <TextInput source="is_active" />
      <TextInput source="address_id" />
    </SimpleForm>
  </Edit>
)

export const UsersCreate = props => (
  <Create {...props}>
    <SimpleForm>
      <TextInput source="id" />
      <TextInput source="user_name" />
      <TextInput source="email" />
      <TextInput source="first_name" />
      <TextInput source="last_name" />
      <TextInput source="phone" />
      <TextInput source="role" />
      <TextInput source="is_active" />
      <TextInput source="address_id" />
    </SimpleForm>
  </Create>
)
