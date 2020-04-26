Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4094C1B8D5F
	for <lists.virtualization@lfdr.de>; Sun, 26 Apr 2020 09:25:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E0A1A2052A;
	Sun, 26 Apr 2020 07:25:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dByCQCWhxOFY; Sun, 26 Apr 2020 07:24:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C2139204A8;
	Sun, 26 Apr 2020 07:24:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B0A61C0172;
	Sun, 26 Apr 2020 07:24:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 82DC3C0172
 for <virtualization@lists.linux-foundation.org>;
 Sun, 26 Apr 2020 07:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6B82F204A8
 for <virtualization@lists.linux-foundation.org>;
 Sun, 26 Apr 2020 07:24:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0QKz5q6EmEHT
 for <virtualization@lists.linux-foundation.org>;
 Sun, 26 Apr 2020 07:24:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by silver.osuosl.org (Postfix) with ESMTPS id 1B456203C8
 for <virtualization@lists.linux-foundation.org>;
 Sun, 26 Apr 2020 07:24:57 +0000 (UTC)
IronPort-SDR: +Gy2YmvpcJZyDKEHbPmIVLwQQ9c/YVnk/n2oLLq1AJRIRqqLqA5s+6bqLVjHnopWVmQFe+XiTd
 KGvYv9Ff+VvA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2020 00:24:56 -0700
IronPort-SDR: A7ToqJMC0DPF550kmSQ5m/V+/dow0oBkMavLZN8ZsAkWlM7MtnKMgmbjfaAurGIqh4Lsep/BQb
 rb+g6YtBXn5Q==
X-IronPort-AV: E=Sophos;i="5.73,319,1583222400"; 
 d="scan'208,217";a="457949221"
Received: from lingshan-mobl5.ccr.corp.intel.com (HELO [10.249.174.216])
 ([10.249.174.216])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2020 00:24:53 -0700
Subject: Re: [PATCH V2 1/2] vdpa: Support config interrupt in vhost_vdpa
To: Jason Wang <jasowang@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 mst@redhat.com, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
References: <1587881384-2133-1-git-send-email-lingshan.zhu@intel.com>
 <1587881384-2133-2-git-send-email-lingshan.zhu@intel.com>
 <055fb826-895d-881b-719c-228d0cc9a7bf@redhat.com>
 <e345cc85-aa9d-1173-8308-f0a301fca2b2@redhat.com>
From: Zhu Lingshan <lingshan.zhu@linux.intel.com>
Message-ID: <fb51aa36-9a58-fd50-a4fa-4cc887357367@linux.intel.com>
Date: Sun, 26 Apr 2020 15:24:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <e345cc85-aa9d-1173-8308-f0a301fca2b2@redhat.com>
Content-Language: en-US
Cc: lulu@redhat.com
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5490650298144481682=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

This is a multi-part message in MIME format.
--===============5490650298144481682==
Content-Type: multipart/alternative;
 boundary="------------8C42731C34136C49A02C234D"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------8C42731C34136C49A02C234D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 4/26/2020 3:03 PM, Jason Wang wrote:
>
> On 2020/4/26 下午2:58, Jason Wang wrote:
>>>
>>> diff --git a/drivers/vhost/vhost.h b/drivers/vhost/vhost.h
>>> index 1813821..8663139 100644
>>> --- a/drivers/vhost/vhost.h
>>> +++ b/drivers/vhost/vhost.h
>>> @@ -18,6 +18,8 @@
>>>   typedef void (*vhost_work_fn_t)(struct vhost_work *work);
>>>     #define VHOST_WORK_QUEUED 1
>>> +#define VHOST_FILE_UNBIND -1
>>
>>
>> I think it's better to document this in uapi. 
>
>
> I meant e.g in vhost_vring_file, we had a comment of unbinding:
>
> struct vhost_vring_file {
>     unsigned int index;
>     int fd; /* Pass -1 to unbind from file. */
>
> };

I think it is better to use an int fd than vhost_vring_file, to avoid the confusions,
so if we add#define VHOST_FILE_UNBIND -1 in the uapi header, can it document itself?
Thanks

>
> Thanks
>

--------------8C42731C34136C49A02C234D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><tt><br>
      </tt></p>
    <div class="moz-cite-prefix"><tt>On 4/26/2020 3:03 PM, Jason Wang
        wrote:</tt><tt><br>
      </tt></div>
    <blockquote type="cite"
      cite="mid:e345cc85-aa9d-1173-8308-f0a301fca2b2@redhat.com">
      <tt><br>
      </tt><tt>On 2020/4/26 下午2:58, Jason Wang wrote:
      </tt><tt><br>
      </tt>
      <blockquote type="cite">
        <blockquote type="cite">
          <tt><br>
          </tt><tt>diff --git a/drivers/vhost/vhost.h
            b/drivers/vhost/vhost.h
          </tt><tt><br>
          </tt><tt>index 1813821..8663139 100644
          </tt><tt><br>
          </tt><tt>--- a/drivers/vhost/vhost.h
          </tt><tt><br>
          </tt><tt>+++ b/drivers/vhost/vhost.h
          </tt><tt><br>
          </tt><tt>@@ -18,6 +18,8 @@
          </tt><tt><br>
          </tt><tt>  typedef void (*vhost_work_fn_t)(struct vhost_work
            *work);
          </tt><tt><br>
          </tt><tt>    #define VHOST_WORK_QUEUED 1
          </tt><tt><br>
          </tt><tt>+#define VHOST_FILE_UNBIND -1
          </tt><tt><br>
          </tt></blockquote>
        <tt><br>
        </tt>
        <tt><br>
        </tt><tt>I think it's better to document this in uapi. </tt></blockquote>
      <tt><br>
      </tt>
      <tt><br>
      </tt><tt>I meant e.g in vhost_vring_file, we had a comment of
        unbinding:
      </tt><tt><br>
      </tt>
      <tt><br>
      </tt><tt>struct vhost_vring_file {
      </tt><tt><br>
      </tt><tt>    unsigned int index;
      </tt><tt><br>
      </tt><tt>    int fd; /* Pass -1 to unbind from file. */
      </tt><tt><br>
      </tt>
      <tt><br>
      </tt><tt>};
      </tt><tt><br>
      </tt></blockquote>
    <pre>I think it is better to use an int fd than vhost_vring_file, to avoid the confusions,
so if we add <tt>#define VHOST_FILE_UNBIND -1 in the uapi header, can it document itself?
</tt>
Thanks
</pre>
    <blockquote type="cite"
      cite="mid:e345cc85-aa9d-1173-8308-f0a301fca2b2@redhat.com">
      <tt><br>
      </tt><tt>Thanks
      </tt><tt><br>
      </tt>
      <tt><br>
      </tt>
    </blockquote>
  </body>
</html>

--------------8C42731C34136C49A02C234D--

--===============5490650298144481682==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============5490650298144481682==--
