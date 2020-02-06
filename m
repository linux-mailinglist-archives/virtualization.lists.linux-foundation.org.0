Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C961540D5
	for <lists.virtualization@lfdr.de>; Thu,  6 Feb 2020 10:04:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 11E1882322;
	Thu,  6 Feb 2020 09:04:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mpGw_n4p3gHc; Thu,  6 Feb 2020 09:04:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7B078821BC;
	Thu,  6 Feb 2020 09:04:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 46780C0881;
	Thu,  6 Feb 2020 09:04:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 91207C013E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 09:04:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7E4992107D
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 09:04:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1pZ1mIVYufyl
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 09:04:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 6369E20436
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 09:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580979874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u+qkwfnp/KTTLaMdjyM+vV6SHYAbouc0gSH5Oc/Hljw=;
 b=eNFIuJzLK3A/lIQzdVnuPeoFAEUZ00JXEJi6Ak08x0HqYjNm86fFLWJw+g4I3s+wK90B8u
 9uCyRYmUDht4R75CclbdoTcjoeZ5lJNF0t0b5DG4n15zHpK0mcDfFy1aMkNA95ii75gHJs
 1uIEkDN3hjtVId/Ae4d/uBqZwwabCBY=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-tfiQTw-LOvGnl49aaRsVtg-1; Thu, 06 Feb 2020 04:04:27 -0500
Received: by mail-qt1-f198.google.com with SMTP id c22so3347501qtn.23
 for <virtualization@lists.linux-foundation.org>;
 Thu, 06 Feb 2020 01:04:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=u+qkwfnp/KTTLaMdjyM+vV6SHYAbouc0gSH5Oc/Hljw=;
 b=o3YS/gt5m6i0pekoNKJdolSsCx5k/hF0UN+MO5nAp2BqLUTtsCtkWOcDAZK1+6FnDW
 GtNd8eDqyqhnob1alBjZvvvHJ9J6MFuFPe6YYFd2Go1zLpEy3hWGCQCn59DiikHW8EVb
 zOlfB+GCF6iFWFSTt9mVEVsZH01O3QloTjYYrd6jeFiMyDOgMFBcXy/ATCBI3GNL/e4l
 dICrH9LV3H3Seyxx3GOXPEDo5AaA9T1Z+BeGt4XZ7+h6TBu4ghvvsH5GjomQy9UfMDda
 StluaYB/v0mSCcLg88BvTZTfX2UYmp4An0MvzGNCtw0Ty9/f/IipCBMDAZk2H9suZzwD
 62Sw==
X-Gm-Message-State: APjAAAVs/z/A5NuuuWSjB3yEfsUPD+QGv3eL3DmiLBAtgikvM3LpLcM7
 YPh+nInxMJsKF7wSoKYULny0hcLGK6KyQb834HYfv3Jqk7z99uUAla4DJxqP9LWB6jsUL8XWlK+
 No5hvxizJ4YTPdrXq4cn7W6VeXGJbt7RIbKkiFqMBDg==
X-Received: by 2002:a05:6214:1267:: with SMTP id
 r7mr1480784qvv.160.1580979867100; 
 Thu, 06 Feb 2020 01:04:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqySvSBmE5xPypmInGDp+iFwB4kmBupJhzPCzwonGKaDhbeI2Tsll81uaJmjg40xH+Jpub/H7Q==
X-Received: by 2002:a05:6214:1267:: with SMTP id
 r7mr1480773qvv.160.1580979866830; 
 Thu, 06 Feb 2020 01:04:26 -0800 (PST)
Received: from redhat.com (bzq-79-176-41-183.red.bezeqint.net. [79.176.41.183])
 by smtp.gmail.com with ESMTPSA id 205sm1121279qkd.61.2020.02.06.01.04.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 01:04:25 -0800 (PST)
Date: Thu, 6 Feb 2020 04:04:21 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Wei Wang <wei.w.wang@intel.com>
Subject: Re: [PATCH RFC] virtio_balloon: conservative balloon page shrinking
Message-ID: <20200206035749-mutt-send-email-mst@kernel.org>
References: <1580976107-16013-1-git-send-email-wei.w.wang@intel.com>
MIME-Version: 1.0
In-Reply-To: <1580976107-16013-1-git-send-email-wei.w.wang@intel.com>
X-MC-Unique: tfiQTw-LOvGnl49aaRsVtg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: penguin-kernel@i-love.sakura.ne.jp, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, tysand@google.com, namit@vmware.com,
 rientjes@google.com, alexander.h.duyck@linux.intel.com, mhocko@kernel.org
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

On Thu, Feb 06, 2020 at 04:01:47PM +0800, Wei Wang wrote:
> There are cases that users want to shrink balloon pages after the
> pagecache depleted. The conservative_shrinker lets the shrinker
> shrink balloon pages when all the pagecache has been reclaimed.
> 
> Signed-off-by: Wei Wang <wei.w.wang@intel.com>

I'd rather avoid module parameters, but otherwise looks 
like a reasonable idea.
Tyler, what do you think?


> ---
>  drivers/virtio/virtio_balloon.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
> index 93f995f6cf36..b4c5bb13a867 100644
> --- a/drivers/virtio/virtio_balloon.c
> +++ b/drivers/virtio/virtio_balloon.c
> @@ -42,6 +42,10 @@
>  static struct vfsmount *balloon_mnt;
>  #endif
>  
> +static bool conservative_shrinker = true;
> +module_param(conservative_shrinker, bool, 0644);
> +MODULE_PARM_DESC(conservative_shrinker, "conservatively shrink balloon pages");
> +
>  enum virtio_balloon_vq {
>  	VIRTIO_BALLOON_VQ_INFLATE,
>  	VIRTIO_BALLOON_VQ_DEFLATE,
> @@ -796,6 +800,10 @@ static unsigned long shrink_balloon_pages(struct virtio_balloon *vb,
>  {
>  	unsigned long pages_freed = 0;
>  
> +	/* Balloon pages only gets shrunk when the pagecache depleted */
> +	if (conservative_shrinker && global_node_page_state(NR_FILE_PAGES))
> +		return 0;
> +
>  	/*
>  	 * One invocation of leak_balloon can deflate at most
>  	 * VIRTIO_BALLOON_ARRAY_PFNS_MAX balloon pages, so we call it
> @@ -837,7 +845,11 @@ static unsigned long virtio_balloon_shrinker_count(struct shrinker *shrinker,
>  					struct virtio_balloon, shrinker);
>  	unsigned long count;
>  
> -	count = vb->num_pages / VIRTIO_BALLOON_PAGES_PER_PAGE;
> +	if (conservative_shrinker && global_node_page_state(NR_FILE_PAGES))

I'd rather have an API for that in mm/. In particular, do we want other
shrinkers to run, not just pagecache? To pick an example I'm familiar
with, kvm mmu cache for nested virt?

> +		count = 0;
> +	else
> +		count = vb->num_pages / VIRTIO_BALLOON_PAGES_PER_PAGE;
> +
>  	count += vb->num_free_page_blocks * VIRTIO_BALLOON_HINT_BLOCK_PAGES;
>  
>  	return count;
> -- 
> 2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
