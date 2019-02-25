#ifndef DATAENTRYMODEL_H
#define DATAENTRYMODEL_H

#include <QtCore>
#include <QtGui>

class DataEntryModel : public QAbstractTableModel
{
    Q_OBJECT

public:
    explicit DataEntryModel(QObject *parent = nullptr);
    ~DataEntryModel();

    // Basic functionality:
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    int columnCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    QHash<int, QByteArray> roleNames() const override;

private:

    QList<QString> m_data;
};

#endif // DATAENTRYMODEL_H
