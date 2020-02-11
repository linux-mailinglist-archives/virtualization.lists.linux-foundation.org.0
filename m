Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1121591B9
	for <lists.virtualization@lfdr.de>; Tue, 11 Feb 2020 15:20:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2D381204E7;
	Tue, 11 Feb 2020 14:20:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1bWTGSJhm4+g; Tue, 11 Feb 2020 14:20:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 18400204B4;
	Tue, 11 Feb 2020 14:20:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E8A8EC07FE;
	Tue, 11 Feb 2020 14:20:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 17BABC07FE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 14:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 054C12038F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 14:20:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p-rv-hVrgivk
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 14:20:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by silver.osuosl.org (Postfix) with ESMTPS id 9E07B2043E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 14:20:34 +0000 (UTC)
Received: from fsav105.sakura.ne.jp (fsav105.sakura.ne.jp [27.133.134.232])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 01BEIxQr052722;
 Tue, 11 Feb 2020 23:18:59 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav105.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav105.sakura.ne.jp);
 Tue, 11 Feb 2020 23:18:59 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav105.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 01BEIxhe052716
 (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
 Tue, 11 Feb 2020 23:18:59 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [PATCH RFC] virtio_balloon: conservative balloon page shrinking
To: "Wang, Wei W" <wei.w.wang@intel.com>
References: <345addae-0945-2f49-52cf-8e53446e63b2@i-love.sakura.ne.jp>
 <286AC319A985734F985F78AFA26841F73E429F32@shsmsx102.ccr.corp.intel.com>
 <202002100357.01A3vNNU089831@www262.sakura.ne.jp>
 <286AC319A985734F985F78AFA26841F73E42AD6D@shsmsx102.ccr.corp.intel.com>
From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <51306985-90ac-6e6b-d085-4e076698c48c@i-love.sakura.ne.jp>
Date: Tue, 11 Feb 2020 23:18:56 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <286AC319A985734F985F78AFA26841F73E42AD6D@shsmsx102.ccr.corp.intel.com>
Content-Language: en-US
Cc: "mst@redhat.com" <mst@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "tysand@google.com" <tysand@google.com>, "namit@vmware.com" <namit@vmware.com>,
 "rientjes@google.com" <rientjes@google.com>,
 "alexander.h.duyck@linux.intel.com" <alexander.h.duyck@linux.intel.com>,
 "mhocko@kernel.org" <mhocko@kernel.org>
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

On 2020/02/10 16:27, Wang, Wei W wrote:
>> Well, my comment is rather: "Do not try to reserve guest's memory. In other
>> words, do not try to maintain balloons on the guest side. Since host would
>> be able to cache file data on the host's cache, guests would be able to
>> quickly fetch file data from host's cache via normal I/O requests." ;-)
> 
> Didn't this one. The discussion was about guest pagecache pages v.s. guest balloon pages.
> Why is host's pagecache here?

I'm expecting a mode: "Guests should try to minimize pagecache pages (and teach
host to treat reclaimed pages as if POSIX_FADV_DONTNEED) instead of managing
guest balloon pages". In other words, as if

  while :; sleep 5; echo 1 > /proc/sys/vm/drop_caches; done

is running in the guest's kernel. And as if

  echo 2 > /proc/sys/vm/drop_caches

is triggered in the guest's kernel when host requested guests to reclaim
memory. No long-life balloons. Guest balloons do not need to care about
NUMA. Just leave the management of pagecache pages to the host.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
