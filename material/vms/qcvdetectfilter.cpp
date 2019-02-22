#include "qcvdetectfilter.h"

cv::CascadeClassifier classifier;

QVideoFilterRunnable* QCvDetectFilter::createFilterRunnable()
{
    return new QCvDetectFilterRunnable(this);
}

QVideoFrame QCvDetectFilterRunnable::run(QVideoFrame *input, const QVideoSurfaceFormat &surfaceFormat, RunFlags flags)
{
//    Q_UNUSED(surfaceFormat);
//    Q_UNUSED(flags);

//    // Supports YUV (I420 and NV12) and RGB. The GL path is readback-based and slow.
//    if (!input->isValid()
//            || (input->handleType() != QAbstractVideoBuffer::NoHandle && input->handleType() != QAbstractVideoBuffer::GLTextureHandle)) {
//        qWarning("Invalid input format");
//        return QVideoFrame();
//    }

//    input->map(QAbstractVideoBuffer::ReadOnly);


//    QImage image(input->bits(),
//                 input->width(),
//                 input->height(),
//                 QVideoFrame::imageFormatFromPixelFormat(input->pixelFormat()));
//    image = image.convertToFormat(QImage::Format_RGB888);
//    cv::Mat mat(image.height(),
//                image.width(),
//                CV_8UC3,
//                image.bits(),
//                image.bytesPerLine());



//    if(classifier.empty())
//    {
//        QFile xml(":/faceclassifier.xml");
//        if(xml.open(QFile::ReadOnly | QFile::Text))
//        {
//            QTemporaryFile temp;
//            if(temp.open())
//            {
//                temp.write(xml.readAll());
//                temp.close();
//                if(classifier.load(temp.fileName().toStdString()))
//                {
//                    qDebug() << "Successfully loaded classifier!";
//                }
//                else
//                {
//                    qDebug() << "Could not load classifier.";
//                }
//            }
//            else
//            {
//                qDebug() << "Can't open temp file.";
//            }
//        }
//        else
//        {
//            qDebug() << "Can't open XML.";
//        }
//    }
//    else
//    {
//        //        std::vector<cv::Rect> detected;

//        //        /*
//        //             * Resize in not mandatory but it can speed up things quite a lot!
//        //             */
//        //        QSize resized = image.size().scaled(320, 240, Qt::KeepAspectRatio);
//        //        cv::resize(mat, mat, cv::Size(resized.width(), resized.height()));

//        //        classifier.detectMultiScale(mat, detected, 1.1);

//        //        // We'll use only the first detection to make sure things are not slow on the qml side
//        //        if(detected.size() > 0)
//        //        {
//        //            // Normalize x,y,w,h to values between 0..1 and send them to UI
//        //            emit filter->objectDetected(float(detected[0].x) / float(mat.cols),
//        //                    float(detected[0].y) / float(mat.rows),
//        //                    float(detected[0].width) / float(mat.cols),
//        //                    float(detected[0].height) / float(mat.rows));
//        //        }
//        //        else
//        //        {
//        //            emit filter->objectDetected(0.0,
//        //                                        0.0,
//        //                                        0.0,
//        //                                        0.0);
//        //        }
//    }


//    if (input->handleType() == QAbstractVideoBuffer::NoHandle)
//        input->unmap();

    return *input;
}
