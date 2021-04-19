import React from 'react'
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
import { Card, CardContent, CardHeader, Grid } from '@material-ui/core'

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

const useStyles = makeStyles((theme) => ({
  root: {
    flexGrow: 1,
    marginTop: "2rem"
  },
}));

export default () => {
  const classes = useStyles()

  return (
    <>
      <CardHeader title="Welcome" />
      <Grid container className={classes.root} justify="center" spacing={5} >
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
