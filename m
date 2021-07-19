Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B704A3CEB67
	for <lists.virtualization@lfdr.de>; Mon, 19 Jul 2021 21:44:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38088402E9;
	Mon, 19 Jul 2021 19:44:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id obUKcYY6i_Wi; Mon, 19 Jul 2021 19:44:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id BCA304027E;
	Mon, 19 Jul 2021 19:44:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3BDCAC000E;
	Mon, 19 Jul 2021 19:44:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 27707C000E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Jul 2021 19:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 098AA834AE
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Jul 2021 19:44:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XuVNSd-tEJ_w
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Jul 2021 19:44:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3F7BD8348C
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Jul 2021 19:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626723851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6+Vn2lT8Duu4ETLusHk4HEcntNbTgbcK3y1YHO+zGXY=;
 b=YufoZGVgDTr3bb8zFfDhRcA8tQOWkgZDEynSXXBA7pFZ2Ft95TiGBYTX6ZgcOluJ5QzlH0
 /bax+jxxbmk+OH22O2hWUOcgVonlQClD8dpUAY3/cKy+3gExN90dDYvn0nbsuIhmWTy8Au
 Rbw78rhEPDlMA+VbQknwcZmVE+KUwyg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-M9Oq4w-EMfS81skZm7JwPg-1; Mon, 19 Jul 2021 15:44:09 -0400
X-MC-Unique: M9Oq4w-EMfS81skZm7JwPg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66D55101F003;
 Mon, 19 Jul 2021 19:44:08 +0000 (UTC)
