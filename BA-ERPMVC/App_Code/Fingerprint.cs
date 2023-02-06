﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Caching;
using System.Web.Hosting;

/// <summary>
/// Summary description for Fingerprint
/// </summary>
public class Fingerprint
{
	public Fingerprint()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static string Tag(string rootRelativePath)
    {
        if (HttpRuntime.Cache[rootRelativePath] == null)
        {
            string absolute = HostingEnvironment.MapPath("~" + rootRelativePath);

            DateTime date = File.GetLastWriteTime(absolute);
            int index = rootRelativePath.LastIndexOf('/');

            string result = rootRelativePath.Insert(index, "/v-" + date.Ticks);
            HttpRuntime.Cache.Insert(rootRelativePath, result, new CacheDependency(absolute));
        }

        return HttpRuntime.Cache[rootRelativePath] as string;
    } 
}