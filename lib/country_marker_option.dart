/// Marks the whole country with a different color based on the population.
/// 
/// Features included - 
/// 1. Title
/// 2. Tooltip which gives the population information of that country.
/// 3. Color of the country depends on the population.


const country_marker_chart_option = r'''
{
    backgroundColor: '#fff',
    title : {
        text: 'World Population (2011)',
        subtext: 'From Gapminder',
        left: 'center',
        top: 'top',
        textStyle: {
            color: '#000'
        }
    },
    tooltip : {
        trigger: 'item',
        formatter : function (params) {
            var value = (params.value + '').split('.');
            value = value[0].replace(/(\d{1,3})(?=(?:\d{3})+(?!\d))/g, '$1,')
                    + '.' + value[1];
            return params.seriesName + '<br/>' + params.name + ' : ' + value;
        }
    },
    visualMap: {
        show: false,
        min: 0,
        max: max,
        inRange: {
            symbolSize: [6, 60]
        }
    },
    series : [
        {
            type: 'map',
            map: 'world',
            roam: true,
            coordinateSystem: 'geo',
            data: mapData.map(function (itemOpt) {
                return {
                    name: itemOpt.name,
                    value: [
                        latlong[itemOpt.code].longitude,
                        latlong[itemOpt.code].latitude,
                        itemOpt.value
                    ],
                    label: {
                        emphasis: {
                            position: 'right',
                            show: true
                        }
                    },
                    itemStyle: {
                        normal: {
                            color: itemOpt.color
                        }
                    }
                };
            })
        }
    ]
} ''';
