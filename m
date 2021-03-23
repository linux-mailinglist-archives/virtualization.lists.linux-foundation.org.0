Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 25086346603
	for <lists.virtualization@lfdr.de>; Tue, 23 Mar 2021 18:10:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95DFB4038F;
	Tue, 23 Mar 2021 17:10:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XxjWfe4Bktzw; Tue, 23 Mar 2021 17:10:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6968140394;
	Tue, 23 Mar 2021 17:10:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E8663C0012;
	Tue, 23 Mar 2021 17:10:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 99A37C0001
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Mar 2021 17:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 732A283A49
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Mar 2021 17:10:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HbFNct4uNnrV
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Mar 2021 17:10:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7E80F82EFC
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Mar 2021 17:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616519416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ma9ajmhwh1SCxUznhp2byKu31F3pHY/+bCvUhMUuvis=;
 b=AyPv1367Jx5NDS6fRoaxNTgFfcUffbZLpfYmw5HtfFzXCthlbw4r6u6iENtRwoE2rNYMhF
 Q4P4ig3U5zq3EbaYXA/rPsbE8oEPQ/vqumYY+1SUxk9WnwokFU00H6z3EHywZL+CaPvNRs
 IdcKumJJ1oNk7CRtH9OpugqRWjb01T8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-F_ZRsSf7MHy393ojVjJn3Q-1; Tue, 23 Mar 2021 13:10:14 -0400
X-MC-Unique: F_ZRsSf7MHy393ojVjJn3Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 279EF180FCA9;
 Tue, 23 Mar 2021 17:10:12 +0000 (UTC)
Received: from horse.redhat.com (ovpn-116-103.rdu2.redhat.com [10.10.116.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1DFCD5C1C5;
 Tue, 23 Mar 2021 17:10:04 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 9A3B1220BCF; Tue, 23 Mar 2021 13:10:03 -0400 (EDT)
Date: Tue, 23 Mar 2021 13:10:03 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Lv Yunlong <lyl2019@mail.ustc.edu.cn>
Subject: Re: [PATCH] fuse: Fix a potential double free in virtio_fs_get_tree
Message-ID: <20210323171003.GC483930@redhat.com>
References: <20210323051831.13575-1-lyl2019@mail.ustc.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210323051831.13575-1-lyl2019@mail.ustc.edu.cn>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: linux-fsdevel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, stefanha@redhat.com, miklos@szeredi.hu
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

On Mon, Mar 22, 2021 at 10:18:31PM -0700, Lv Yunlong wrote:
> In virtio_fs_get_tree, fm is allocated by kzalloc() and
> assigned to fsc->s_fs_info by fsc->s_fs_info=fm statement.
> If the kzalloc() failed, it will goto err directly, so that
> fsc->s_fs_info must be non-NULL and fm will be freed.

sget_fc() will either consume fsc->s_fs_info in case a new super
block is allocated and set fsc->s_fs_info. In that case we don't
free fc or fm.

Or, sget_fc() will return with fsc->s_fs_info set in case we already
found a super block. In that case we need to free fc and fm.

In case of error from sget_fc(), fc/fm need to be freed first and
then error needs to be returned to caller.

        if (IS_ERR(sb))
                return PTR_ERR(sb);


If we allocated a new super block in sget_fc(), then next step is
to initialize it.

        if (!sb->s_root) {
                err = virtio_fs_fill_super(sb, fsc);
	}

If we run into errors here, then fc/fm need to be freed.

So current code looks fine to me.

Vivek

> 
> But later fm is freed again when virtio_fs_fill_super() fialed.
> I think the statement if (fsc->s_fs_info) {kfree(fm);} is
> misplaced.
> 
> My patch puts this statement in the correct palce to avoid
> double free.
> 
> Signed-off-by: Lv Yunlong <lyl2019@mail.ustc.edu.cn>
> ---
>  fs/fuse/virtio_fs.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/fuse/virtio_fs.c b/fs/fuse/virtio_fs.c
> index 8868ac31a3c0..727cf436828f 100644
> --- a/fs/fuse/virtio_fs.c
> +++ b/fs/fuse/virtio_fs.c
> @@ -1437,10 +1437,7 @@ static int virtio_fs_get_tree(struct fs_context *fsc)
>  
>  	fsc->s_fs_info = fm;
>  	sb = sget_fc(fsc, virtio_fs_test_super, set_anon_super_fc);
> -	if (fsc->s_fs_info) {
> -		fuse_conn_put(fc);
> -		kfree(fm);
> -	}
> +
>  	if (IS_ERR(sb))
>  		return PTR_ERR(sb);
>  
> @@ -1457,6 +1454,11 @@ static int virtio_fs_get_tree(struct fs_context *fsc)
>  		sb->s_flags |= SB_ACTIVE;
>  	}
>  
> +	if (fsc->s_fs_info) {
> +		fuse_conn_put(fc);
> +		kfree(fm);
> +	}
> +
>  	WARN_ON(fsc->root);
>  	fsc->root = dget(sb->s_root);
>  	return 0;
> -- 
> 2.25.1
> 
> 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
