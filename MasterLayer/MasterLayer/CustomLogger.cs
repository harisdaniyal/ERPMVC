using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MasterLayer
{

    public static class ExceptionHelper
    {
        public static int LineNumber(this Exception e)
        {
            int linenum = 0;
            try
            {
                //linenum = Convert.ToInt32(e.StackTrace.Substring(e.StackTrace.LastIndexOf(":line") + 5));
                //For Localized Visual Studio ... In other languages stack trace  doesn't end with ":Line 12"
                linenum = Convert.ToInt32(e.StackTrace.Substring(e.StackTrace.LastIndexOf(' ')));

            }
            catch
            {
                //Stack trace is not available!
            }
            return linenum;
        }
    }

    public class CustomLogger
    {

        [Flags]
        private enum LogLevel
        {
            TRACE,
            INFO,
            DEBUG,
            WARNING,
            ERROR,
            FATAL
        }

        public static void CreateFolderIfNotExists(string path)
        {
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }
        }

        private static void WriteLine(string text, bool append = true)
        {
            try
            {
                string pathDir = AppDomain.CurrentDomain.BaseDirectory + "Logs";
                CreateFolderIfNotExists(pathDir);
                string filename = String.Format("{0:yyyy-MM-dd}__{1}", DateTime.Now, "log.txt");
                string path = Path.Combine(pathDir, filename);
                using (StreamWriter writer = new StreamWriter(path, append, Encoding.UTF8))
                {
                    if (!string.IsNullOrEmpty(text))
                    {
                        writer.WriteLine(text);
                        
                    }
                    writer.Close();
                }
            }
            catch (Exception ex)
            {
                //ignore
            }
        }

        private static void WriteFormattedLog(LogLevel level, string text)
        {
            string pretext;
            string dateTimeFormat = "yyyy-MM-dd HH:mm:ss.fff";
            switch (level)
            {
                case LogLevel.TRACE:
                    pretext = System.DateTime.Now.ToString(dateTimeFormat) + " [TRACE]   ";
                    break;
                case LogLevel.INFO:
                    pretext = System.DateTime.Now.ToString(dateTimeFormat) + " [INFO]    ";
                    break;
                case LogLevel.DEBUG:
                    pretext = System.DateTime.Now.ToString(dateTimeFormat) + " [DEBUG]   ";
                    break;
                case LogLevel.WARNING:
                    pretext = System.DateTime.Now.ToString(dateTimeFormat) + " [WARNING] ";
                    break;
                case LogLevel.ERROR:
                    pretext = System.DateTime.Now.ToString(dateTimeFormat) + " [ERROR]   ";
                    break;
                case LogLevel.FATAL:
                    pretext = System.DateTime.Now.ToString(dateTimeFormat) + " [FATAL]   ";
                    break;
                default:
                    pretext = "";
                    break;
            }

            WriteLine(pretext + text);
        }

        /// <summary>
        /// Log a DEBUG message
        /// </summary>
        /// <param name="text">Message</param>
        public static void Debug(string text)
        {
            WriteFormattedLog(LogLevel.DEBUG, text);
        }

        /// <summary>
        /// Log an ERROR message
        /// </summary>
        /// <param name="text">Message</param>
        public static void Error(string text)
        {
            WriteFormattedLog(LogLevel.ERROR, text);
        }

        /// <summary>
        /// Log a FATAL ERROR message
        /// </summary>
        /// <param name="text">Message</param>
        public static void Fatal(string text)
        {
            WriteFormattedLog(LogLevel.FATAL, text);
        }

        /// <summary>
        /// Log an INFO message
        /// </summary>
        /// <param name="text">Message</param>
        public static void Info(string text)
        {
            WriteFormattedLog(LogLevel.INFO, text);
        }

        /// <summary>
        /// Log a TRACE message
        /// </summary>
        /// <param name="text">Message</param>
        public static void Trace(string text)
        {
            WriteFormattedLog(LogLevel.TRACE, text);
        }

        /// <summary>
        /// Log a WARNING message
        /// </summary>
        /// <param name="text">Message</param>
        public static void Warning(string text)
        {
            WriteFormattedLog(LogLevel.WARNING, text);
        }


        public static void WriteMessageToFile(string text)
        {
            //string pathDir = AppDomain.CurrentDomain.BaseDirectory + "Logs";
            //CreateFolderIfNotExists(pathDir);
            //string filename = String.Format("{0:yyyy-MM-dd}__{1}", DateTime.Now, "log.txt");
            //string path = Path.Combine(pathDir, filename);
            //using (StreamWriter writer = new StreamWriter(path, true))
            //{
            //    writer.WriteLine(text);
            //    writer.Close();
            //}


            WriteFormattedLog(LogLevel.WARNING, text);

        }


        public static void WriteErrorLogToFile(Exception ex)
        {
            //string pathDir = AppDomain.CurrentDomain.BaseDirectory + "Logs";
            //CreateFolderIfNotExists(pathDir);
            //string filename = String.Format("{0:yyyy-MM-dd}__{1}", DateTime.Now, "log.txt");
            //string path = Path.Combine(pathDir,filename);
            //using (StreamWriter writer = new StreamWriter(path, true))
            //{
            //    string methodName = new StackTrace(ex).GetFrame(0).GetMethod().Name;
            //    writer.WriteLine();
            //    writer.Close();
            //}

            //Get stack trace for the exception with source file information
            //var st = new StackTrace(ex, true);
            //// Get the top stack frame
            //var frame = st.GetFrame(0);
            //// Get the line number from the stack frame
            //var line = frame.GetFileLineNumber();

            //int line = ex.LineNumber();

            string methodName = new StackTrace(ex).GetFrame(0).GetMethod().Name;
            string error = DateTime.Now.ToString("dd/MM/yyyy hh:mm:ss tt") +
                            " : [" + ex.Source.ToString().Trim() + "] , [" + methodName + "] ; " + ex.ToString() + " " + ex.Message.ToString().Trim() + " " +
                            "\n\n STACK TRACE [ " + ex.StackTrace.ToString() +" ]";


            WriteFormattedLog(LogLevel.ERROR, error);
            


        }
    }
}
