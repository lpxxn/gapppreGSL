#ifndef GAPPPRESCRIPTEXTENSIONPLUGIN_H
#define GAPPPRESCRIPTEXTENSIONPLUGIN_H

#include <QScriptExtensionPlugin>


class GappPreScriptExtensionPlugin : public QScriptExtensionPlugin
{
    Q_OBJECT
#if QT_VERSION >= 0x050000
    Q_PLUGIN_METADATA(IID "org.qt-project.Qt.QScriptExtensionInterface" FILE "gapppre.json")
#endif // QT_VERSION >= 0x050000

public:
    GappPreScriptExtensionPlugin(QObject *parent = 0);
    QStringList keys() const;
    void initialize(const QString &key, QScriptEngine *engine);

};

#endif // GAPPPRESCRIPTEXTENSIONPLUGIN_H
