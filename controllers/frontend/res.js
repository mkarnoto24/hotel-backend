'use strict';

exports.ok = function (values, res) {
    var data = {
        'status': 'ok',
        'messages': 'success',
        'data': values
    };
    res.json(data);
    res.end();
};