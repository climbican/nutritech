angular.module('app').controller('FormGenerationController', function ($scope) {



    // entity to edit
    $scope.entity = {
        element_0: 0,
        percent_0: .03,
        element_1: 2,
        percent_1: 1.2
    };



    $scope.fieldSet = {
        0:[{
            name: 'element_0',
            title: 'Element',
            type: {
                view: 'select',
                options: [
                    {id: 0, name: 'Bromite'},
                    {id: 1, name: 'Phosphate'},
                    {id: 2, name: 'Calcium'}
                ]
            }
        },
        {
            name: 'percent_0',
            title: 'Element',
            required: true,
            type: {
                view: 'input'
            }
        }],
        'gatspy':[{
            name: 'element_1',
            title: 'Element',
            type: {
                view: 'select',
                options: [
                    {id: 0, name: 'Bromite'},
                    {id: 1, name: 'Phosphate'},
                    {id: 2, name: 'Calcium'}
                ]
            }
        },
            {
                name: 'percent_1',
                title: 'Name',
                required: true,
                type: {
                    view: 'input'
                }
            }]
    };



});