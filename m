Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DC64021DE
	for <lists.virtualization@lfdr.de>; Tue,  7 Sep 2021 04:07:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A874404F4;
	Tue,  7 Sep 2021 02:07:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2iNEBdOpuZXD; Tue,  7 Sep 2021 02:07:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 7C02E4050D;
	Tue,  7 Sep 2021 02:07:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E27D4C001B;
	Tue,  7 Sep 2021 02:07:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9CF17C001B
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Sep 2021 02:07:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 82D6C60B90
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Sep 2021 02:07:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8FMU1gP5ijYD
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Sep 2021 02:07:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from out30-131.freemail.mail.aliyun.com
 (out30-131.freemail.mail.aliyun.com [115.124.30.131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 09DED60A35
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Sep 2021 02:07:23 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R451e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=alimailimapcm10staff010182156082;
 MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0UnXJ-6m_1630980439; 
Received: from admindeMacBook-Pro-2.local(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0UnXJ-6m_1630980439) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 07 Sep 2021 10:07:20 +0800
Subject: Re: [PATCH 0/2] virtiofs: miscellaneous fixes
From: JeffleXu <jefflexu@linux.alibaba.com>
To: vgoyal@redhat.com, stefanha@redhat.com, miklos@szeredi.hu
References: <20210812054618.26057-1-jefflexu@linux.alibaba.com>
Message-ID: <dd4c7cd8-bbf0-4e15-8ed9-d6babdc40eca@linux.alibaba.com>
Date: Tue, 7 Sep 2021 10:07:19 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210812054618.26057-1-jefflexu@linux.alibaba.com>
Content-Language: en-US
Cc: linux-fsdevel@vger.kernel.org, virtio-fs@redhat.com,
 bo.liu@linux.alibaba.com, joseph.qi@linux.alibaba.com,
 virtualization@lists.linux-foundation.org
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

ping ...

On 8/12/21 1:46 PM, Jeffle Xu wrote:
> Some fixes or optimization for virtiofs, which are authored by Liu Bo.
> 
> Liu Bo (2):
>   virtio-fs: disable atomic_o_trunc if no_open is enabled
>   virtiofs: reduce lock contention on fpq->lock
> 
>  fs/fuse/file.c      | 11 +++++++++--
>  fs/fuse/virtio_fs.c |  3 ---
>  2 files changed, 9 insertions(+), 5 deletions(-)
> 

-- 
Thanks,
Jeffle
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
