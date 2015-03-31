#include "gappprescriptextensionplugin.h"

#include <QScriptEngine>
#include <QDebug>

#include <Gsl/gsl_sf_bessel.h>

/*!
 * \brief 实现算法.
 *
 * 从JavaScript中接受一个数值数组, 计算其平均值并返回.
 * \param ctx
 * \param engine
 * \return
 */
static QScriptValue gapp_algo1(QScriptContext* ctx, QScriptEngine* /*engine*/)
{
    if (ctx->argumentCount() != 1 || !(ctx->argument(0).isArray()))
        return ctx->throwError(QScriptContext::SyntaxError, "'algo1' method can only have a array argument.");

    QList<QVariant> array = ctx->argument(0).toVariant().toList();
    double sum = 0;
    for (const QVariant& var : array)
        sum += var.toDouble();

    sum = gsl_sf_bessel_j0(sum);
    return   sum;
    //return sum/array.size();
}


GappPreScriptExtensionPlugin::GappPreScriptExtensionPlugin(QObject *parent) :
    QScriptExtensionPlugin(parent)
{
}

QStringList GappPreScriptExtensionPlugin::keys() const
{
    QStringList result;
    result << QStringLiteral("gapp");
    return result;
}

void GappPreScriptExtensionPlugin::initialize(const QString &key, QScriptEngine *engine)
{
    //在全局对象gapp上注册各种算法函数
    if (key == QStringLiteral("gapp")) {
        QScriptValue global = engine->globalObject();
        QScriptString gapp = engine->toStringHandle(QStringLiteral("gapp"));
        QScriptValue gappObj = engine->newObject();
        global.setProperty(gapp, gappObj, QScriptValue::Undeletable);
        gappObj.setProperty(QStringLiteral("algo1"),engine->newFunction(gapp_algo1));
    }
}

#if QT_VERSION < 0x050000
Q_EXPORT_PLUGIN2(gapppre, GappPreScriptExtensionPlugin)
#endif // QT_VERSION < 0x050000
