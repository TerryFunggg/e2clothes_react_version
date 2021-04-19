import React, { useState, useEffect } from 'react'
import { makeStyles } from '@material-ui/core/styles';
import '../node_modules/react-vis/dist/style.css';
import {
  XYPlot,
  LineSeries,
  VerticalBarSeries,
  MarkSeries,
  VerticalGridLines,
  HorizontalGridLines,
  YAxis,
  XAxis
} from 'react-vis';
import { Card, CardContent, CardHeader, Grid, Typography } from '@material-ui/core'
import EqualizerIcon from '@material-ui/icons/Equalizer';
import GroupAddIcon from '@material-ui/icons/GroupAdd';
import StorefrontIcon from '@material-ui/icons/Storefront';

const data = [
  { x: 0, y: 8 },
  { x: 1, y: 5 },
  { x: 2, y: 4 },
  { x: 3, y: 9 },
  { x: 4, y: 1 },
  { x: 5, y: 7 },
  { x: 6, y: 6 },
  { x: 7, y: 3 },
  { x: 8, y: 2 },
  { x: 9, y: 0 }
];


const LineChart = () => (
  <XYPlot height={300} width={450}>
    <VerticalGridLines />
    <HorizontalGridLines />
    <XAxis />
    <YAxis />
    <LineSeries data={data} />
  </XYPlot>
)

const BarChart = () => (
  <XYPlot height={300} width={450}>
    <VerticalGridLines />
    <HorizontalGridLines />
    <XAxis />
    <YAxis />
    <VerticalBarSeries data={data} />
  </XYPlot>
)

const MarkChart = () => (
  <XYPlot height={300} width={450}>
    <VerticalGridLines />
    <HorizontalGridLines />
    <XAxis />
    <YAxis />
    <MarkSeries data={data} />
  </XYPlot>
)

const useStyles = makeStyles(() => ({
  card: ({ color }) => ({
    minWidth: 256,
    borderRadius: 16,
    backgroundColor: '#264653',
    boxShadow: 'none',
    '&:hover': {
      boxShadow: `0 6px 12px 0 ${color}`,
    },
  }),
  content: ({ color }) => {
    return {
      backgroundColor: color,
      padding: '1rem 1.5rem 1.5rem',
    };
  },
  title: {
    padding: '0.5rem',
    color: '#fff',
    textTransform: 'uppercase',
  },
  number: {
    textAlign: 'center',
    color: '#fff',
    opacity: 0.87,
    fontWeight: 'bold',
    fontSize: '2rem',
  },
  numberCardGroup: {
    marginBottom: '2rem'
  }
}));


const NumberCard = ({ classes, title, number, icon }) => (
  <Card className={classes.card}>
    <Typography className={classes.title} >{title}</Typography>
    <CardContent className={classes.content}>
      <Typography className={classes.number}>
        {icon}  {number}
      </Typography>
    </CardContent>
  </Card>
)

export default () => {
  const styles = useStyles({ color: '#203f52' });
  const [total, setTotal] = useState({})
  useEffect(() => {
    // TODO: config this url when production
    fetch('http://localhost:3000/dashboard/home', {
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${localStorage.getItem('auth_token')}`
      }
    })
      .then(res => res.json())
      .then(data => setTotal(data))
  }, [])

  return (
    <>
      <CardHeader title="Welcome" />
      <Grid className={styles.numberCardGroup} container justify="center" spacing={5} >
        <Grid item >
          <NumberCard icon={<GroupAddIcon />} classes={styles} title={'Total Users'} number={total.total_users} />
        </Grid>
        <Grid item >
          <NumberCard icon={<StorefrontIcon />} classes={styles} title={'Total Shops'} number={total.total_shops} />
        </Grid>

        <Grid item >
          <NumberCard icon={<EqualizerIcon />} classes={styles} title={'Total Products'} number={total.total_products} />
        </Grid>
      </Grid>

      <Grid container justify="center" spacing={5} >
        <Grid item >
          <Card>
            <BarChart />
          </Card>
        </Grid>
        <Grid item>
          <Card>
            <MarkChart />
          </Card>
        </Grid>
        <Grid item >
          <Card>
            <LineChart />
          </Card>
        </Grid>
      </Grid>
    </>
  )
}
