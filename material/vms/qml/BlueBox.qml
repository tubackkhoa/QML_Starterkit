import QtQuick 2.12
import QtQuick.LocalStorage 2.12

Item {
    width: 400
    height: 400

    Rectangle {
        id: crazy
        objectName: 'crazy'
        width: 100
        height: 100
        x: 50
        y: 50
        color: "#4582ec"
        border.color: Qt.lighter(color, 1.1)
        Text {
            anchors.centerIn: parent
            // this will be called each time it is re-drawn
            text: Math.round(parent.x) + '/' + Math.round(parent.y)
        }
        MouseArea {
            anchors.fill: parent
            drag.target: parent
        }

    }

    // reference to the database object
    property var db;

    function initDatabase() {
        // initialize the database object
        print('initDatabase()')
        db = LocalStorage.openDatabaseSync("BlueBox", "1.0", "A box who remembers its position", 100000);
        db.transaction( function(tx) {
            print('... create table')
            tx.executeSql('CREATE TABLE IF NOT EXISTS data(name TEXT, value TEXT)');
        });
    }

    function storeData() {
        // stores data to DB
        print('storeData()')
        if(!db) { return; }
        db.transaction( function(tx) {
            print('... check if a crazy object exists')
            var result = tx.executeSql('SELECT * from data where name = "crazy"');
            // prepare object to be stored as JSON
            var obj = { x: crazy.x, y: crazy.y };
            if(result.rows.length === 1) {// use update
                print('... crazy exists, update it')
                result = tx.executeSql('UPDATE data set value=? where name="crazy"', [JSON.stringify(obj)]);
            } else { // use insert
                print('... crazy does not exists, create it')
                result = tx.executeSql('INSERT INTO data VALUES (?,?)', ['crazy', JSON.stringify(obj)]);
            }
        });

    }

    function readData() {
        // reads and applies data from DB
        print('readData()')
        if(!db) { return; }
        db.transaction( function(tx) {
            print('... read crazy object')
            var result = tx.executeSql('select * from data where name="crazy"');
            if(result.rows.length === 1) {
                print('... update crazy geometry')
                // get the value column
                var value = result.rows[0].value;
                // convert to JS object
                var obj = JSON.parse(value)
                // apply to object
                crazy.x = obj.x;
                crazy.y = obj.y;
            }
        });
    }

    // init and destruction method
    Component.onCompleted: {
        initDatabase();
        readData();
    }

    Component.onDestruction: {
        storeData();
    }
}
