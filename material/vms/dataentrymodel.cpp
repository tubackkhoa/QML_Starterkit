#include "dataentrymodel.h"

DataEntryModel::DataEntryModel(QObject *parent)
    : QAbstractTableModel(parent)
{
     m_data = QColor::colorNames();
}

DataEntryModel::~DataEntryModel()
{
}

int DataEntryModel::columnCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return 5;
}


int DataEntryModel::rowCount(const QModelIndex &parent) const
{
    // For list models only the root node (an invalid parent) should return the list's size. For all
    // other (valid) parents, rowCount() should return 0 so that it does not become a tree model.
    if (parent.isValid())
        return 0;

    Q_UNUSED(parent);
    // return our data count
    return m_data.count();
}

QVariant DataEntryModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();

    // the index returns the requested row and column information.
    // we ignore the column and only use the row information
    int row = index.row();

    // boundary check for the row
    if(row < 0 || row >= m_data.count()) {
        return QVariant();
    }

    // A model can return data for different roles.
    // The default role is the display role.
    // it can be accesses in QML with "model.display"
    switch(role) {
    case Qt::DisplayRole:
        // Return the color name for the particular row
        // Qt automatically converts it to the QVariant type
        return m_data.value(row);
    }

    return QVariant();
}

QHash<int, QByteArray> DataEntryModel::roleNames() const
{
    return { {Qt::DisplayRole, "display"} };
}
