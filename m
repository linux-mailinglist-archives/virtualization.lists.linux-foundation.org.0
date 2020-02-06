Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1EF154064
	for <lists.virtualization@lfdr.de>; Thu,  6 Feb 2020 09:36:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0C806214D2;
	Thu,  6 Feb 2020 08:36:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LkxnROyz4ISz; Thu,  6 Feb 2020 08:36:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 296E9204A8;
	Thu,  6 Feb 2020 08:36:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 16564C013E;
	Thu,  6 Feb 2020 08:36:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 09C23C013E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 08:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id ECDB38650F
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 08:36:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a0irPCwhvffo
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 08:36:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9FCA587133
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 08:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580978207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UeqMGJ0PCFB3EIVnqhK1jSaquiglkcj5+WjsBZdqSko=;
 b=A9iA0IHoTxy95rgTdYlpYIZZCLTCWt6+74bZ+hLN+nqgBcaA+9Qep/jgCitIovTLz34XTq
 uPIfzWVQKs22gYXWQ1Xn2BATemb47lnfwpJC9yhd8QlUqlVNokkCh2J7cQyVoiUXWFzy5Q
 XLgenvi461mWHVwXdFRAT/rvnShRgYQ=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-yK0QbxfFM6mk4LKrPPEZIA-1; Thu, 06 Feb 2020 03:36:46 -0500
Received: by mail-qt1-f200.google.com with SMTP id e37so3340872qtk.7
 for <virtualization@lists.linux-foundation.org>;
 Thu, 06 Feb 2020 00:36:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UeqMGJ0PCFB3EIVnqhK1jSaquiglkcj5+WjsBZdqSko=;
 b=oicAeLg8wToTwuMWJqPeesbFh7bLz2W15FyNSb6evdeR4Romryam+cM7ABunJ2HgbC
 RrRrDAV3XoB1Nevkd2iDHfy1AmuSv/T9jdszSEQd99X+Zygu2L0PTC7OQYpnJbUX3UiQ
 kMbFIWEL1vtsPy28PpOhjWCuWRRoMaol4VmRHN0lx8efh3NnOW5hh4Y2PTVsW3Ct7hQC
 47eFvJUgJSJqkQxxjDrj5UQdbgA7iEKMd+tfg6NTTFtZi31QQQjsoVXvM+48gV05JxW9
 //YPT9a959EE5FXm2ipuwyNYKysLfBCrIetOL37Q86KBfKDCRKplPl78maRTSFH795vt
 1gvA==
X-Gm-Message-State: APjAAAW4m5kClSfynCC36ANlIisRMCmc6H4mPnDf8ROKtkm9lrRPJC3+
 ZtKbOGiqj4hUnxEfBKjvHlKL1BOsCPIntUI9VPGdfAfYRRPqKcd586UU7DIGYt5AbcXp3gLyiqj
 oJd/+8OXgMu5xLz/Uvyief90PknRN2kB6ynnfBmoeZw==
X-Received: by 2002:a05:620a:133a:: with SMTP id
 p26mr1537140qkj.50.1580978205752; 
 Thu, 06 Feb 2020 00:36:45 -0800 (PST)
X-Google-Smtp-Source: APXvYqyCKYXTQb5/Fvn9PbpxsKDUKXGEA9EWCZqxmPKBdJhbBBol0FsQni5dbhdPQ8ikBYhqnUwfBQ==
X-Received: by 2002:a05:620a:133a:: with SMTP id
 p26mr1537132qkj.50.1580978205547; 
 Thu, 06 Feb 2020 00:36:45 -0800 (PST)
Received: from redhat.com (bzq-79-176-41-183.red.bezeqint.net. [79.176.41.183])
 by smtp.gmail.com with ESMTPSA id h3sm1085355qkk.104.2020.02.06.00.36.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 00:36:44 -0800 (PST)
Date: Thu, 6 Feb 2020 03:36:40 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 2/3] virtio_balloon: Fix memory leaks on errors in
 virtballoon_probe()
Message-ID: <20200206033633-mutt-send-email-mst@kernel.org>
References: <20200205163402.42627-1-david@redhat.com>
 <20200205163402.42627-3-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200205163402.42627-3-david@redhat.com>
X-MC-Unique: yK0QbxfFM6mk4LKrPPEZIA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Liang Li <liang.z.li@intel.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org
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

On Wed, Feb 05, 2020 at 05:34:01PM +0100, David Hildenbrand wrote:
> We forget to put the inode and unmount the kernfs used for compaction.
> 
> Fixes: 71994620bb25 ("virtio_balloon: replace oom notifier with shrinker")
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Wei Wang <wei.w.wang@intel.com>
> Cc: Liang Li <liang.z.li@intel.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Applied, thanks!

> ---
>  drivers/virtio/virtio_balloon.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
> index abef2306c899..7e5d84caeb94 100644
> --- a/drivers/virtio/virtio_balloon.c
> +++ b/drivers/virtio/virtio_balloon.c
> @@ -901,8 +901,7 @@ static int virtballoon_probe(struct virtio_device *vdev)
>  	vb->vb_dev_info.inode = alloc_anon_inode(balloon_mnt->mnt_sb);
>  	if (IS_ERR(vb->vb_dev_info.inode)) {
>  		err = PTR_ERR(vb->vb_dev_info.inode);
> -		kern_unmount(balloon_mnt);
> -		goto out_del_vqs;
> +		goto out_kern_unmount;
>  	}
>  	vb->vb_dev_info.inode->i_mapping->a_ops = &balloon_aops;
>  #endif
> @@ -913,13 +912,13 @@ static int virtballoon_probe(struct virtio_device *vdev)
>  		 */
>  		if (virtqueue_get_vring_size(vb->free_page_vq) < 2) {
>  			err = -ENOSPC;
> -			goto out_del_vqs;
> +			goto out_iput;
>  		}
>  		vb->balloon_wq = alloc_workqueue("balloon-wq",
>  					WQ_FREEZABLE | WQ_CPU_INTENSIVE, 0);
>  		if (!vb->balloon_wq) {
>  			err = -ENOMEM;
> -			goto out_del_vqs;
> +			goto out_iput;
>  		}
>  		INIT_WORK(&vb->report_free_page_work, report_free_page_func);
>  		vb->cmd_id_received_cache = VIRTIO_BALLOON_CMD_ID_STOP;
> @@ -953,6 +952,12 @@ static int virtballoon_probe(struct virtio_device *vdev)
>  out_del_balloon_wq:
>  	if (virtio_has_feature(vdev, VIRTIO_BALLOON_F_FREE_PAGE_HINT))
>  		destroy_workqueue(vb->balloon_wq);
> +out_iput:
> +#ifdef CONFIG_BALLOON_COMPACTION
> +	iput(vb->vb_dev_info.inode);
> +out_kern_unmount:
> +	kern_unmount(balloon_mnt);
> +#endif
>  out_del_vqs:
>  	vdev->config->del_vqs(vdev);
>  out_free_vb:
> -- 
> 2.24.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
