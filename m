Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 729DB365F93
	for <lists.virtualization@lfdr.de>; Tue, 20 Apr 2021 20:42:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E646C605D1;
	Tue, 20 Apr 2021 18:42:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y0ApOMlYcJ1h; Tue, 20 Apr 2021 18:42:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E2C660AC3;
	Tue, 20 Apr 2021 18:42:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 035F7C000B;
	Tue, 20 Apr 2021 18:42:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CCDA6C000B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Apr 2021 18:42:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6D0583B75
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Apr 2021 18:42:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2TCnQVKEeqHa
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Apr 2021 18:42:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8E0E883B60
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Apr 2021 18:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618944158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7mdCDDR1UwhPs9uPCLeGgCD1aXU32L0oKWL1nBZu4VQ=;
 b=EOKYJDMPdSPns+/QJipaVjxRMQy5FNAMWML7Oi/tArNoGUSSETbm2HZTGcHYEc9UPtwj7J
 4T49mJ9kNsOVMErLv8QNXHEageiiZU/ZZ943iMb/+4GTXCPtfeK36L2xr6or5scVs3Ogm1
 ++u75c/8ak1cCU+yksX/EleUwP0JPvA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-526-gZecwzx3NWaFzN7Pb32uMA-1; Tue, 20 Apr 2021 14:42:35 -0400
X-MC-Unique: gZecwzx3NWaFzN7Pb32uMA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B44661008067;
 Tue, 20 Apr 2021 18:42:34 +0000 (UTC)
