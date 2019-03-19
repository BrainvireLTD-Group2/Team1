using System;
using System.Diagnostics;

namespace UFIXBootstrap
{
    class Bootstrap
    {
        public static void Main(string[] args)
        {
            PlatformID Platform = Environment.OSVersion.Platform;
            Process Process = new Process();

            // Operating System handling
            switch (Platform)
            {
                case PlatformID.MacOSX:
                    Process.StartInfo.FileName = "python3";
                    break;
                case PlatformID.Unix:
                    Process.StartInfo.FileName = "python3";
                    break;
                case PlatformID.Win32NT:
                    Process.StartInfo.FileName = "python3.exe";
                    break;
                default:
                    Console.WriteLine("This is an unsupported platform.");
                    return;
            }

            Process.StartInfo.RedirectStandardOutput = true;
            Process.StartInfo.UseShellExecute = false;
            Process.StartInfo.Arguments = "sources/python/system/mainGUI.py";
            Process.Start();
        }
    }
}
