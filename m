Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BF63E9CBC
	for <lists.virtualization@lfdr.de>; Thu, 12 Aug 2021 04:53:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8ED26400C2;
	Thu, 12 Aug 2021 02:53:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZXRwhQr0YFq1; Thu, 12 Aug 2021 02:53:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 5EA35401CF;
	Thu, 12 Aug 2021 02:53:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CA64AC000E;
	Thu, 12 Aug 2021 02:53:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 027C9C000E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Aug 2021 02:53:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D2D5860A48
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Aug 2021 02:53:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y3tjEIUPxlqD
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Aug 2021 02:52:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from out30-130.freemail.mail.aliyun.com
 (out30-130.freemail.mail.aliyun.com [115.124.30.130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7DC596074C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Aug 2021 02:52:58 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04420; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=8; SR=0; TI=SMTPD_---0UikSqoN_1628736774; 
Received: from admindeMacBook-Pro-2.local(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0UikSqoN_1628736774) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 12 Aug 2021 10:52:54 +0800
Subject: Re: [PATCH v3 0/8] fuse,virtiofs: support per-file DAX
From: JeffleXu <jefflexu@linux.alibaba.com>
To: vgoyal@redhat.com, stefanha@redhat.com, miklos@szeredi.hu
References: <20210804070653.118123-1-jefflexu@linux.alibaba.com>
Message-ID: <db04d1c4-2801-1182-f246-90692e796660@linux.alibaba.com>
Date: Thu, 12 Aug 2021 10:52:53 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210804070653.118123-1-jefflexu@linux.alibaba.com>
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

ping? Corresponding patches for virtiofsd are also included in this
patch set.

On 8/4/21 3:06 PM, Jeffle Xu wrote:
> changes since v2:
> - modify fuse_show_options() accordingly to make it compatible with
>   new tri-state mount option (patch 2)
> - extract FUSE protocol changes into one seperate patch (patch 3)
> - FUSE server/client need to negotiate if they support per-file DAX
>   (patch 4)
> - extract DONT_CACHE logic into patch 6/7
> 
> 
> This patchset adds support of per-file DAX for virtiofs, which is
> inspired by Ira Weiny's work on ext4[1] and xfs[2].
> 
> Any comment is welcome.
> 
> [1] commit 9cb20f94afcd ("fs/ext4: Make DAX mount option a tri-state")
> [2] commit 02beb2686ff9 ("fs/xfs: Make DAX mount option a tri-state")
> 
> v2: https://www.spinics.net/lists/linux-fsdevel/msg199584.html
> v1: https://www.spinics.net/lists/linux-virtualization/msg51008.html
> 
> Jeffle Xu (8):
>   fuse: add fuse_should_enable_dax() helper
>   fuse: Make DAX mount option a tri-state
>   fuse: support per-file DAX
>   fuse: negotiate if server/client supports per-file DAX
>   fuse: enable per-file DAX
>   fuse: mark inode DONT_CACHE when per-file DAX indication changes
>   fuse: support changing per-file DAX flag inside guest
>   fuse: show '-o dax=inode' option only when FUSE server supports
> 
>  fs/fuse/dax.c             | 32 ++++++++++++++++++++++++++++++--
>  fs/fuse/file.c            |  4 ++--
>  fs/fuse/fuse_i.h          | 22 ++++++++++++++++++----
>  fs/fuse/inode.c           | 27 ++++++++++++++++++---------
>  fs/fuse/ioctl.c           | 15 +++++++++++++--
>  fs/fuse/virtio_fs.c       | 16 ++++++++++++++--
>  include/uapi/linux/fuse.h |  9 ++++++++-
>  7 files changed, 103 insertions(+), 22 deletions(-)
> 

-- 
Thanks,
Jeffle
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