Received: from horse.redhat.com (ovpn-118-17.rdu2.redhat.com [10.10.118.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 73E7860CA0;
 Mon, 19 Jul 2021 19:44:04 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 01E27223E4F; Mon, 19 Jul 2021 15:44:03 -0400 (EDT)
Date: Mon, 19 Jul 2021 15:44:03 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>
Subject: Re: [PATCH v2 3/4] fuse: add per-file DAX flag
Message-ID: <YPXWA+Uo5vFuHCH0@redhat.com>
References: <20210716104753.74377-1-jefflexu@linux.alibaba.com>
 <20210716104753.74377-4-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210716104753.74377-4-jefflexu@linux.alibaba.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

On Fri, Jul 16, 2021 at 06:47:52PM +0800, Jeffle Xu wrote:
> Add one flag for fuse_attr.flags indicating if DAX shall be enabled for
> this file.
> 
> When the per-file DAX flag changes for an *opened* file, the state of
> the file won't be updated until this file is closed and reopened later.
> 
> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
> ---
>  fs/fuse/dax.c             | 21 +++++++++++++++++----
>  fs/fuse/file.c            |  4 ++--
>  fs/fuse/fuse_i.h          |  5 +++--
>  fs/fuse/inode.c           |  5 ++++-
>  include/uapi/linux/fuse.h |  5 +++++
>  5 files changed, 31 insertions(+), 9 deletions(-)
> 
> diff --git a/fs/fuse/dax.c b/fs/fuse/dax.c
> index a478e824c2d0..0e862119757a 100644
> --- a/fs/fuse/dax.c
> +++ b/fs/fuse/dax.c
> @@ -1341,7 +1341,7 @@ static const struct address_space_operations fuse_dax_file_aops  = {
>  	.invalidatepage	= noop_invalidatepage,
>  };
>  
> -static bool fuse_should_enable_dax(struct inode *inode)
> +static bool fuse_should_enable_dax(struct inode *inode, unsigned int flags)
>  {
>  	struct fuse_conn *fc = get_fuse_conn(inode);
>  	unsigned int mode;
> @@ -1354,18 +1354,31 @@ static bool fuse_should_enable_dax(struct inode *inode)
>  	if (mode == FUSE_DAX_MOUNT_NEVER)
>  		return false;
>  
> -	return true;
> +	if (mode == FUSE_DAX_MOUNT_ALWAYS)
> +		return true;
> +
> +	WARN_ON(mode != FUSE_DAX_MOUNT_INODE);
> +	return flags & FUSE_ATTR_DAX;
>  }
>  
> -void fuse_dax_inode_init(struct inode *inode)
> +void fuse_dax_inode_init(struct inode *inode, unsigned int flags)
>  {
> -	if (!fuse_should_enable_dax(inode))
> +	if (!fuse_should_enable_dax(inode, flags))
>  		return;
>  
>  	inode->i_flags |= S_DAX;
>  	inode->i_data.a_ops = &fuse_dax_file_aops;
>  }
>  
> +void fuse_dax_dontcache(struct inode *inode, bool newdax)
> +{
> +	struct fuse_conn *fc = get_fuse_conn(inode);
> +
> +	if (fc->dax && fc->dax->mode == FUSE_DAX_MOUNT_INODE &&
> +	    IS_DAX(inode) != newdax)
> +		d_mark_dontcache(inode);
> +}
> +

This capability to mark an inode dontcache should probably be in a
separate patch. These seem to logically two functionalities. One is
enabling DAX on an inode. And second is making sure how soon you
see the effect of that change and hence marking inode dontcache.

Not sure how useful this is. In cache=none mode we should get rid of
inode ASAP. In cache=auto mode we will get rid of after 1 second (or
after a user specified timeout). So only place this seems to be
useful is cache=always.

Vivek


>  bool fuse_dax_check_alignment(struct fuse_conn *fc, unsigned int map_alignment)
>  {
>  	if (fc->dax && (map_alignment > FUSE_DAX_SHIFT)) {
> diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> index 97f860cfc195..cf42af492146 100644
> --- a/fs/fuse/file.c
> +++ b/fs/fuse/file.c
> @@ -3142,7 +3142,7 @@ static const struct address_space_operations fuse_file_aops  = {
>  	.write_end	= fuse_write_end,
>  };
>  
> -void fuse_init_file_inode(struct inode *inode)
> +void fuse_init_file_inode(struct inode *inode, struct fuse_attr *attr)
>  {
>  	struct fuse_inode *fi = get_fuse_inode(inode);
>  
> @@ -3156,5 +3156,5 @@ void fuse_init_file_inode(struct inode *inode)
>  	fi->writepages = RB_ROOT;
>  
>  	if (IS_ENABLED(CONFIG_FUSE_DAX))
> -		fuse_dax_inode_init(inode);
> +		fuse_dax_inode_init(inode, attr->flags);
>  }
> diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
> index f29018323845..0793b93d680a 100644
> --- a/fs/fuse/fuse_i.h
> +++ b/fs/fuse/fuse_i.h
> @@ -1000,7 +1000,7 @@ int fuse_notify_poll_wakeup(struct fuse_conn *fc,
>  /**
>   * Initialize file operations on a regular file
>   */
> -void fuse_init_file_inode(struct inode *inode);
> +void fuse_init_file_inode(struct inode *inode, struct fuse_attr *attr);
>  
>  /**
>   * Initialize inode operations on regular files and special files
> @@ -1252,8 +1252,9 @@ int fuse_dax_conn_alloc(struct fuse_conn *fc, unsigned int mode,
>  			struct dax_device *dax_dev);
>  void fuse_dax_conn_free(struct fuse_conn *fc);
>  bool fuse_dax_inode_alloc(struct super_block *sb, struct fuse_inode *fi);
> -void fuse_dax_inode_init(struct inode *inode);
> +void fuse_dax_inode_init(struct inode *inode, unsigned int flags);
>  void fuse_dax_inode_cleanup(struct inode *inode);
> +void fuse_dax_dontcache(struct inode *inode, bool newdax);
>  bool fuse_dax_check_alignment(struct fuse_conn *fc, unsigned int map_alignment);
>  void fuse_dax_cancel_work(struct fuse_conn *fc);
>  
> diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
> index f6b46395edb2..2ae92798126e 100644
> --- a/fs/fuse/inode.c
> +++ b/fs/fuse/inode.c
> @@ -269,6 +269,9 @@ void fuse_change_attributes(struct inode *inode, struct fuse_attr *attr,
>  		if (inval)
>  			invalidate_inode_pages2(inode->i_mapping);
>  	}
> +
> +	if (IS_ENABLED(CONFIG_FUSE_DAX))
> +		fuse_dax_dontcache(inode, attr->flags & FUSE_ATTR_DAX);
>  }
>  
>  static void fuse_init_inode(struct inode *inode, struct fuse_attr *attr)
> @@ -281,7 +284,7 @@ static void fuse_init_inode(struct inode *inode, struct fuse_attr *attr)
>  	inode->i_ctime.tv_nsec = attr->ctimensec;
>  	if (S_ISREG(inode->i_mode)) {
>  		fuse_init_common(inode);
> -		fuse_init_file_inode(inode);
> +		fuse_init_file_inode(inode, attr);
>  	} else if (S_ISDIR(inode->i_mode))
>  		fuse_init_dir(inode);
>  	else if (S_ISLNK(inode->i_mode))
> diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
> index 36ed092227fa..90c9df10d37a 100644
> --- a/include/uapi/linux/fuse.h
> +++ b/include/uapi/linux/fuse.h
> @@ -184,6 +184,9 @@
>   *
>   *  7.34
>   *  - add FUSE_SYNCFS
> + *
> + *  7.35
> + *  - add FUSE_ATTR_DAX
>   */
>  
>  #ifndef _LINUX_FUSE_H
> @@ -449,8 +452,10 @@ struct fuse_file_lock {
>   * fuse_attr flags
>   *
>   * FUSE_ATTR_SUBMOUNT: Object is a submount root
> + * FUSE_ATTR_DAX: Enable DAX for this file in per-file DAX mode
>   */
>  #define FUSE_ATTR_SUBMOUNT      (1 << 0)
> +#define FUSE_ATTR_DAX		(1 << 1)
>  
>  /**
>   * Open flags
> -- 
> 2.27.0
> 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