Received: from horse.redhat.com (ovpn-119-80.rdu2.redhat.com [10.10.119.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CADE65D6AB;
 Tue, 20 Apr 2021 18:42:26 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 5F81F22054F; Tue, 20 Apr 2021 14:42:26 -0400 (EDT)
Date: Tue, 20 Apr 2021 14:42:26 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [Virtio-fs] [PATCH] virtiofs: propagate sync() to file server
Message-ID: <20210420184226.GC1529659@redhat.com>
References: <20210419150848.275757-1-groug@kaod.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210419150848.275757-1-groug@kaod.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: Miklos Szeredi <miklos@szeredi.hu>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, virtio-fs@redhat.com,
 linux-fsdevel@vger.kernel.org, Robert Krawitz <rlk@redhat.com>
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

On Mon, Apr 19, 2021 at 05:08:48PM +0200, Greg Kurz wrote:
> Even if POSIX doesn't mandate it, linux users legitimately expect
> sync() to flush all data and metadata to physical storage when it
> is located on the same system. This isn't happening with virtiofs
> though : sync() inside the guest returns right away even though
> data still needs to be flushed from the host page cache.
> 
> This is easily demonstrated by doing the following in the guest:
> 
> $ dd if=/dev/zero of=/mnt/foo bs=1M count=5K ; strace -T -e sync sync
> 5120+0 records in
> 5120+0 records out
> 5368709120 bytes (5.4 GB, 5.0 GiB) copied, 5.22224 s, 1.0 GB/s
> sync()                                  = 0 <0.024068>
> +++ exited with 0 +++
> 
> and start the following in the host when the 'dd' command completes
> in the guest:
> 
> $ strace -T -e fsync sync virtiofs/foo
		       ^^^^
That "sync" is not /usr/bin/sync and its your own binary to call fsync()?

> fsync(3)                                = 0 <10.371640>
> +++ exited with 0 +++
> 
> There are no good reasons not to honor the expected behavior of
> sync() actually : it gives an unrealistic impression that virtiofs
> is super fast and that data has safely landed on HW, which isn't
> the case obviously.
> 
> Implement a ->sync_fs() superblock operation that sends a new
> FUSE_SYNC request type for this purpose. The FUSE_SYNC request
> conveys the 'wait' argument of ->sync_fs() in case the file
> server has a use for it. Like with FUSE_FSYNC and FUSE_FSYNCDIR,
> lack of support for FUSE_SYNC in the file server is treated as
> permanent success.
> 
> Note that such an operation allows the file server to DoS sync().
> Since a typical FUSE file server is an untrusted piece of software
> running in userspace, this is disabled by default.  Only enable it
> with virtiofs for now since virtiofsd is supposedly trusted by the
> guest kernel.
> 
> Reported-by: Robert Krawitz <rlk@redhat.com>
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
> 
> Can be tested using the following custom QEMU with FUSE_SYNCFS support:
> 
> https://gitlab.com/gkurz/qemu/-/tree/fuse-sync
> 
> ---
>  fs/fuse/fuse_i.h          |  3 +++
>  fs/fuse/inode.c           | 29 +++++++++++++++++++++++++++++
>  fs/fuse/virtio_fs.c       |  1 +
>  include/uapi/linux/fuse.h | 11 ++++++++++-
>  4 files changed, 43 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
> index 63d97a15ffde..68e9ae96cbd4 100644
> --- a/fs/fuse/fuse_i.h
> +++ b/fs/fuse/fuse_i.h
> @@ -755,6 +755,9 @@ struct fuse_conn {
>  	/* Auto-mount submounts announced by the server */
>  	unsigned int auto_submounts:1;
>  
> +	/* Propagate syncfs() to server */
> +	unsigned int sync_fs:1;
> +
>  	/** The number of requests waiting for completion */
>  	atomic_t num_waiting;
>  
> diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
> index b0e18b470e91..425d567a06c5 100644
> --- a/fs/fuse/inode.c
> +++ b/fs/fuse/inode.c
> @@ -506,6 +506,34 @@ static int fuse_statfs(struct dentry *dentry, struct kstatfs *buf)
>  	return err;
>  }
>  
> +static int fuse_sync_fs(struct super_block *sb, int wait)
> +{
> +	struct fuse_mount *fm = get_fuse_mount_super(sb);
> +	struct fuse_conn *fc = fm->fc;
> +	struct fuse_syncfs_in inarg;
> +	FUSE_ARGS(args);
> +	int err;
> +
> +	if (!fc->sync_fs)
> +		return 0;
> +
> +	memset(&inarg, 0, sizeof(inarg));
> +	inarg.wait = wait;
> +	args.in_numargs = 1;
> +	args.in_args[0].size = sizeof(inarg);
> +	args.in_args[0].value = &inarg;
> +	args.opcode = FUSE_SYNCFS;
> +	args.out_numargs = 0;
> +
> +	err = fuse_simple_request(fm, &args);
> +	if (err == -ENOSYS) {
> +		fc->sync_fs = 0;
> +		err = 0;
> +	}

I was wondering what will happen if older file server does not support
FUSE_SYNCFS. So we will get -ENOSYS and future syncfs commmands will not
be sent.

> +
> +	return err;

Right now we don't propagate this error code all the way to user space.
I think I should post my patch to fix it again.

https://lore.kernel.org/linux-fsdevel/20201221195055.35295-2-vgoyal@redhat.com/

> +}
> +
>  enum {
>  	OPT_SOURCE,
>  	OPT_SUBTYPE,
> @@ -909,6 +937,7 @@ static const struct super_operations fuse_super_operations = {
>  	.put_super	= fuse_put_super,
>  	.umount_begin	= fuse_umount_begin,
>  	.statfs		= fuse_statfs,
> +	.sync_fs	= fuse_sync_fs,
>  	.show_options	= fuse_show_options,
>  };
>  
> diff --git a/fs/fuse/virtio_fs.c b/fs/fuse/virtio_fs.c
> index 4ee6f734ba83..a3c025308743 100644
> --- a/fs/fuse/virtio_fs.c
> +++ b/fs/fuse/virtio_fs.c
> @@ -1441,6 +1441,7 @@ static int virtio_fs_get_tree(struct fs_context *fsc)
>  	fc->release = fuse_free_conn;
>  	fc->delete_stale = true;
>  	fc->auto_submounts = true;
> +	fc->sync_fs = true;
>  
>  	fsc->s_fs_info = fm;
>  	sb = sget_fc(fsc, virtio_fs_test_super, set_anon_super_fc);
> diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
> index 54442612c48b..6e8c3cf3207c 100644
> --- a/include/uapi/linux/fuse.h
> +++ b/include/uapi/linux/fuse.h
> @@ -179,6 +179,9 @@
>   *  7.33
>   *  - add FUSE_HANDLE_KILLPRIV_V2, FUSE_WRITE_KILL_SUIDGID, FATTR_KILL_SUIDGID
>   *  - add FUSE_OPEN_KILL_SUIDGID
> + *
> + *  7.34
> + *  - add FUSE_SYNCFS
>   */
>  
>  #ifndef _LINUX_FUSE_H
> @@ -214,7 +217,7 @@
>  #define FUSE_KERNEL_VERSION 7
>  
>  /** Minor version number of this interface */
> -#define FUSE_KERNEL_MINOR_VERSION 33
> +#define FUSE_KERNEL_MINOR_VERSION 34

I have always wondered what's the usage of minor version and when should
it be bumped up. IIUC, it is there to group features into a minor
version. So that file server (and may be client too) can deny to not
suppor client/server if a certain minimum version is not supported.

So looks like you want to have capability to say it does not support
an older client (<34) beacuse it wants to make sure SYNCFS is supported.
Is that the reason to bump up the minor version or something else.

>  
>  /** The node ID of the root inode */
>  #define FUSE_ROOT_ID 1
> @@ -499,6 +502,7 @@ enum fuse_opcode {
>  	FUSE_COPY_FILE_RANGE	= 47,
>  	FUSE_SETUPMAPPING	= 48,
>  	FUSE_REMOVEMAPPING	= 49,
> +	FUSE_SYNCFS		= 50,
>  
>  	/* CUSE specific operations */
>  	CUSE_INIT		= 4096,
> @@ -957,4 +961,9 @@ struct fuse_removemapping_one {
>  #define FUSE_REMOVEMAPPING_MAX_ENTRY   \
>  		(PAGE_SIZE / sizeof(struct fuse_removemapping_one))
>  
> +struct fuse_syncfs_in {
> +	/* Whether to wait for outstanding I/Os to complete */
> +	uint32_t wait;
> +};
> +

Will it make sense to add a flag and use only one bit to signal whether
wait is required or not. Then rest of the 31bits in future can potentially
be used for something else if need be.

Looks like most of the fuse structures are 64bit aligned (except
fuse_removemapping_in and now fuse_syncfs_in). I am wondering does
it matter if it is 64bit aligned or not.

Vivek

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
