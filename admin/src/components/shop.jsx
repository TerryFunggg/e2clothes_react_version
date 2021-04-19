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
  ReferenceField,
} from 'react-admin'

import AvatarField from './avatarField'

export const ShopsList = props => (
  <List {...props}>
    <Datagrid>
      <EditButton />
      <TextField source="id" />
      <AvatarField source="logo" />
      <TextField source="title" />
      <TextField source="slug" />
      <TextField source="description" />
      <TextField source="state" />
      <ReferenceField source="address_id" reference="addresses"><TextField source="id" /></ReferenceField>
      <ReferenceField source="user_id" reference="users"><TextField source="id" /></ReferenceField>
    </Datagrid>
  </List>
);

export const ShopsEdit = props => (
  <Edit {...props}>
    <SimpleForm>
      <TextInput source="id" />
      <TextInput source="logo" />
      <TextInput source="title" />
      <TextInput source="slug" />
      <TextInput source="description" />
      <TextInput source="state" />
      <TextInput source="address_id" />
      <TextInput source="user_id" />
    </SimpleForm>
  </Edit>
)

export const ShopsCreate = props => (
  <Create {...props}>
    <SimpleForm>
      <TextInput source="id" />
      <TextInput source="logo" />
      <TextInput source="title" />
      <TextInput source="slug" />
      <TextInput source="description" />
      <TextInput source="state" />
      <TextInput source="address_id" />
      <TextInput source="user_id" />
    </SimpleForm>
  </Create>
)
