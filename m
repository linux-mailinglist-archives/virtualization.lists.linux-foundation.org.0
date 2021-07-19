Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3313CEB7D
	for <lists.virtualization@lfdr.de>; Mon, 19 Jul 2021 21:55:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D5DC6075A;
	Mon, 19 Jul 2021 19:55:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CmWc7pQtPcVZ; Mon, 19 Jul 2021 19:55:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 4DB5260752;
	Mon, 19 Jul 2021 19:55:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BA632C001F;
	Mon, 19 Jul 2021 19:55:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 64BBAC000E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Jul 2021 19:55:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 35D084027E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Jul 2021 19:55:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aTBN_awXO9J9
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Jul 2021 19:55:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 77C5C40155
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Jul 2021 19:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626724500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ibg4Lx1brl8A2uQKTgR9ICt6oCv2YJSZ2UO5NpUhpFQ=;
 b=UkFnXWNUiS5zgMdbrj8Nkq9ILulVI40L5rBGmcOzLjRDL+HQw1nSgMlLLT1jC1ouGiOGok
 eehn+3ty1MEW8KUDHNwWnPXAzUHxKpTnbm+PD2BLCfPUIdpdzTzjBtgRjd3tyaOI2OyBGE
 +qIlHT1Ar4BpgFwYgNbJcCarZt6+lBY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-XlKDk-YIOO2EesBUIZXWOA-1; Mon, 19 Jul 2021 15:54:58 -0400
X-MC-Unique: XlKDk-YIOO2EesBUIZXWOA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B269A1937FC4;
 Mon, 19 Jul 2021 19:54:57 +0000 (UTC)
Received: from horse.redhat.com (ovpn-118-17.rdu2.redhat.com [10.10.118.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BEC905D9FC;
 Mon, 19 Jul 2021 19:54:53 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 24269223E4F; Mon, 19 Jul 2021 15:54:53 -0400 (EDT)
Date: Mon, 19 Jul 2021 15:54:53 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>
Subject: Re: [PATCH v2 4/4] fuse: support changing per-file DAX flag inside
 guest
Message-ID: <YPXYjcv2wq4ixj/x@redhat.com>
References: <20210716104753.74377-1-jefflexu@linux.alibaba.com>
 <20210716104753.74377-5-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210716104753.74377-5-jefflexu@linux.alibaba.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: miklos@szeredi.hu, virtualization@lists.linux-foundation.org,
 joseph.qi@linux.alibaba.com, bo.liu@linux.alibaba.com, stefanha@redhat.com,
 linux-fsdevel@vger.kernel.org
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

On Fri, Jul 16, 2021 at 06:47:53PM +0800, Jeffle Xu wrote:
> Fuse client can enable or disable per-file DAX inside guest by
> chattr(1). Similarly the new state won't be updated until the file is
> closed and reopened later.
> 
> It is worth nothing that it is a best-effort style, since whether
> per-file DAX is enabled or not is controlled by fuse_attr.flags retrieved
> by FUSE LOOKUP routine, while the algorithm constructing fuse_attr.flags
> is totally fuse server specific, not to mention ioctl may not be
> supported by fuse server at all.
> 
> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
> ---
>  fs/fuse/ioctl.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/fuse/ioctl.c b/fs/fuse/ioctl.c
> index 546ea3d58fb4..172e05c3f038 100644
> --- a/fs/fuse/ioctl.c
> +++ b/fs/fuse/ioctl.c
> @@ -460,6 +460,7 @@ int fuse_fileattr_set(struct user_namespace *mnt_userns,
>  	struct fuse_file *ff;
>  	unsigned int flags = fa->flags;
>  	struct fsxattr xfa;
> +	bool newdax;
>  	int err;
>  
>  	ff = fuse_priv_ioctl_prepare(inode);
> @@ -467,10 +468,9 @@ int fuse_fileattr_set(struct user_namespace *mnt_userns,
>  		return PTR_ERR(ff);
>  
>  	if (fa->flags_valid) {
> +		newdax = flags & FS_DAX_FL;
>  		err = fuse_priv_ioctl(inode, ff, FS_IOC_SETFLAGS,
>  				      &flags, sizeof(flags));
> -		if (err)
> -			goto cleanup;
>  	} else {
>  		memset(&xfa, 0, sizeof(xfa));
>  		xfa.fsx_xflags = fa->fsx_xflags;
> @@ -479,11 +479,14 @@ int fuse_fileattr_set(struct user_namespace *mnt_userns,
>  		xfa.fsx_projid = fa->fsx_projid;
>  		xfa.fsx_cowextsize = fa->fsx_cowextsize;
>  
> +		newdax = fa->fsx_xflags & FS_XFLAG_DAX;
>  		err = fuse_priv_ioctl(inode, ff, FS_IOC_FSSETXATTR,
>  				      &xfa, sizeof(xfa));
>  	}
>  
> -cleanup:
> +	if (!err && IS_ENABLED(CONFIG_FUSE_DAX))
> +		fuse_dax_dontcache(inode, newdax);

This assumes that server will set ATTR_DAX flag for inode based on
whether inode has FS_DAX_FL set or not.

So that means server first will have to know that client has DAX enabled
so that it can query FS_DAX_FL. And in current framework we don't have
a way for server to know if client is using DAX or not.

I think there is little disconnect here. So either client should be
checking FS_DAX_FL flag on inode. But we probably don't want to pay
extra round trip cost for this. 

That means somehow server should return this information as part of
inode attrs only if client wants this extra file attr informaiton. So
may be GETATTR should be enhanced instead to return file attr information
too if client asked for it?

I have not looked what it takes to implement this. If this is too 
complicated, then alternate approach will be that it is up to the
server to decide what inodes should use DAX and there is no guarantee
that server will make sue of FS_DAX_FL flag. fuse will still support
setting FS_DAX_FL but server could choose to not use it at all. In
that case fuse client will not have to query file attrs in GETATTR
and just rely on ATTR_DAX flag set by server. I think that's what
you are implementing.  If that's the case then dontcache does not make
much sense because you don't even know if server is looking at
FS_DAX_FL to decide whether DAX should be used or not.

Thanks
Vivek

> +
>  	fuse_priv_ioctl_cleanup(inode, ff);
>  
>  	return err;
> -- 
> 2.27.0
> 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
