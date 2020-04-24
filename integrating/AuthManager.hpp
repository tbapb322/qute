#ifndef AUTHMANAGER_HPP
#define AUTHMANAGER_HPP


#include <QObject>
#include <QNetworkAccessManager>
#include <QString>

class AuthManager : public QObject
{
    Q_OBJECT
public:

    explicit AuthManager(QObject *parent = nullptr);

    Q_INVOKABLE void registerer(const QString &login,
                   const QString &password);

    Q_INVOKABLE void authenticate(const QString &login,
                      const QString &password);

private:
    QNetworkAccessManager _net;

signals:
    void registererRequestCompleted(QString error);
    void authenticateRequestCompleted(QString error, QString token);

};

#endif // AUTHMANAGER_HPP
