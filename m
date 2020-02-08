Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id C271315648D
	for <lists.virtualization@lfdr.de>; Sat,  8 Feb 2020 14:31:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3AF1485F84;
	Sat,  8 Feb 2020 13:31:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iHiTu2pUDG-3; Sat,  8 Feb 2020 13:31:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3BD8A85FA3;
	Sat,  8 Feb 2020 13:31:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 18321C013E;
	Sat,  8 Feb 2020 13:31:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B97BBC013E
 for <virtualization@lists.linux-foundation.org>;
 Sat,  8 Feb 2020 13:31:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id AE20D85EA2
 for <virtualization@lists.linux-foundation.org>;
 Sat,  8 Feb 2020 13:31:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m6gFcM9jpjgq
 for <virtualization@lists.linux-foundation.org>;
 Sat,  8 Feb 2020 13:31:26 +0000 (UTC)
X-Greylist: delayed 00:56:48 by SQLgrey-1.7.6
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3325E85707
 for <virtualization@lists.linux-foundation.org>;
 Sat,  8 Feb 2020 13:31:26 +0000 (UTC)
Received: from fsav404.sakura.ne.jp (fsav404.sakura.ne.jp [133.242.250.103])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 018CX4NR077663;
 Sat, 8 Feb 2020 21:33:04 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav404.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav404.sakura.ne.jp);
 Sat, 08 Feb 2020 21:33:04 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav404.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 018CWvOG077502
 (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
 Sat, 8 Feb 2020 21:33:04 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [PATCH RFC] virtio_balloon: conservative balloon page shrinking
To: Wei Wang <wei.w.wang@intel.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org
References: <1580976107-16013-1-git-send-email-wei.w.wang@intel.com>
From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <345addae-0945-2f49-52cf-8e53446e63b2@i-love.sakura.ne.jp>
Date: Sat, 8 Feb 2020 21:32:54 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <1580976107-16013-1-git-send-email-wei.w.wang@intel.com>
Content-Language: en-US
Cc: mst@redhat.com, mhocko@kernel.org, tysand@google.com, namit@vmware.com,
 rientjes@google.com, alexander.h.duyck@linux.intel.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On 2020/02/06 17:01, Wei Wang wrote:
> There are cases that users want to shrink balloon pages after the
> pagecache depleted. The conservative_shrinker lets the shrinker
> shrink balloon pages when all the pagecache has been reclaimed.
> 
> @@ -796,6 +800,10 @@ static unsigned long shrink_balloon_pages(struct virtio_balloon *vb,
>  {
>  	unsigned long pages_freed = 0;
>  
> +	/* Balloon pages only gets shrunk when the pagecache depleted */
> +	if (conservative_shrinker && global_node_page_state(NR_FILE_PAGES))
> +		return 0;
> +

Is this NUMA aware? Can "node-A's NR_FILE_PAGES is already 0 and node-B's
NR_FILE_PAGES is not 0, but allocation request which triggered this shrinker
wants to allocate from only node-B" happen? Can some thread keep this shrinker
defunctional by keep increasing NR_FILE_PAGES?

Is this patch from "Re: Balloon pressuring page cache" thread? I hope that
the guest could start reclaiming memory based on host's request (like OOM
notifier chain) which is issued when host thinks that host is getting close
to OOM and thus guests should start returning their unused memory to host.
Maybe "periodically (e.g. 5 minutes)" in addition to "upon close to OOM
condition" is also possible.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
