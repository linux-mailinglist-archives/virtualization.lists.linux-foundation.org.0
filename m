Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC3654D22E
	for <lists.virtualization@lfdr.de>; Wed, 15 Jun 2022 21:57:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0165D41939;
	Wed, 15 Jun 2022 19:57:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CpLolLeAUdFA; Wed, 15 Jun 2022 19:57:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 51CB44191B;
	Wed, 15 Jun 2022 19:57:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BAACDC002D;
	Wed, 15 Jun 2022 19:57:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B4C11C002D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jun 2022 19:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A321740B14
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jun 2022 19:57:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 40fIZ74tQ-zN
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jun 2022 19:57:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D954D404A0
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jun 2022 19:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655323050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CKcmnNcEYmcdw4qWTCbn/nsdbT+tYYNn239/9aheeI4=;
 b=BVO0Ih7EJjcEEgmsDyeYxzHyoEqmqPxBc4v4mm3dTJygFT3P0jeZtn5rDAy22qHP8a7nBK
 C1OVA23xuQI2YPPaxzun7boYTefpJZTI/ojYLuaZFYT5rGFoVh21vZdyniA3r/vTuWDPTT
 otSHApI3eBizGD9dsiZqQf1aOY80FtQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-548-REPOeR8aMYWyL99bZslGaw-1; Wed, 15 Jun 2022 15:57:27 -0400
X-MC-Unique: REPOeR8aMYWyL99bZslGaw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DAEBB101E988;
 Wed, 15 Jun 2022 19:57:26 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.19.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C2D29400E88E;
 Wed, 15 Jun 2022 19:57:26 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 91A702209F9; Wed, 15 Jun 2022 15:57:26 -0400 (EDT)
Date: Wed, 15 Jun 2022 15:57:26 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Xie Yongji <xieyongji@bytedance.com>
Subject: Re: [PATCH v2 2/2] virtiofs: allow skipping abort interface
Message-ID: <Yqo5puRB1Rcnluy7@redhat.com>
References: <20220615055755.197-1-xieyongji@bytedance.com>
 <20220615055755.197-3-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220615055755.197-3-xieyongji@bytedance.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Cc: linux-fsdevel@vger.kernel.org, zhangjiachen.jaycee@bytedance.com,
 virtualization@lists.linux-foundation.org, stefanha@redhat.com,
 miklos@szeredi.hu
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

On Wed, Jun 15, 2022 at 01:57:55PM +0800, Xie Yongji wrote:
> Virtio-fs does not support aborting requests which are being
> processed. Otherwise, it might trigger UAF since
> virtio_fs_request_complete() doesn't know the requests are
> aborted. So let's remove the abort interface.
> 
> Fixes: 15c8e72e88e0 ("fuse: allow skipping control interface and forced unmount")
> Signed-off-by: Xie Yongji <xieyongji@bytedance.com>

Just removing "abort" knob and retaining rest of the knobs feels little
odd but I guess I can live with that. I compiled and tested that abort
knob is gone indeed and pjdfstests still pass. So..

Reviewed-by: Vivek Goyal <vgoyal@redhat.com>

Thanks
Vivek

> ---
>  fs/fuse/control.c   | 4 ++--
>  fs/fuse/fuse_i.h    | 4 ++++
>  fs/fuse/inode.c     | 1 +
>  fs/fuse/virtio_fs.c | 1 +
>  4 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/fuse/control.c b/fs/fuse/control.c
> index 7cede9a3bc96..d93d8ea3a090 100644
> --- a/fs/fuse/control.c
> +++ b/fs/fuse/control.c
> @@ -272,8 +272,8 @@ int fuse_ctl_add_conn(struct fuse_conn *fc)
>  
>  	if (!fuse_ctl_add_dentry(parent, fc, "waiting", S_IFREG | 0400, 1,
>  				 NULL, &fuse_ctl_waiting_ops) ||
> -	    !fuse_ctl_add_dentry(parent, fc, "abort", S_IFREG | 0200, 1,
> -				 NULL, &fuse_ctl_abort_ops) ||
> +	    (!fc->no_abort_control && !fuse_ctl_add_dentry(parent, fc, "abort",
> +			S_IFREG | 0200, 1, NULL, &fuse_ctl_abort_ops)) ||
>  	    !fuse_ctl_add_dentry(parent, fc, "max_background", S_IFREG | 0600,
>  				 1, NULL, &fuse_conn_max_background_ops) ||
>  	    !fuse_ctl_add_dentry(parent, fc, "congestion_threshold",
> diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
> index a47f14d0ee3f..e29a4e2f2b35 100644
> --- a/fs/fuse/fuse_i.h
> +++ b/fs/fuse/fuse_i.h
> @@ -507,6 +507,7 @@ struct fuse_fs_context {
>  	bool default_permissions:1;
>  	bool allow_other:1;
>  	bool destroy:1;
> +	bool no_abort_control:1;
>  	bool no_force_umount:1;
>  	bool legacy_opts_show:1;
>  	enum fuse_dax_mode dax_mode;
> @@ -765,6 +766,9 @@ struct fuse_conn {
>  	/* Delete dentries that have gone stale */
>  	unsigned int delete_stale:1;
>  
> +	/** Do not create abort entry in fusectl fs */
> +	unsigned int no_abort_control:1;
> +
>  	/** Do not allow MNT_FORCE umount */
>  	unsigned int no_force_umount:1;
>  
> diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
> index 4059c6898e08..02a16cd35f42 100644
> --- a/fs/fuse/inode.c
> +++ b/fs/fuse/inode.c
> @@ -1564,6 +1564,7 @@ int fuse_fill_super_common(struct super_block *sb, struct fuse_fs_context *ctx)
>  	fc->legacy_opts_show = ctx->legacy_opts_show;
>  	fc->max_read = max_t(unsigned int, 4096, ctx->max_read);
>  	fc->destroy = ctx->destroy;
> +	fc->no_abort_control = ctx->no_abort_control;
>  	fc->no_force_umount = ctx->no_force_umount;
>  
>  	err = -ENOMEM;
> diff --git a/fs/fuse/virtio_fs.c b/fs/fuse/virtio_fs.c
> index 24bcf4dbca2a..af369bea6dbb 100644
> --- a/fs/fuse/virtio_fs.c
> +++ b/fs/fuse/virtio_fs.c
> @@ -1287,6 +1287,7 @@ static inline void virtio_fs_ctx_set_defaults(struct fuse_fs_context *ctx)
>  	ctx->max_read = UINT_MAX;
>  	ctx->blksize = 512;
>  	ctx->destroy = true;
> +	ctx->no_abort_control = true;
>  	ctx->no_force_umount = true;
>  }
>  
> -- 
> 2.20.1
> 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
