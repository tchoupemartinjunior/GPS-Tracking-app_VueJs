import {
    createStore
} from 'vuex'

export default createStore({


    state: {
        allVehicles: [{
                idChauffeur: 1,
                online: true,
                chauffeur: "Ayokunle",
                position: {
                    lat: 48.013152415689454,
                    lng: 0.16178821161615078
                },

                distParcourue: 120000,
                vitesseMoy: 60,
                etatMoteur: "allumé",


            },
            {
                id: 2,
                online: true,
                chauffeur: "Imane",
                position: {
                    lat: 48.019023,
                    lng: 0.15784
                },

                distParcourue: 200000,
                vitesseMoy: 140,
                etatMoteur: "allumé",
            },
            {
                id: 3,
                online: false,
                chauffeur: "Ewen",
                position: {
                    lat: 48.016023,
                    lng: 0.15474
                },

                distParcourue: 4000,
                vitesseMoy: 120,
                etatMoteur: "allumé",
            },
            {
                id: 4,
                online: true,
                chauffeur: "Baptiste",
                position: {
                    lat: 48.017023,
                    lng: 0.15054
                },

                distParcourue: 18500,
                vitesseMoy: 100,
                etatMoteur: "allumé",
            },
        ]
    },
    positions: {
        allPositions: [{
                lat: 48.019020998475504,
                long: 0.15730695295252492
            },
            {
                lat: 48.0182273154203,
                long: 0.15802144618493977
            },
            {

                lat: 48.017937148672644,
                long: 0.15808524022354825
            },
            {

                lat: 48.01744215456929,
                long: 0.1581490342621567
            },
            {

                lat: 48.01662284354167,
                long: 0.15802144618493977
            },
            {

                lat: 48.01548773487526,
                long: 0.15848076326292077
            },
            {

                lat: 48.015265831012854,
                long: 0.16031803157484473
            },
            {

                lat: 48.01535221483795,
                long: 0.17763710702217328
            },






            /*48.01492443859049, 0.1616321887701792
            48.01439340523507, 0.16446084452140664
            48.013389948577974, 0.1729437020671362
            48.01384278588131, 0.17641862688961554
            48.01535221483795, 0.17763710702217328*/
        ]
    },
    getters: {},
    mutations: {},
    actions: {},
    modules: {}

    /*// Exemple de réponse Auto API (coordonnées)

{
"coordinates":
{
    "id":"3",
    "imei":"143345456643455",
    "longitude":"1.23456",
    "latitude":"2.34567",
    "speed":"0",
    "altitude":"378",
    "status":"Battery Disconnect Alert",
    "track_time":"2020-12-02 11:15:22"
}
       
*/
})